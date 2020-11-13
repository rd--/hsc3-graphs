import Data.List {- base -}
import Data.List.Split {- split -}
import Data.Maybe {- base -}
import System.FilePath {- filepath -}
import System.Process {- process -}
import Text.Printf {- base -}

import qualified Data.Digest.Murmur64 as Murmur64 {- murmur-hash -}

import qualified Music.Theory.Directory as T {- hmt -}

import qualified Sound.SC3 as SC3 {- hsc3 -}
import qualified Sound.SC3.Server.Graphdef as Graphdef {- hsc3 -}

-- > map txt_hash_str ["Digest.Murmur64","txt_hash_str"] == ["44e386f01d5298bf","4e12a613b9e47dbe"]
txt_hash_str :: String -> String
txt_hash_str = printf "%016x" . Murmur64.asWord64 . Murmur64.hash64

-- > txt_file_hash_str "/tmp/st.hs"
txt_file_hash_str :: FilePath -> IO String
txt_file_hash_str = fmap txt_hash_str . readFile

graph_db_dir :: FilePath
graph_db_dir = "/home/rohan/sw/hsc3-graphs/db/"

graph_db_fn :: FilePath -> FilePath
graph_db_fn = (++) graph_db_dir

-- > proc_on_lines split_multiple_fragments ";a\nb\n\n\n;c\nd" == [";a\nb\n",";c\nd\n"]
split_multiple_fragments :: [String] -> [[String]]
split_multiple_fragments = filter (not . null) . splitOn [[]]

drop_post_graph_section :: [String] -> [String]
drop_post_graph_section = takeWhile (not . isInfixOf "----")

proc_on_lines :: ([String] -> [[String]]) -> String -> [String]
proc_on_lines f = map unlines . f . lines

read_file_set_fragments :: [FilePath] -> IO [String]
read_file_set_fragments =
  fmap concat .
  mapM (fmap (proc_on_lines (split_multiple_fragments . drop_post_graph_section)) . readFile)

newline_to_space :: Char -> Char
newline_to_space x = if x == '\n' then ' ' else x

-- > merge_multiple_spaces "x  y   z"
merge_multiple_spaces :: String -> String
merge_multiple_spaces =
  catMaybes .
  snd .
  mapAccumL (\st x -> (x,if x == ' ' && st == ' ' then Nothing else Just x)) '.'

-- > escape_double_quote "x\"y"
escape_double_quote :: String -> String
escape_double_quote = concatMap (\x -> if x == '"' then "\\\"" else [x])

double_quote_to_single_quote :: Char -> Char
double_quote_to_single_quote x = if x == '"' then '\'' else x

question_mark_special_chars :: Char -> Char
question_mark_special_chars x = if x `elem` "\"\\" then '?' else x

text_prefix :: Int -> String -> String
text_prefix k =
  take k .
  map question_mark_special_chars . -- not escape since text may then end with \
  merge_multiple_spaces .
  map newline_to_space

-- * HS

hs_hsc3_dir :: FilePath
hs_hsc3_dir = "/home/rohan/sw/hsc3/"

hs_graph_dir :: FilePath
hs_graph_dir = "/home/rohan/sw/hsc3-graphs/lib/hs/graph/"

hs_help_ugen_dir :: FilePath
hs_help_ugen_dir = "/home/rohan/sw/hsc3/Help/UGen/"

hs_graph_rw_pre :: IO [String]
hs_graph_rw_pre = fmap lines (readFile (hs_hsc3_dir ++ "lib/hsc3-std-imports.hs"))

-- | z = fragment ID, txt = fragment
hs_graph_fragment_rw :: FilePath -> (String,String) -> [String]
hs_graph_fragment_rw out_dir (z,txt) =
  let pfx = [printf "gr_%s :: UGen" z
            ,printf "gr_%s =" z]
      grw = map (" " ++ ) (lines txt)
      sfx = [printf "wr_%s :: IO ()" z
            ,printf "wr_%s = do" z
            ,printf "  putStrLn \"%s %s\"" z (text_prefix 48 txt)
            ,printf "  let sy = synthdef \"%s\" (wrapOut Nothing gr_%s)" z z
            ,printf "  synthdefWrite \"%s\" sy" (out_dir </> z <.> ".scsyndef")]
  in concat [pfx,grw,sfx]

hs_graph_rw_main :: [String] -> [String]
hs_graph_rw_main z_seq =
  let pfx = ["main :: IO ()"
            ,"main = do"]
      ent z = printf "  wr_%s" z
  in concat [pfx,map ent z_seq]

-- hs_graph_fragments_process ["/tmp/st.hs"] "/tmp/"
hs_graph_fragments_process :: [FilePath] -> FilePath -> IO [String]
hs_graph_fragments_process fn_seq out_dir = do
  txt_seq <- read_file_set_fragments fn_seq
  let z_seq = map txt_hash_str txt_seq
      rw_seq = map (hs_graph_fragment_rw out_dir) (zip z_seq txt_seq)
      cpy (z,txt) = writeFile (out_dir </> z <.> "hs") txt
      rw_fn = "/tmp/rw.hs"
  mapM_ cpy (zip z_seq txt_seq)
  pre <- hs_graph_rw_pre
  writeFile rw_fn (unlines (pre ++ concat rw_seq ++ hs_graph_rw_main z_seq))
  _ <- rawSystem "runhaskell" [rw_fn]
  return z_seq

hs_graph_fragments_process_dir :: FilePath -> FilePath -> IO [String]
hs_graph_fragments_process_dir in_dir out_dir = do
  fn <- T.dir_subset [".hs"] in_dir
  hs_graph_fragments_process fn out_dir

-- hs_graph_fragments_process_play "/tmp/st.hs"
hs_graph_fragments_process_play :: FilePath -> IO ()
hs_graph_fragments_process_play fn = do
  z <- hs_graph_fragments_process [fn] "/tmp/"
  let gr_load k = Graphdef.read_graphdef_file ("/tmp" </> k <.> "scsyndef")
  gr <- mapM gr_load z
  mapM_ SC3.audition gr

-- * SC

sc_graph_dir :: FilePath
sc_graph_dir = "/home/rohan/sw/hsc3-graphs/lib/sc/graph/"

sc_graph_fragment_rw :: (String,String) -> [String]
sc_graph_fragment_rw (z,txt) =
  let grw = lines txt
      sfx = [printf ".asSynthDef(name:\"%s\").writeDefFile(dir:\"%s\");" z graph_db_dir
            ,printf "\"%s %s\".postln;" z (text_prefix 48 txt)]
  in concat [grw,sfx]

sc_graph_fragment_process :: [FilePath] -> IO ()
sc_graph_fragment_process fn_seq = do
  txt_seq <- read_file_set_fragments fn_seq
  let z_seq = map txt_hash_str txt_seq
      rw_seq = map sc_graph_fragment_rw (zip z_seq txt_seq)
      cpy (z,txt) = writeFile (graph_db_fn (z <.> "scd")) txt
      rw_fn = "/tmp/rw.scd"
  mapM_ cpy (zip z_seq txt_seq)
  writeFile rw_fn (unlines (concat rw_seq ++ ["0.exit"]))
  _ <- rawSystem "sclang" [rw_fn]
  return ()

sc_graph_fragment_process_dir :: FilePath -> IO ()
sc_graph_fragment_process_dir dir = do
  fn <- T.dir_subset [".scd"] dir
  sc_graph_fragment_process fn

-- * SCHEME/LISP

rsc3_help_graph_dir :: FilePath
rsc3_help_graph_dir = "/home/rohan/sw/rsc3/help/graph/"

rsc3_help_ugen_dir :: FilePath
rsc3_help_ugen_dir = "/home/rohan/sw/rsc3/help/ugen/"

lisp_graph_rw_pre :: [String]
lisp_graph_rw_pre =
  ["(import (rhs) (sosc) (rsc3) (rsc3 lang))"]

lisp_graph_fragment_rw :: (String,String) -> [String]
lisp_graph_fragment_rw (z,txt) =
  [printf "(display \"%s %s\")(newline)" z (text_prefix 48 txt)
  ,printf "(synthdef-write (synthdef \"%s\" (out (ctl ir \"out\" 0)" z
  ,printf " %s)) \"%s\")" txt (graph_db_fn (z <.> ".scsyndef"))]

lisp_graph_fragment_process :: [FilePath] -> IO ()
lisp_graph_fragment_process fn_seq = do
  txt_seq <- read_file_set_fragments fn_seq
  let z_seq = map txt_hash_str txt_seq
      rw_seq = map lisp_graph_fragment_rw (zip z_seq txt_seq)
      cpy (z,txt) = writeFile (graph_db_fn (z <.> "lisp")) txt
      rw_fn = "/tmp/rw.lisp"
  mapM_ cpy (zip z_seq txt_seq)
  writeFile rw_fn (unlines (lisp_graph_rw_pre ++ concat rw_seq ++ ["(exit)"]))
  _ <- rawSystem "ikarus" [rw_fn]
  return ()

lisp_graph_fragment_process_dir :: FilePath -> IO ()
lisp_graph_fragment_process_dir dir = do
  fn <- T.dir_subset [".lisp",".scm"] dir
  lisp_graph_fragment_process fn

-- * FS

fs_help_graph_dir :: FilePath
fs_help_graph_dir = "/home/rohan/sw/hsc3-forth/help/graph/"

fs_graph_fragment_rw :: (String,String) -> [String]
fs_graph_fragment_rw (z,txt) =
  let grw = lines txt
      sfx = [printf "s\" %s\" s\" %s\" write-synthdef" z (graph_db_dir </> z <.> "scsyndef")
            ,printf "s\" %s %s\" type" z (text_prefix 48 txt)]
  in concat [grw,sfx]

fs_graph_fragment_process :: [FilePath] -> IO ()
fs_graph_fragment_process fn_seq = do
  txt_seq <- read_file_set_fragments fn_seq
  let z_seq = map txt_hash_str txt_seq
      rw_seq = map fs_graph_fragment_rw (zip z_seq txt_seq)
      cpy (z,txt) = writeFile (graph_db_fn (z <.> "fs")) txt
      rw_fn = "/tmp/rw.fs"
      rw_text = unlines (concat rw_seq ++ ["bye"])
  mapM_ cpy (zip z_seq txt_seq)
  writeFile rw_fn rw_text
  _ <- readCreateProcess (proc "hsc3-forth" []) rw_text
  return ()

fs_graph_fragment_process_dir :: FilePath -> IO ()
fs_graph_fragment_process_dir dir = do
  fn <- T.dir_subset [".fs"] dir
  fs_graph_fragment_process fn

-- * MAIN

main :: IO ()
main = do
  _ <- hs_graph_fragments_process_dir hs_graph_dir graph_db_dir
  _ <- hs_graph_fragments_process_dir hs_help_ugen_dir graph_db_dir
  sc_graph_fragment_process_dir sc_graph_dir
  lisp_graph_fragment_process_dir rsc3_help_graph_dir
  lisp_graph_fragment_process_dir rsc3_help_ugen_dir
  fs_graph_fragment_process_dir fs_help_graph_dir
