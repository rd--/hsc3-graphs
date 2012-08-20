import Data.List
import Data.Maybe
import System.Directory  {- directory -}
import System.FilePath  {- filepath -}
import Text.Printf

stripSuffix s l = fmap reverse (stripPrefix (reverse s) (reverse l))

strip_suffix_or_id s l = fromMaybe l (stripSuffix s l)

dir = "sw/hsc3-graphs"
gr_dir = dir </> "gr"
scm_dir = "sw/rsc3/help/graph"

link :: FilePath -> FilePath -> String -> IO (Maybe String)
link h p c = do
  e <- doesFileExist (h </> p)
  let r = if e then Just (printf "[%s](%s)" c p) else Nothing
  return r

entry :: FilePath -> String -> IO String
entry h nm = do
  hs <- link h (gr_dir </> nm <.> "hs") "hs"
  m_hs <- link h (gr_dir </> nm ++ "-m" <.> "hs") "m/hs"
  scd <- link h (gr_dir </> nm <.> "scd") "scd"
  scm <- link h (scm_dir </> nm <.> "scm") "scm"
  dot <- link h (dir </> "dot" </> nm <.> "dot") "dot"
  pdf <- link h (dir </> "pdf" </> nm <.> "pdf") "pdf"
  svg <- link h (dir </> "svg" </> nm <.> "svg") "svg"
  let ln = intercalate "," (catMaybes [hs,m_hs,scd,scm,dot,pdf,svg])
  return (printf "- %s [%s]" nm ln)

main = do
  h <- getHomeDirectory
  d <- getDirectoryContents (h </> gr_dir)
  let hs = mapMaybe (stripSuffix ".hs") (filter (".hs" `isSuffixOf`) d)
      nm = map (strip_suffix_or_id "-m") hs
  e <- mapM (entry h) (nub (sort nm))
  writeFile (h </> dir </> "md/ix.md") (unlines e)
