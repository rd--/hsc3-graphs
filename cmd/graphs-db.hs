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

hs_graph_dir :: FilePath
hs_graph_dir = "/home/rohan/sw/hsc3-graphs/lib/hs/graph/"

hs_graph_fn :: FilePath -> FilePath
hs_graph_fn = (++) hs_graph_dir

hs_graph_fragment_rw :: String -> (String,String)
hs_graph_fragment_rw txt =
  let z = txt_hash_str txt
      pfx = ["import Data.Bits {- base -}"
            ,"import Data.List {- base -}"
            ,"import Sound.SC3 {- hsc3 -}"
            ,"import qualified Sound.SC3.UGen.Bindings.DB.External as X {- hsc3 -}"
            ,"import qualified Sound.SC3.UGen.Bindings.DB.RDU as X {- sc3-rdu -}"
            ,printf "g_%s :: UGen" z
            ,printf "g_%s =" z]
      ln = map (" " ++ ) (lines txt)
      sfx = ["main :: IO ()"
            ,"main = do"
            ,printf "  let sy = synthdef \"%s\" (wrapOut Nothing g_%s)" z z
            ,printf "  synthdefWrite \"%s\" sy" (graph_db_fn (z <.> ".scsyndef"))]
  in (z,unlines (concat [pfx,ln,sfx]))

hw_graph_fragment_process :: FilePath -> IO ()
hw_graph_fragment_process fn = do
  txt <- readFile (hs_graph_fn fn)
  let (z,txt_rw) = hs_graph_fragment_rw txt
  writeFile (graph_db_fn (z <.> "hs")) txt
  let hs_rw_fn = "/tmp" </> z <.> "hs"
  writeFile hs_rw_fn txt_rw
  _ <- rawSystem "runhaskell" [hs_rw_fn]
  return ()

hw_graph_fragment_process_dir :: IO ()
hw_graph_fragment_process_dir = do
  fn <- T.dir_subset_rel [".hs"] hs_graph_dir
  mapM_ hw_graph_fragment_process fn

{-
hw_graph_fragment_process_dir
-}

