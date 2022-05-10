-- | Polyglot SuperCollider
module Sound.SC3.Graphs.Polyglot where

import Data.List {- base -}
import Data.Maybe {- base -}
import System.Directory {- directory -}
import System.Environment {- base -}
import System.FilePath {- filepath -}
import System.Process {- process -}
import Text.Printf {- base -}

import qualified Data.List.Split as Split {- split -}

import qualified Data.Digest.Murmur64 as Murmur64 {- murmur-hash -}

import qualified Music.Theory.Directory as T {- hmt-base -}

import qualified Sound.SC3 as SC3 {- hsc3 -}
import qualified Sound.SC3.Common.Help as Help {- hsc3 -}
import qualified Sound.SC3.Server.Graphdef as Graphdef {- hsc3 -}
import qualified Sound.SC3.Server.Graphdef.Binary as  Graphdef.Binary {- hsc3 -}
import qualified Sound.SC3.Server.Graphdef.IO as  Graphdef.IO {- hsc3 -}
import qualified Sound.SC3.Server.Graphdef.Read as Graphdef.Read {- hsc3 -}

import qualified Sound.SC3.UGen.Dot as Dot {- hsc3-dot -}

import qualified Sound.SC3.Lisp.Haskell as Lisp {- hsc3-lisp -}
import qualified Sound.SC3.Lisp.NameTable as Lisp {- hsc3-lisp -}

import qualified Language.Smalltalk.SuperCollider.Translate as St {- stsc3 -}

-- * Util

-- | Generate the 16-character hex string of the Murmur-64 hash of the input string.
--
-- > map txt_hash_str ["Digest.Murmur64","txt_hash_str"] == ["44e386f01d5298bf","4e12a613b9e47dbe"]
txt_hash_str :: String -> String
txt_hash_str = printf "%016x" . Murmur64.asWord64 . Murmur64.hash64

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

-- > pfx <- mapM (text_file_prefix 48) fn
text_file_prefix :: Int -> FilePath -> IO String
text_file_prefix k = fmap (text_prefix k) . Strict.readFile
-}

-- * DB

graphs_db_fext :: [String]
graphs_db_fext = words ".fs .hs .scala .scd .sch .scm .st .stc"

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
  txt_seq <- Help.read_file_set_fragments fn_seq
  let z_seq = map txt_hash_str txt_seq
      cpy (z,txt) = writeFile (out_dir </> z <.> "hs") txt
  mapM_ cpy (zip z_seq txt_seq)
  hs_graph_fragments_process_z typ (zip z_seq txt_seq) out_dir
  return z_seq

hs_graph_fragments_process_dir :: String -> FilePath -> FilePath -> IO ()
hs_graph_fragments_process_dir typ out_dir in_dir = do
  fn <- T.dir_subset [".hs"] in_dir
  _ <- hs_graph_fragments_process typ fn out_dir
  return ()

-- > hs_graph_fragments_process_load "/tmp/st.hs"
hs_graph_fragments_process_load :: String -> FilePath -> IO [Graphdef.Graphdef]
hs_graph_fragments_process_load typ fn = do
  tmp <- getTemporaryDirectory
  z <- hs_graph_fragments_process typ [fn] tmp
  let gr_load k = Graphdef.IO.read_graphdef_file (tmp </> k <.> "scsyndef")
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

scd_graph_fragment_rw :: FilePath -> (String,String) -> [String]
scd_graph_fragment_rw out_dir (z,txt) =
  let grw = "{" : lines txt ++ ["}"]
      sfx = [printf ".asSynthDef(name:\"%s\").writeDefFile(dir:\"%s\");" z out_dir
            ,printf "\"%s %s\".postln;" z (text_prefix 48 txt)]
  in concat [grw,sfx]

scd_graph_fragment_process_seq :: FilePath -> [String] -> IO ()
scd_graph_fragment_process_seq out_dir txt_seq = do
  tmp <- getTemporaryDirectory
  let z_seq = map txt_hash_str txt_seq
      rw_seq = map (scd_graph_fragment_rw out_dir) (zip z_seq txt_seq)
      cpy (z,txt) = writeFile (out_dir </> z <.> "scd") txt
      rw_fn = tmp </> "rw.scd"
  mapM_ cpy (zip z_seq txt_seq)
  writeFile rw_fn (unlines (concat rw_seq ++ ["0.exit"]))
  _ <- rawSystem "sclang" [rw_fn]
  return ()

-- | sclang won't process more than 255 statements in one file.
scd_graph_fragment_process :: FilePath -> [FilePath] -> IO ()
scd_graph_fragment_process out_dir fn_seq = do
  txt_seq <- Help.read_file_set_fragments fn_seq
  mapM_ (scd_graph_fragment_process_seq out_dir) (Split.chunksOf 250 txt_seq)

scd_graph_fragment_process_dir :: FilePath -> FilePath -> IO ()
scd_graph_fragment_process_dir out_dir in_dir = do
  fn <- T.dir_subset [".scd"] in_dir
  scd_graph_fragment_process out_dir fn

-- * Scheme

scm_graph_rw_pre :: [String]
scm_graph_rw_pre =
  ["(import (rnrs) (rhs core) (sosc core) (rsc3 core) (rsc3 server) (rsc3 ugen) (rsc3 lang) (rsc3 arf))"]

scm_graph_fragment_rw :: FilePath -> (String,String) -> [String]
scm_graph_fragment_rw out_dir (z,txt) =
  [printf "(display \"%s %s\")(newline)" z (text_prefix 48 txt)
  ,printf "(synthdefWrite (synthdef \"%s\" (Out (ctl ir \"out\" 0)" z
  ,printf " %s)) \"%s\")" txt (out_dir </> z <.> ".scsyndef")]

scm_graph_fragment_process :: Lisp.NameTable -> String -> FilePath -> [FilePath] -> IO ()
scm_graph_fragment_process sch_tbl ext out_dir fn_seq = do
  tmp <- getTemporaryDirectory
  pre_txt_seq <- Help.read_file_set_fragments fn_seq
  let post_txt_seq = map (if ext == ".sch" then Lisp.hs_exp_to_lisp sch_tbl else id) pre_txt_seq
      z_seq = map txt_hash_str pre_txt_seq
      rw_seq = map (scm_graph_fragment_rw out_dir) (zip z_seq post_txt_seq)
      cpy (z,txt) = writeFile (out_dir </> z <.> ext) txt
      rw_fn = tmp </> "rw.scm"
  mapM_ cpy (zip z_seq pre_txt_seq)
  writeFile rw_fn (unlines (scm_graph_rw_pre ++ concat rw_seq ++ ["(exit)"]))
  --_ <- rawSystem "guile" ["--r6rs",rw_fn] -- "--no-auto-compile" -- this alters results...
  _ <- rawSystem "ikarus" [rw_fn]
  return ()

scm_graph_fragment_process_dir :: Lisp.NameTable -> String -> FilePath -> FilePath -> IO ()
scm_graph_fragment_process_dir sch_tbl ext out_dir in_dir = do
  fn <- T.dir_subset [ext] in_dir
  scm_graph_fragment_process sch_tbl ext out_dir fn

-- * Forth

fs_graph_fragment_rw :: FilePath -> (String,String) -> [String]
fs_graph_fragment_rw out_dir (z,txt) =
  let grw = lines txt
      sfx = [printf "s\" %s\" s\" %s\" writeSynthdef" z (out_dir </> z <.> "scsyndef")
            ,printf "s\" %s %s\" type" z (text_prefix 48 txt)]
  in concat [grw,sfx]

fs_graph_fragment_process :: FilePath -> [FilePath] -> IO ()
fs_graph_fragment_process out_dir fn_seq = do
  tmp <- getTemporaryDirectory
  txt_seq <- Help.read_file_set_fragments fn_seq
  let z_seq = map txt_hash_str txt_seq
      rw_seq = map (fs_graph_fragment_rw out_dir) (zip z_seq txt_seq)
      cpy (z,txt) = writeFile (out_dir </> z <.> "fs") txt
      rw_fn = tmp </> "rw.fs"
      rw_text = unlines (concat rw_seq ++ ["bye"])
  mapM_ cpy (zip z_seq txt_seq)
  writeFile rw_fn rw_text
  _ <- readCreateProcess (proc "hsc3-forth" []) rw_text
  return ()

fs_graph_fragment_process_dir :: FilePath -> FilePath -> IO ()
fs_graph_fragment_process_dir out_dur in_dir = do
  fn <- T.dir_subset [".fs"] in_dir
  fs_graph_fragment_process out_dur fn

-- * Smalltalk

-- | z = fragment ID, txt = fragment.
st_graph_fragment_rw :: FilePath -> (String,String) -> [String]
st_graph_fragment_rw out_dir (z,txt) =
  let pfx = ["Sc3 writeSyndefOf: (["]
      sfx = [printf "] value) to: '%s/%s.scsyndef.text' ." out_dir z]
  in concat [pfx,lines txt,sfx]

st_graph_fragment_process :: String -> FilePath -> [FilePath] -> IO [String]
st_graph_fragment_process ext out_dir fn_seq = do
  tmp <- getTemporaryDirectory
  pre_txt_seq <- Help.read_file_set_fragments fn_seq
  let post_txt_seq = map (if ext == ".stc" then St.stcToSt else id) pre_txt_seq
  let z_seq = map txt_hash_str pre_txt_seq
      rw_seq = map (st_graph_fragment_rw tmp) (zip z_seq post_txt_seq)
      cpy (z,txt) = writeFile (out_dir </> z <.> ext) txt
      rw_fn = tmp </> "rw.st"
      rw_text = unlines (concat rw_seq)
  mapM_ cpy (zip z_seq pre_txt_seq)
  writeFile rw_fn rw_text
  let st_cmd = "gst" -- "pharo-cli.sh"
  _ <- rawSystem st_cmd [rw_fn]
  return z_seq

text_scsyndef_to_scsyndef :: FilePath -> FilePath -> IO ()
text_scsyndef_to_scsyndef txt_fn bin_fn = do
  gr <- Graphdef.IO.read_graphdef_file txt_fn
  Graphdef.Binary.graphdefWrite bin_fn gr

st_proc_syndef_files :: [String] -> FilePath -> IO ()
st_proc_syndef_files z_seq sy_dir = do
  tmp_dir <- getTemporaryDirectory
  let f z = text_scsyndef_to_scsyndef (tmp_dir </> z <.> "scsyndef.text") (sy_dir </> z <.> "scsyndef")
  mapM_ f z_seq

{-
> st_graph_fragment_process_dir ".st" "/tmp/" "/home/rohan/sw/stsc3/help/graph/"
> st_graph_fragment_process_dir ".stc" "/tmp/" "/home/rohan/sw/stsc3/help/graph/"
-}
st_graph_fragment_process_dir :: String -> FilePath -> FilePath -> IO ()
st_graph_fragment_process_dir ext out_dir in_dir = do
  fn <- T.dir_subset [ext] in_dir
  z_seq <- st_graph_fragment_process ext out_dir fn
  st_proc_syndef_files z_seq out_dir

-- * Scala

-- | z = fragment ID, txt = fragment
scala_graph_fragment_rw :: FilePath -> (String,String) -> [String]
scala_graph_fragment_rw out_dir (z,txt) =
  let pfx = [printf "val gr_%s = graph {" z]
      sfx = ["};"
            ,printf "val sy_%s = SynthDef(name = \"%s\") {gr_%s.result.close(in = gr_%s.peer(), fadeTime = 0.02)}" z z z z
            ,printf "sy_%s.write(dir = \"%s\", overwrite = true);" z out_dir]
  in concat [pfx,lines txt,sfx]

scala_graph_fragment_process :: FilePath -> [FilePath] -> IO [String]
scala_graph_fragment_process out_dir fn_seq = do
  tmp <- getTemporaryDirectory
  txt_seq <- Help.read_file_set_fragments fn_seq
  let z_seq = map txt_hash_str txt_seq
      rw_seq = map (scala_graph_fragment_rw out_dir) (zip z_seq txt_seq)
      cpy (z,txt) = writeFile (out_dir </> z <.> "scala") txt
      rw_fn = tmp </> "rw.scala"
      rw_text = unlines (concat rw_seq)
  mapM_ cpy (zip z_seq txt_seq)
  writeFile rw_fn rw_text
  _ <- rawSystem "scalacollider-cli.sh" [rw_fn]
  return z_seq

scala_graph_fragment_process_dir :: FilePath -> FilePath -> IO ()
scala_graph_fragment_process_dir out_dir in_dir = do
  fn <- T.dir_subset [".scala"] in_dir
  _ <- scala_graph_fragment_process out_dir fn
  return ()

-- * Polyglot

graph_fragments_process_dir :: Lisp.NameTable -> String -> FilePath -> FilePath -> IO ()
graph_fragments_process_dir sch_tbl ext =
  case ext of
    ".fs" -> fs_graph_fragment_process_dir
    ".hs" -> hs_graph_fragments_process_dir "std"
    ".scala" -> scala_graph_fragment_process_dir
    ".scd" -> scd_graph_fragment_process_dir
    ".sch" -> scm_graph_fragment_process_dir sch_tbl ".sch"
    ".scm" -> scm_graph_fragment_process_dir sch_tbl ".scm"
    ".st" -> st_graph_fragment_process_dir ".st"
    ".stc" -> st_graph_fragment_process_dir ".stc"
    _ -> error "graph_fragments_process_dir"
