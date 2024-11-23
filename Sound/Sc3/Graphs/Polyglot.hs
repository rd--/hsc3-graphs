-- | Polyglot SuperCollider
module Sound.Sc3.Graphs.Polyglot where

import Control.Monad {- base -}
import Data.Char {- base -}
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

import qualified Sound.Sc3 as Sc3 {- hsc3 -}
import qualified Sound.Sc3.Common.Help as Help {- hsc3 -}
import qualified Sound.Sc3.Server.Graphdef as Graphdef {- hsc3 -}
import qualified Sound.Sc3.Server.Graphdef.Binary as Graphdef.Binary {- hsc3 -}
import qualified Sound.Sc3.Server.Graphdef.Io as Graphdef.Io {- hsc3 -}
import qualified Sound.Sc3.Server.Graphdef.Read as Graphdef.Read {- hsc3 -}

import qualified Sound.Sc3.Ugen.Dot as Dot {- hsc3-dot -}

import qualified Language.Sc3.Lisp.Haskell as Lisp {- hsc3-lisp -}
import qualified Language.Sc3.Lisp.NameTable as Lisp {- hsc3-lisp -}

import qualified Language.Smalltalk.Stc.Translate as St {- stsc3 -}

-- * Util

{- | Generate the 16-character hex string of the Murmur-64 hash of the input string.

>>> map txt_hash_str ["Digest.Murmur64","txt_hash_str"]
["44e386f01d5298bf","4e12a613b9e47dbe"]
-}
txt_hash_str :: String -> String
txt_hash_str = printf "%016x" . Murmur64.asWord64 . Murmur64.hash64

-- * Text prefix

-- | '\n' to ' ' else id
newline_to_space :: Char -> Char
newline_to_space x = if x == '\n' then ' ' else x

{- | Replace sequences of consecutive spaces with single spaces.

>>> merge_multiple_spaces "x  y   z"
"x y z"
-}
merge_multiple_spaces :: String -> String
merge_multiple_spaces =
  let f st x = (x, if x == ' ' && st == ' ' then Nothing else Just x)
  in catMaybes . snd . mapAccumL f '.'

-- | Replace special characers with '?'
question_mark_special_chars :: Char -> Char
question_mark_special_chars x = if x `elem` "\"\\" then '?' else x

-- | Make prefix summary string of text file.
text_prefix :: Int -> String -> String
text_prefix k =
  take k
    . map question_mark_special_chars
    . merge_multiple_spaces
    . map newline_to_space

{-
import qualified System.IO.Strict as Strict {- strict -}

-- > pfx <- mapM (text_file_prefix 48) fn
text_file_prefix :: Int -> FilePath -> IO String
text_file_prefix k = fmap (text_prefix k) . Strict.readFile
-}

-- * Db

graphs_db_fext :: [String]
graphs_db_fext = words ".fs .hs .scala .scd .sch .scm .sl .st"

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
hs_graph_fragment_rw :: FilePath -> (String, String) -> [String]
hs_graph_fragment_rw sy_dir (z, txt) =
  let prefix =
        [ printf "gr_%s :: Ugen" z
        , printf "gr_%s =" z
        ]
      grw = map (" " ++) (lines txt)
      suffix =
        [ printf "wr_%s :: IO ()" z
        , printf "wr_%s = do" z
        , printf "  putStrLn \"%s %s\"" z (text_prefix 48 txt)
        , printf "  let sy = synthdef \"%s\" (wrapOut Nothing gr_%s)" z z
        , printf "  synthdefWrite \"%s\" sy" (sy_dir </> z <.> ".scsyndef")
        ]
  in concat [prefix, grw, suffix]

hs_graph_rw_main :: [String] -> [String]
hs_graph_rw_main z_seq =
  let prefix =
        [ "main :: IO ()"
        , "main = do"
        ]
      ent z = printf "  wr_%s" z
  in concat [prefix, map ent z_seq]

-- | ztxt is [(src-text-hash,src-text)]
hs_graph_fragments_process_z :: String -> [(String, String)] -> FilePath -> IO ()
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
      cpy (z, txt) = writeFile (out_dir </> z <.> "hs") txt
  mapM_ cpy (zip z_seq txt_seq)
  hs_graph_fragments_process_z typ (zip z_seq txt_seq) out_dir
  return z_seq

{- | Hs

> let hs_q x = "/home/rohan/sw/hsc3/Help/" ++ x
> hs_graph_fragments_process_dir_set "std" "/tmp" (map hs_q ["Graph", "Ugen"])
-}
hs_graph_fragments_process_dir_set :: String -> FilePath -> [FilePath] -> IO ()
hs_graph_fragments_process_dir_set typ out_dir in_dir = do
  fn <- mapM (T.dir_subset [".hs"]) in_dir
  _ <- hs_graph_fragments_process typ (concat fn) out_dir
  return ()

-- > hs_graph_fragments_process_load "/tmp/st.hs"
hs_graph_fragments_process_load :: String -> FilePath -> IO [Graphdef.Graphdef]
hs_graph_fragments_process_load typ fn = do
  tmp <- getTemporaryDirectory
  z <- hs_graph_fragments_process typ [fn] tmp
  let gr_load k = Graphdef.Io.read_graphdef_file (tmp </> k <.> "scsyndef")
  mapM gr_load z

hs_graph_fragments_process_play :: String -> FilePath -> IO ()
hs_graph_fragments_process_play typ fn =
  hs_graph_fragments_process_load typ fn
    >>= mapM_ Sc3.audition

hs_graph_fragments_process_draw :: String -> FilePath -> IO ()
hs_graph_fragments_process_draw typ fn =
  hs_graph_fragments_process_load typ fn
    >>= mapM_ (Dot.draw . snd . Graphdef.Read.graphdef_to_graph)

hs_graph_fragments_process_dump_ugens :: String -> FilePath -> IO ()
hs_graph_fragments_process_dump_ugens typ fn =
  hs_graph_fragments_process_load typ fn
    >>= mapM_ Graphdef.graphdef_dump_ugens

-- * SuperCollider

scd_graph_fragment_rw :: FilePath -> (String, String) -> [String]
scd_graph_fragment_rw out_dir (z, txt) =
  let grw = "{" : lines txt ++ ["}"]
      suffix =
        [ printf ".asSynthDef(name:\"%s\").writeDefFile(dir:\"%s\");" z out_dir
        , printf "\"%s %s\".postln;" z (text_prefix 48 txt)
        ]
  in concat [grw, suffix]

scd_graph_fragment_process_seq :: FilePath -> [String] -> IO ()
scd_graph_fragment_process_seq out_dir txt_seq = do
  tmp <- getTemporaryDirectory
  let z_seq = map txt_hash_str txt_seq
      rw_seq = map (scd_graph_fragment_rw out_dir) (zip z_seq txt_seq)
      cpy (z, txt) = writeFile (out_dir </> z <.> "scd") txt
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

{- | Scd

> let sc_q x = "/home/rohan/sw/hsc3-graphs/lib/scd/" ++ x
> scd_graph_fragment_process_dir_set "/tmp" (map sc_q ["graph", "collect"])
> scd_graph_fragment_process_dir_set "/tmp" ["/home/rohan/sw/sc3-rdu/help/scd/"]
-}
scd_graph_fragment_process_dir_set :: FilePath -> [FilePath] -> IO ()
scd_graph_fragment_process_dir_set out_dir in_dir = do
  fn <- mapM (T.dir_subset [".scd"]) in_dir
  scd_graph_fragment_process out_dir (concat fn)

-- * Scheme

scm_graph_rw_pre :: [String]
scm_graph_rw_pre =
  ["(import (rnrs) (rhs core) (sosc core) (rsc3 core) (rsc3 server) (rsc3 ugen) (rsc3 lang))"]

scm_graph_fragment_rw :: FilePath -> (String, String) -> [String]
scm_graph_fragment_rw out_dir (z, txt) =
  [ printf "(display \"%s %s\")(newline)" z (text_prefix 48 txt)
  , printf "(synthdefWrite (synthdef \"%s\" (Out (ctl \"out\" 0)" z
  , printf " %s)) \"%s\")" txt (out_dir </> z <.> ".scsyndef")
  ]

scm_graph_fragment_process :: Lisp.NameTable -> String -> FilePath -> [FilePath] -> IO ()
scm_graph_fragment_process sch_tbl ext out_dir fn_seq = do
  tmp <- getTemporaryDirectory
  pre_txt_seq <- Help.read_file_set_fragments fn_seq
  let post_txt_seq = map (if ext == ".sch" then Lisp.hs_exp_to_lisp sch_tbl else id) pre_txt_seq
      z_seq = map txt_hash_str pre_txt_seq
      rw_seq = map (scm_graph_fragment_rw out_dir) (zip z_seq post_txt_seq)
      cpy (z, txt) = writeFile (out_dir </> z <.> ext) txt
      rw_fn = tmp </> "rw.scm"
  mapM_ cpy (zip z_seq pre_txt_seq)
  writeFile rw_fn (unlines (scm_graph_rw_pre ++ concat rw_seq ++ ["(exit)"]))
  -- _ <- rawSystem "guile" ["--r6rs",rw_fn] -- "--no-auto-compile" -- this alters results...
  _ <- rawSystem "ikarus" [rw_fn]
  return ()

{- | Scm

> let scm_q x = "/home/rohan/sw/rsc3/help/" ++ x
> sch_tbl <- Lisp.nameTableLoad "/home/rohan/sw/hsc3-lisp/lib/sch-name-tbl.text"
> scm_graph_fragment_process_dir_set sch_tbl ".scm" "/tmp" (map scm_q ["graph", "ugen"])
> scm_graph_fragment_process_dir_set sch_tbl ".sch" "/tmp" ["/home/rohan/sw/rsc3/help/graph"]
-}
scm_graph_fragment_process_dir_set :: Lisp.NameTable -> String -> FilePath -> [FilePath] -> IO ()
scm_graph_fragment_process_dir_set sch_tbl ext out_dir in_dir = do
  fn <- mapM (T.dir_subset [ext]) in_dir
  scm_graph_fragment_process sch_tbl ext out_dir (concat fn)

-- * Forth

fs_graph_fragment_rw :: FilePath -> (String, String) -> [String]
fs_graph_fragment_rw out_dir (z, txt) =
  let grw = lines txt
      suffix =
        [ printf "s\" %s\" s\" %s\" writeSynthdef" z (out_dir </> z <.> "scsyndef")
        , printf "s\" %s %s\" type" z (text_prefix 48 txt)
        ]
  in concat [grw, suffix]

fs_graph_fragment_process :: FilePath -> [FilePath] -> IO ()
fs_graph_fragment_process out_dir fn_seq = do
  tmp <- getTemporaryDirectory
  txt_seq <- Help.read_file_set_fragments fn_seq
  let z_seq = map txt_hash_str txt_seq
      rw_seq = map (fs_graph_fragment_rw out_dir) (zip z_seq txt_seq)
      cpy (z, txt) = writeFile (out_dir </> z <.> "fs") txt
      rw_fn = tmp </> "rw.fs"
      rw_text = unlines (concat rw_seq ++ ["bye"])
  mapM_ cpy (zip z_seq txt_seq)
  writeFile rw_fn rw_text
  _ <- readCreateProcess (proc "hsc3-forth" []) rw_text
  return ()

{- | Fs process

> let fs_q x = "/home/rohan/sw/hsc3-forth/help/" ++ x
> fs_graph_fragment_process_dir_set "/tmp" (map fs_q ["graph","ugen"])
-}
fs_graph_fragment_process_dir_set :: FilePath -> [FilePath] -> IO ()
fs_graph_fragment_process_dir_set out_dur in_dir = do
  fn <- mapM (T.dir_subset [".fs"]) in_dir
  fs_graph_fragment_process out_dur (concat fn)

-- * Smalltalk

-- | z = fragment id, txt = fragment
st_graph_fragment_rw :: FilePath -> (String, String) -> [String]
st_graph_fragment_rw out_dir (z, txt) =
  let prefix =
        [ printf "'%s' postln." z
        , printf "Sc3 writeBinarySyndef: '%s' of: (WrapOut bus: 0 channelsArray:  ([" z
        ]
      suffix =
        [printf "] value)) to: '%s/%s.scsyndef' ." out_dir z]
  in concat [prefix, lines txt, suffix]

graph_fragment_process ::
  (String -> String) ->
  (FilePath -> (String, String) -> [String]) ->
  [String] ->
  String ->
  (String, [String]) ->
  FilePath ->
  [FilePath] ->
  IO [String]
graph_fragment_process txt_f rw_f end ext (cmd, arg) out_dir fn_seq = do
  tmp <- getTemporaryDirectory
  pre_txt_seq <- Help.read_file_set_fragments fn_seq
  let post_txt_seq = map txt_f pre_txt_seq
  let z_seq = map txt_hash_str pre_txt_seq
      rw_seq = map (rw_f out_dir) (zip z_seq post_txt_seq)
      cpy (z, txt) = writeFile (out_dir </> z <.> ext) txt
      rw_fn = tmp </> "rw" <.> ext
      rw_text = unlines (concat rw_seq)
  mapM_ cpy (zip z_seq pre_txt_seq)
  writeFile rw_fn (rw_text ++ unlines end)
  _ <- rawSystem cmd (arg ++ [rw_fn])
  return z_seq

st_graph_fragment_process :: String -> FilePath -> [FilePath] -> IO [String]
st_graph_fragment_process ext out_dir fn_seq = do
  let txt_f = if ext == ".sl" then St.splToSt else id
      rw_f = st_graph_fragment_rw
  putStrLn (printf "st_graph_fragment_process: ext=%s" ext)
  graph_fragment_process txt_f rw_f [] ".st" ("gst", []) out_dir fn_seq

text_scsyndef_to_scsyndef :: FilePath -> FilePath -> IO ()
text_scsyndef_to_scsyndef txt_fn bin_fn = do
  gr <- Graphdef.Io.read_graphdef_file txt_fn
  Graphdef.Binary.graphdefWrite bin_fn gr

st_proc_syndef_files :: [String] -> FilePath -> IO ()
st_proc_syndef_files z_seq sy_dir = do
  tmp_dir <- getTemporaryDirectory
  let f z = text_scsyndef_to_scsyndef (tmp_dir </> z <.> "scsyndef.text") (sy_dir </> z <.> "scsyndef")
  mapM_ f z_seq

{- | St graph fragments, process directory

> let st_q x = "/home/rohan/sw/stsc3/help/" ++ x
> st_graph_fragment_process_dir_set ".st" "/tmp" (map st_q ["ugen","graph"])
-}
st_graph_fragment_process_dir_set :: String -> FilePath -> [FilePath] -> IO ()
st_graph_fragment_process_dir_set ext out_dir in_dir = do
  fn <- mapM (T.dir_subset [ext]) in_dir
  z_seq <- st_graph_fragment_process ext out_dir (concat fn)
  when False (st_proc_syndef_files z_seq out_dir) -- if text
  return ()

-- * Spl

-- | z = fragment id, txt = fragment
sl_graph_fragment_rw :: FilePath -> (String, String) -> [String]
sl_graph_fragment_rw out_dir (z, txt) =
  let prefix = [printf "'%s'.postLine;" z, "{"]
      suffix = printf "}.value.writeScSynDefFile('%s', '%s/%s.scsyndef');" z out_dir z
  in concat [prefix, lines txt, [suffix]]

{- | Sl Graph Fragment Process

> sl_graph_fragment_process "/tmp" ["/tmp/rw.sl"]
-}
sl_graph_fragment_process :: FilePath -> [FilePath] -> IO [String]
sl_graph_fragment_process out_dir fn_seq = do
  let txt_f = id
      rw_f = sl_graph_fragment_rw
      cmd = ("spl", ["--lib=StandardLibrary", "--lib=SuperColliderLibrary", "runFile"])
  graph_fragment_process txt_f rw_f ["'end'.postLine;", "system.exit(0)"] ".sl" cmd out_dir fn_seq

sl_is_upper_case :: FilePath -> Bool
sl_is_upper_case = isUpper . head . takeFileName

{- | Sl graph fragments, process directory

> let sl_q x = "/home/rohan/sw/spl/Play/SuperCollider/" ++ x
> let x = "Ugen" -- "Ugen" "Graph" "Graph Collection"
> sl_graph_fragment_process_dir_set (const True) "/tmp" [sl_q x]

> sl_graph_fragment_process_dir_set sl_is_upper_case "/tmp" ["/home/rohan/sw/spl/Help/Reference/"]
-}
sl_graph_fragment_process_dir_set :: (FilePath -> Bool) -> FilePath -> [FilePath] -> IO ()
sl_graph_fragment_process_dir_set which out_dir in_dir = do
  fn <- mapM (T.dir_subset [".help.sl", ".play.sl"]) in_dir
  _ <- sl_graph_fragment_process out_dir (filter which (concat fn))
  return ()

-- * Scala

-- | z = fragment ID, txt = fragment
scala_graph_fragment_rw :: FilePath -> (String, String) -> [String]
scala_graph_fragment_rw out_dir (z, txt) =
  let prefix = [printf "val gr_%s = graph {" z]
      suffix =
        [ "};"
        , printf "val sy_%s = SynthDef(name = \"%s\") {gr_%s.result.close(in = gr_%s.peer(), fadeTime = 0.02)}" z z z z
        , printf "sy_%s.write(dir = \"%s\", overwrite = true);" z out_dir
        ]
  in concat [prefix, lines txt, suffix]

scala_graph_fragment_process :: FilePath -> [FilePath] -> IO [String]
scala_graph_fragment_process out_dir fn_seq = do
  tmp <- getTemporaryDirectory
  txt_seq <- Help.read_file_set_fragments fn_seq
  let z_seq = map txt_hash_str txt_seq
      rw_seq = map (scala_graph_fragment_rw out_dir) (zip z_seq txt_seq)
      cpy (z, txt) = writeFile (out_dir </> z <.> "scala") txt
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

graph_fragments_process_dir_set :: Lisp.NameTable -> String -> FilePath -> [FilePath] -> IO ()
graph_fragments_process_dir_set sch_tbl ext =
  case ext of
    ".fs" -> fs_graph_fragment_process_dir_set
    ".hs" -> hs_graph_fragments_process_dir_set "std"
    -- ".scala" -> scala_graph_fragment_process_dir
    ".scd" -> scd_graph_fragment_process_dir_set
    ".sch" -> scm_graph_fragment_process_dir_set sch_tbl ".sch"
    ".scm" -> scm_graph_fragment_process_dir_set sch_tbl ".scm"
    ".st" -> st_graph_fragment_process_dir_set ".st"
    ".sl" -> sl_graph_fragment_process_dir_set (const True)
    _ -> error "graph_fragments_process_dir"
