import System.FilePath {- filepath -}
import System.Process {- process -}
import Text.Printf {- base -}

import qualified Data.Digest.Murmur64 as Murmur64 {- murmur-hash -}

import qualified Music.Theory.Directory as T {- hmt -}

-- > map txt_hash_str ["Digest.Murmur64","txt_hash_str"] == ["44e386f01d5298bf","4e12a613b9e47dbe"]
txt_hash_str :: String -> String
txt_hash_str = printf "%016x" . Murmur64.asWord64 . Murmur64.hash64

graph_db_dir :: FilePath
graph_db_dir = "/home/rohan/sw/hsc3-graphs/db/"

graph_db_fn :: FilePath -> FilePath
graph_db_fn = (++) graph_db_dir

-- * HS

hs_graph_dir :: FilePath
hs_graph_dir = "/home/rohan/sw/hsc3-graphs/lib/hs/graph/"

hs_graph_fn :: FilePath -> FilePath
hs_graph_fn = (++) hs_graph_dir

hs_graph_rw_pre :: [String]
hs_graph_rw_pre =
  ["import Data.Bits {- base -}"
  ,"import Data.List {- base -}"
  ,"import Sound.SC3 {- hsc3 -}"
  ,"import qualified Sound.SC3.UGen.Bindings.DB.External as X {- hsc3 -}"
  ,"import qualified Sound.SC3.UGen.Bindings.DB.RDU as X {- sc3-rdu -}"]

hs_graph_fragment_rw :: (String,String) -> [String]
hs_graph_fragment_rw (z,txt) =
  let pfx = [printf "gr_%s :: UGen" z
            ,printf "gr_%s =" z]
      grw = map (" " ++ ) (lines txt)
      sfx = [printf "wr_%s :: IO ()" z
            ,printf "wr_%s = do" z
            ,printf "  putStrLn \"%s\"" z
            ,printf "  let sy = synthdef \"%s\" (wrapOut Nothing gr_%s)" z z
            ,printf "  synthdefWrite \"%s\" sy" (graph_db_fn (z <.> ".scsyndef"))]
  in concat [pfx,grw,sfx]

hs_graph_rw_main :: [String] -> [String]
hs_graph_rw_main z_seq =
  let pfx = ["main :: IO ()"
            ,"main = do"]
      ent z = printf "  wr_%s" z
  in concat [pfx,map ent z_seq]

hs_graph_fragment_process :: [FilePath] -> IO ()
hs_graph_fragment_process fn_seq = do
  txt_seq <- mapM (readFile . hs_graph_fn) fn_seq
  let z_seq = map txt_hash_str txt_seq
      rw_seq = map hs_graph_fragment_rw (zip z_seq txt_seq)
      cpy (z,txt) = writeFile (graph_db_fn (z <.> "hs")) txt
      rw_fn = "/tmp/rw.hs"
  mapM_ cpy (zip z_seq txt_seq)
  writeFile rw_fn (unlines (hs_graph_rw_pre ++ concat rw_seq ++ hs_graph_rw_main z_seq))
  _ <- rawSystem "runhaskell" [rw_fn]
  return ()

hs_graph_fragment_process_dir :: IO ()
hs_graph_fragment_process_dir = do
  fn <- T.dir_subset_rel [".hs"] hs_graph_dir
  hs_graph_fragment_process fn

-- * SC

sc_graph_dir :: FilePath
sc_graph_dir = "/home/rohan/sw/hsc3-graphs/lib/sc/graph/"

sc_graph_fn :: FilePath -> FilePath
sc_graph_fn = (++) sc_graph_dir

sc_graph_fragment_rw :: (String,String) -> [String]
sc_graph_fragment_rw (z,txt) =
  let grw = lines txt
      sfx = [printf ".asSynthDef(name:\"%s\").writeDefFile(dir:\"%s\");" z graph_db_dir
            ,printf "\"%s\".postln;" z]
  in concat [grw,sfx]

sc_graph_fragment_process :: [FilePath] -> IO ()
sc_graph_fragment_process fn_seq = do
  txt_seq <- mapM (readFile . sc_graph_fn) fn_seq
  let z_seq = map txt_hash_str txt_seq
      rw_seq = map sc_graph_fragment_rw (zip z_seq txt_seq)
      cpy (z,txt) = writeFile (graph_db_fn (z <.> "scd")) txt
      rw_fn = "/tmp/rw.scd"
  mapM_ cpy (zip z_seq txt_seq)
  writeFile rw_fn (unlines (concat rw_seq ++ ["0.exit"]))
  _ <- rawSystem "sclang" [rw_fn]
  return ()

sc_graph_fragment_process_dir :: IO ()
sc_graph_fragment_process_dir = do
  fn <- T.dir_subset_rel [".scd"] sc_graph_dir
  sc_graph_fragment_process fn

-- * SCHEME/LISP

lisp_graph_dir :: FilePath
lisp_graph_dir = "/home/rohan/sw/rsc3/help/graph/"

lisp_graph_fn :: FilePath -> FilePath
lisp_graph_fn = (++) lisp_graph_dir

lisp_graph_rw_pre :: [String]
lisp_graph_rw_pre =
  ["(import (rhs) (sosc) (rsc3) (rsc3 lang))"]

lisp_graph_fragment_rw :: (String,String) -> [String]
lisp_graph_fragment_rw (z,txt) =
  [printf "(display \"%s\")(newline)" z
  ,printf "(synthdef-write (synthdef \"%s\" (out (ctl ir \"out\" 0)" z
  ,printf " %s)) \"%s\")" txt (graph_db_fn (z <.> ".scsyndef"))]

lisp_graph_fragment_process :: [FilePath] -> IO ()
lisp_graph_fragment_process fn_seq = do
  txt_seq <- mapM (readFile . lisp_graph_fn) fn_seq
  let z_seq = map txt_hash_str txt_seq
      rw_seq = map lisp_graph_fragment_rw (zip z_seq txt_seq)
      cpy (z,txt) = writeFile (graph_db_fn (z <.> "lisp")) txt
      rw_fn = "/tmp/rw.lisp"
  mapM_ cpy (zip z_seq txt_seq)
  writeFile rw_fn (unlines (lisp_graph_rw_pre ++ concat rw_seq ++ ["(exit)"]))
  _ <- rawSystem "ikarus" [rw_fn]
  return ()

lisp_graph_fragment_process_dir :: IO ()
lisp_graph_fragment_process_dir = do
  fn <- T.dir_subset_rel [".lisp"] lisp_graph_dir
  lisp_graph_fragment_process fn
