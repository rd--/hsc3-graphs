import Data.List {- base -}
import Data.List.Split {- split -}
import Data.Maybe {- base -}
import System.Directory {- directory -}
import System.Environment {- base -}
import System.FilePath {- filepath -}
import System.Process {- process -}
import Text.Printf {- base -}

import qualified Data.Digest.Murmur64 as Murmur64 {- murmur-hash -}

import qualified Music.Theory.Directory as T {- hmt-base -}

import qualified Sound.SC3 as SC3 {- hsc3 -}
import qualified Sound.SC3.Server.Graphdef as Graphdef {- hsc3 -}
import qualified Sound.SC3.Server.Graphdef.Read as Graphdef.Read {- hsc3 -}

import qualified Sound.SC3.UGen.Dot as Dot {- hsc3-dot -}

import qualified Sound.SC3.Lisp.Haskell as Lisp {- hsc3-lisp -}

-- * Util

-- | Generate the 16-character hex string of the Murmur-64 hash of the input string.
--
-- > map txt_hash_str ["Digest.Murmur64","txt_hash_str"] == ["44e386f01d5298bf","4e12a613b9e47dbe"]
txt_hash_str :: String -> String
txt_hash_str = printf "%016x" . Murmur64.asWord64 . Murmur64.hash64

-- * Fragments

-- | Apply line function at string.
on_lines :: ([String] -> [[String]]) -> String -> [String]
on_lines f = map unlines . f . lines

-- | Split text into fragments at empty lines.
--
-- > on_lines split_multiple_fragments ";a\nb\n\n\n;c\nd" == [";a\nb\n",";c\nd\n"]
split_multiple_fragments :: [String] -> [[String]]
split_multiple_fragments = filter (not . null) . splitOn [[]]

-- | The text ---- indicates the end of graph fragments.
drop_post_graph_section :: [String] -> [String]
drop_post_graph_section = takeWhile (not . isInfixOf "----")

-- | Read text fragments from file.
read_file_fragments :: FilePath -> IO [String]
read_file_fragments = fmap (on_lines (split_multiple_fragments . drop_post_graph_section)) . readFile

-- | Read text fragments from set of files.
read_file_set_fragments :: [FilePath] -> IO [String]
read_file_set_fragments = fmap concat . mapM read_file_fragments

-- * Text prefix

-- | '\n' to ' ' else id
newline_to_space :: Char -> Char
newline_to_space x = if x == '\n' then ' ' else x

-- | Replace sequences of consecutive spaces with single spaces.
--
-- > merge_multiple_spaces "x  y   z" == "x y z"
merge_multiple_spaces :: String -> String
merge_multiple_spaces =
  let f st x = (x,if x == ' ' && st == ' ' then Nothing else Just x)
  in catMaybes . snd . mapAccumL f '.'

-- | Replace special characers with '?'
question_mark_special_chars :: Char -> Char
question_mark_special_chars x = if x `elem` "\"\\" then '?' else x

-- | Make prefix summary string of text file.
text_prefix :: Int -> String -> String
text_prefix k =
  take k .
  map question_mark_special_chars .
  merge_multiple_spaces .
  map newline_to_space

{-
import qualified System.IO.Strict as Strict {- strict -}

text_file_prefix :: Int -> FilePath -> IO String
text_file_prefix k = fmap (text_prefix k) . Strict.readFile

graphs_db_fext :: [String]
graphs_db_fext = words ".fs .hs .scd .scm .st"
-}

-- * DB

-- | DB directory
--
-- > fn <- T.dir_subset graphs_db_fext graphs_db_dir
-- > length fn == 3062
-- > pfx <- mapM (text_file_prefix 48) fn
graphs_db_dir :: FilePath
graphs_db_dir = "/home/rohan/sw/hsc3-graphs/db/"

graphs_db_fn :: FilePath -> FilePath
graphs_db_fn = (++) graphs_db_dir

-- * Haskell

hs_hsc3_dir :: IO FilePath
hs_hsc3_dir = getEnv "HSC3_DIR"

hs_hsc3_typ_imports :: String -> IO FilePath
hs_hsc3_typ_imports typ = do
  dir <- hs_hsc3_dir
  return (dir </> "lib/hsc3-" ++ typ ++ "-imports.hs")

hs_graph_rw_pre :: String -> IO [String]
hs_graph_rw_pre typ = hs_hsc3_typ_imports typ >>= fmap lines . readFile

-- | sy_dir = scsyndef directory, z = fragment ID, txt = fragment
hs_graph_fragment_rw :: FilePath -> (String,String) -> [String]
hs_graph_fragment_rw sy_dir (z,txt) =
  let pfx = [printf "gr_%s :: UGen" z
            ,printf "gr_%s =" z]
      grw = map (" " ++ ) (lines txt)
      sfx = [printf "wr_%s :: IO ()" z
            ,printf "wr_%s = do" z
            ,printf "  putStrLn \"%s %s\"" z (text_prefix 48 txt)
            ,printf "  let sy = synthdef \"%s\" (wrapOut Nothing gr_%s)" z z
            ,printf "  synthdefWrite \"%s\" sy" (sy_dir </> z <.> ".scsyndef")]
  in concat [pfx,grw,sfx]

hs_graph_rw_main :: [String] -> [String]
hs_graph_rw_main z_seq =
  let pfx = ["main :: IO ()"
            ,"main = do"]
      ent z = printf "  wr_%s" z
  in concat [pfx,map ent z_seq]

-- | ztxt is [(src-text-hash,src-text)]
hs_graph_fragments_process_z :: String -> [(String,String)] -> FilePath -> IO ()
hs_graph_fragments_process_z typ ztxt sy_dir = do
  tmp <- getTemporaryDirectory
  let z_seq = map fst ztxt
      rw_seq = map (hs_graph_fragment_rw sy_dir) ztxt
      rw_fn = tmp </> "rw.hs"
  pre <- hs_graph_rw_pre typ
  writeFile rw_fn (unlines (pre ++ concat rw_seq ++ hs_graph_rw_main z_seq))
  _ <- rawSystem "runhaskell" [rw_fn]
  return ()

hs_graph_fragments_process :: String -> [FilePath] -> FilePath -> IO [String]
hs_graph_fragments_process typ fn_seq out_dir = do
  txt_seq <- read_file_set_fragments fn_seq
  let z_seq = map txt_hash_str txt_seq
      cpy (z,txt) = writeFile (out_dir </> z <.> "hs") txt
  mapM_ cpy (zip z_seq txt_seq)
  hs_graph_fragments_process_z typ (zip z_seq txt_seq) out_dir
  return z_seq

hs_graph_fragments_process_dir :: String -> FilePath -> IO [String]
hs_graph_fragments_process_dir typ in_dir = do
  fn <- T.dir_subset [".hs"] in_dir
  hs_graph_fragments_process typ fn graphs_db_dir

-- > hs_graph_fragments_process_load "/tmp/st.hs"
hs_graph_fragments_process_load :: String -> FilePath -> IO [Graphdef.Graphdef]
hs_graph_fragments_process_load typ fn = do
  tmp <- getTemporaryDirectory
  z <- hs_graph_fragments_process typ [fn] tmp
  let gr_load k = Graphdef.read_graphdef_file (tmp </> k <.> "scsyndef")
  mapM gr_load z

hs_graph_fragments_process_play :: String -> FilePath -> IO ()
hs_graph_fragments_process_play typ fn =
  hs_graph_fragments_process_load typ fn >>=
  mapM_ SC3.audition

hs_graph_fragments_process_draw :: String -> FilePath -> IO ()
hs_graph_fragments_process_draw typ fn =
  hs_graph_fragments_process_load typ fn >>=
  mapM_ (Dot.draw . snd . Graphdef.Read.graphdef_to_graph)

hs_graph_fragments_process_dump_ugens :: String -> FilePath -> IO ()
hs_graph_fragments_process_dump_ugens typ fn =
  hs_graph_fragments_process_load typ fn >>=
  mapM_ Graphdef.graphdef_dump_ugens

-- * SuperCollider

scd_graph_fragment_rw :: (String,String) -> [String]
scd_graph_fragment_rw (z,txt) =
  let grw = lines txt
      sfx = [printf ".asSynthDef(name:\"%s\").writeDefFile(dir:\"%s\");" z graphs_db_dir
            ,printf "\"%s %s\".postln;" z (text_prefix 48 txt)]
  in concat [grw,sfx]

scd_graph_fragment_process :: [FilePath] -> IO ()
scd_graph_fragment_process fn_seq = do
  tmp <- getTemporaryDirectory
  txt_seq <- read_file_set_fragments fn_seq
  let z_seq = map txt_hash_str txt_seq
      rw_seq = map scd_graph_fragment_rw (zip z_seq txt_seq)
      cpy (z,txt) = writeFile (graphs_db_fn (z <.> "scd")) txt
      rw_fn = tmp </> "rw.scd"
  mapM_ cpy (zip z_seq txt_seq)
  writeFile rw_fn (unlines (concat rw_seq ++ ["0.exit"]))
  _ <- rawSystem "sclang" [rw_fn]
  return ()

scd_graph_fragment_process_dir :: FilePath -> IO ()
scd_graph_fragment_process_dir dir = do
  fn <- T.dir_subset [".scd"] dir
  scd_graph_fragment_process fn

-- * Scheme

scm_graph_rw_pre :: [String]
scm_graph_rw_pre =
  ["(import (rnrs) (rhs core) (sosc core) (rsc3 core) (rsc3 server) (rsc3 ugen) (rsc3 lang) (rsc3 arf))"]

scm_graph_fragment_rw :: (String,String) -> [String]
scm_graph_fragment_rw (z,txt) =
  [printf "(display \"%s %s\")(newline)" z (text_prefix 48 txt)
  ,printf "(synthdefWrite (synthdef \"%s\" (Out (ctl ir \"out\" 0)" z
  ,printf " %s)) \"%s\")" txt (graphs_db_fn (z <.> ".scsyndef"))]

scm_graph_fragment_process :: String -> [FilePath] -> IO ()
scm_graph_fragment_process ext fn_seq = do
  tmp <- getTemporaryDirectory
  tbl <- Lisp.name_tbl_load "/home/rohan/sw/hsc3-lisp/lib/sch-name-tbl.text"
  pre_txt_seq <- read_file_set_fragments fn_seq
  let post_txt_seq = map (if ext == ".sch" then Lisp.hs_exp_to_lisp tbl else id) pre_txt_seq
      z_seq = map txt_hash_str pre_txt_seq
      rw_seq = map scm_graph_fragment_rw (zip z_seq post_txt_seq)
      cpy (z,txt) = writeFile (graphs_db_fn (z ++ ext)) txt
      rw_fn = tmp </> "rw.scm"
  mapM_ cpy (zip z_seq pre_txt_seq)
  writeFile rw_fn (unlines (scm_graph_rw_pre ++ concat rw_seq ++ ["(exit)"]))
  --_ <- rawSystem "guile" ["--r6rs",rw_fn] -- "--no-auto-compile" -- this alters results...
  _ <- rawSystem "ikarus" [rw_fn]
  return ()

scm_graph_fragment_process_dir :: String -> FilePath -> IO ()
scm_graph_fragment_process_dir ext dir = do
  fn <- T.dir_subset [ext] dir
  scm_graph_fragment_process ext fn

-- * Forth

fs_graph_fragment_rw :: (String,String) -> [String]
fs_graph_fragment_rw (z,txt) =
  let grw = lines txt
      sfx = [printf "s\" %s\" s\" %s\" write-synthdef" z (graphs_db_dir </> z <.> "scsyndef")
            ,printf "s\" %s %s\" type" z (text_prefix 48 txt)]
  in concat [grw,sfx]

fs_graph_fragment_process :: [FilePath] -> IO ()
fs_graph_fragment_process fn_seq = do
  tmp <- getTemporaryDirectory
  txt_seq <- read_file_set_fragments fn_seq
  let z_seq = map txt_hash_str txt_seq
      rw_seq = map fs_graph_fragment_rw (zip z_seq txt_seq)
      cpy (z,txt) = writeFile (graphs_db_fn (z <.> "fs")) txt
      rw_fn = tmp </> "rw.fs"
      rw_text = unlines (concat rw_seq ++ ["bye"])
  mapM_ cpy (zip z_seq txt_seq)
  writeFile rw_fn rw_text
  _ <- readCreateProcess (proc "hsc3-forth" []) rw_text
  return ()

fs_graph_fragment_process_dir :: FilePath -> IO ()
fs_graph_fragment_process_dir dir = do
  fn <- T.dir_subset [".fs"] dir
  fs_graph_fragment_process fn

-- * Smalltalk

-- | z = fragment ID, txt = fragment
st_graph_fragment_rw :: FilePath -> (String,String) -> [String]
st_graph_fragment_rw out_dir (z,txt) =
  let pfx = ["["]
      sfx = [printf "] value writeHaskellTo: '%s/%s.hs' ." out_dir z]
  in concat [pfx,lines txt,sfx]

st_graph_fragment_process :: [FilePath] -> IO [String]
st_graph_fragment_process fn_seq = do
  tmp <- getTemporaryDirectory
  txt_seq <- read_file_set_fragments fn_seq
  let z_seq = map txt_hash_str txt_seq
      rw_seq = map (st_graph_fragment_rw tmp) (zip z_seq txt_seq)
      cpy (z,txt) = writeFile (graphs_db_fn (z <.> "st")) txt
      rw_fn = tmp </> "rw.st"
      rw_text = unlines (concat rw_seq)
  mapM_ cpy (zip z_seq txt_seq)
  writeFile rw_fn rw_text
  _ <- rawSystem "pharo-cli.sh" [rw_fn]
  return z_seq

st_proc_hs_files :: String -> [String] -> FilePath -> IO ()
st_proc_hs_files typ z_seq sy_dir = do
  tmp <- getTemporaryDirectory
  txt_seq <- mapM (\z -> readFile (tmp </> z <.> "hs")) z_seq
  hs_graph_fragments_process_z typ (zip z_seq txt_seq) sy_dir

st_graph_fragment_process_dir :: String -> FilePath -> IO ()
st_graph_fragment_process_dir typ dir = do
  fn <- T.dir_subset [".st"] dir
  z_seq <- st_graph_fragment_process fn
  st_proc_hs_files typ z_seq graphs_db_dir

-- * Scala

-- | z = fragment ID, txt = fragment
scala_graph_fragment_rw :: FilePath -> (String,String) -> [String]
scala_graph_fragment_rw out_dir (z,txt) =
  let pfx = [printf "val gr_%s = graph {" z]
      sfx = ["};"
            ,printf "val sy_%s = SynthDef(name = \"%s\") {gr_%s.result.close(in = gr_%s.peer(), fadeTime = 0.02)}" z z z z
            ,printf "sy_%s.write(dir = \"%s\", overwrite = true);" z out_dir]
  in concat [pfx,lines txt,sfx]

scala_graph_fragment_process :: [FilePath] -> IO [String]
scala_graph_fragment_process fn_seq = do
  tmp <- getTemporaryDirectory
  txt_seq <- read_file_set_fragments fn_seq
  let z_seq = map txt_hash_str txt_seq
      rw_seq = map (scala_graph_fragment_rw graphs_db_dir) (zip z_seq txt_seq)
      cpy (z,txt) = writeFile (graphs_db_fn (z <.> "scala")) txt
      rw_fn = tmp </> "rw.scala"
      rw_text = unlines (concat rw_seq)
  mapM_ cpy (zip z_seq txt_seq)
  writeFile rw_fn rw_text
  _ <- rawSystem "scalacollider-cli.sh" [rw_fn]
  return z_seq

scala_graph_fragment_process_dir :: FilePath -> IO ()
scala_graph_fragment_process_dir dir = do
  fn <- T.dir_subset [".scala"] dir
  _ <- scala_graph_fragment_process fn
  return ()

-- * Polyglot

graphs_db_polyglot_autogen :: IO ()
graphs_db_polyglot_autogen = do
  _ <- hs_graph_fragments_process_dir "std" "/home/rohan/sw/hsc3/Help/Graph/"
  _ <- hs_graph_fragments_process_dir "std" "/home/rohan/sw/hsc3/Help/UGen/"
  _ <- hs_graph_fragments_process_dir "std" "/home/rohan/sw/hsc3-unsafe/help/ugen/"
  _ <- hs_graph_fragments_process_dir "std" "/home/rohan/sw/hsc3-unsafe/help/graph/"
  scd_graph_fragment_process_dir "/home/rohan/sw/hsc3-graphs/lib/scd/graph/"
  scd_graph_fragment_process_dir "/home/rohan/sw/hsc3-graphs/lib/scd/collect/"
  scm_graph_fragment_process_dir ".scm" "/home/rohan/sw/rsc3/help/graph/"
  scm_graph_fragment_process_dir ".scm" "/home/rohan/sw/rsc3/help/ugen/"
  scm_graph_fragment_process_dir ".scm" "/home/rohan/sw/rsc3-arf/help/graph/"
  scm_graph_fragment_process_dir ".scm" "/home/rohan/sw/rsc3-arf/help/ugen/"
  scm_graph_fragment_process_dir ".sch" "/home/rohan/sw/rsc3/help/graph/"
  scm_graph_fragment_process_dir ".sch" "/home/rohan/sw/rsc3-arf/help/graph/"
  fs_graph_fragment_process_dir "/home/rohan/sw/hsc3-forth/help/graph/"
  st_graph_fragment_process_dir "min" "/home/rohan/sw/stsc3/help/graph/"
  st_graph_fragment_process_dir "min" "/home/rohan/sw/stsc3/help/ugen/"
  scala_graph_fragment_process_dir "/home/rohan/sw/hsc3-graphs/lib/scala/graph/"
  return ()

-- * Main

help :: [String]
help =
    ["hsc3-graphs command [arguments]"
    ," db polyglot autogen"
    ," fragments {hs} {min | std} {play | draw | dump-ugens} FILE-NAME"
    ]

main :: IO ()
main = do
  a <- getArgs
  case a of
    ["db","polyglot","autogen"] -> graphs_db_polyglot_autogen
    ["fragments","hs",typ,"play",fn] -> hs_graph_fragments_process_play typ fn
    ["fragments","hs",typ,"draw",fn] -> hs_graph_fragments_process_draw typ fn
    ["fragments","hs",typ,"dump-ugens",fn] -> hs_graph_fragments_process_dump_ugens typ fn
    _ -> putStrLn (unlines help)
