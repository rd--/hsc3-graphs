import Control.Monad {- base -}
import System.Directory {- directory -}
import System.FilePath {- filepath -}

import Sound.SC3.Graphs.JMcC {- hsc3-graphs -}

prj_dir :: FilePath
prj_dir = "/home/rohan/sw/hsc3-graphs"

to_file_name :: String -> String
to_file_name =
    let f c = if c `elem` " " then '-' else c
    in map f

to_file :: String -> String -> FilePath
to_file ext nm = prj_dir </> "gr" </> to_file_name nm <.> ext

p3_fst :: (a,b,c) -> a
p3_fst (a,_,_) = a

jmcc_fnames :: String -> [FilePath]
jmcc_fnames ext = concatMap (map (to_file ext . p3_fst)) jmcc_sc2

-- > jmcc_missing "hs"
-- > jmcc_missing "fs"
-- > jmcc_missing "scm"
jmcc_missing :: String -> IO [FilePath]
jmcc_missing = filterM (fmap not . doesFileExist) . jmcc_fnames

jmcc_concat :: String -> (String -> r) -> IO [r]
jmcc_concat ext f = do
  fn <- filterM doesFileExist (jmcc_fnames ext)
  d <- mapM readFile fn
  let d' = map f d
  return d'

-- > writeFile "/tmp/jmcc.hs" . unlines =<< jmcc_hs
jmcc_hs :: IO [String]
jmcc_hs = jmcc_concat "hs" id

-- > writeFile "/tmp/jmcc.scd" . unlines =<< jmcc_scd
jmcc_scd :: IO [String]
jmcc_scd = let f s = concat ["(\n",s,")\n"] in jmcc_concat "scd" f

-- > writeFile "/home/rohan/sw/hsc3-lisp/help/jmcc.lisp" . unlines =<< jmcc_scm
jmcc_scm :: IO [String]
jmcc_scm = jmcc_concat "scm" id

-- > writeFile "/home/rohan/sw/hsc3-forth/help/jmcc.fs" . unlines =<< jmcc_fs
jmcc_fs :: IO [String]
jmcc_fs = jmcc_concat "fs" id
