-- import Control.Monad {- base -}
import System.Environment {- base -}

import qualified Language.Sc3.Lisp.NameTable as Lisp {- hsc3-lisp -}

import Sound.Sc3.Graphs.Polyglot {- hsc3-graphs -}

{- | Db directory

>>> fn <- Music.Theory.Directory.dir_subset graphs_db_fext graphs_db_dir
>>> length fn
6117
-}
graphs_db_dir :: FilePath
graphs_db_dir = "/home/rohan/sw/hsc3-graphs/db/"

{- | Rebuild Polglot Db

Sc requires ContinuousEvent, GraphTexture & SfAcquire.
-}
graphs_db_polyglot_autogen :: IO ()
graphs_db_polyglot_autogen = do
  let db_dir = if True then graphs_db_dir else "/tmp/"
  let hs_q x = "/home/rohan/sw/hsc3/Help/" ++ x
  hs_graph_fragments_process_dir_set "std" db_dir (map hs_q ["Graph", "Ugen"])
  let sc_q x = "/home/rohan/sw/hsc3-graphs/lib/scd/" ++ x
  scd_graph_fragment_process_dir_set db_dir (map sc_q ["graph", "collect"])
  scd_graph_fragment_process_dir_set db_dir ["/home/rohan/sw/sc3-rdu/help/scd/"]
  sch_tbl <- Lisp.nameTableLoad "/home/rohan/sw/hsc3-lisp/lib/sch-name-tbl.text"
  let scm_q x = "/home/rohan/sw/rsc3/help/" ++ x
  scm_graph_fragment_process_dir_set sch_tbl ".scm" db_dir (map scm_q ["graph", "ugen"])
  scm_graph_fragment_process_dir_set sch_tbl ".sch" db_dir ["/home/rohan/sw/rsc3/help/graph"]
  {-
    scm_graph_fragment_process_dir sch_tbl ".scm" db_dir "/home/rohan/sw/rsc3-arf/help/graph/"
    scm_graph_fragment_process_dir sch_tbl ".scm" db_dir "/home/rohan/sw/rsc3-arf/help/ugen/"
    scm_graph_fragment_process_dir sch_tbl ".sch" db_dir "/home/rohan/sw/rsc3-arf/help/graph/"
  -}
  let fs_q x = "/home/rohan/sw/hsc3-forth/help/" ++ x
  fs_graph_fragment_process_dir_set db_dir (map fs_q ["graph", "ugen"])
  let st_q x = "/home/rohan/sw/stsc3/help/" ++ x
  st_graph_fragment_process_dir_set ".st" db_dir (map st_q ["ugen", "graph"])
  let sl_q x = "/home/rohan/sw/spl/help/SuperCollider/" ++ x
  sl_graph_fragment_process_dir_set (const True) db_dir (map sl_q ["Ugen", "Graph", "Graph Collection"])
  sl_graph_fragment_process_dir_set sl_is_upper_case db_dir ["/home/rohan/sw/spl/help/Reference"]
  {-
    scala_graph_fragment_process_dir db_dir "/home/rohan/sw/hsc3-graphs/lib/scala/graph/"
  -}
  return ()

help :: [String]
help =
  [ "hsc3-graphs command [arguments]"
  , "  db polyglot autogen"
  , "  db process ext output-directory input-directories..."
  , "  fragments {hs} {min | std} {play | draw | dump-ugens} FILE-NAME"
  , ""
  , "    ext = " ++ unwords graphs_db_fext
  ]

main :: IO ()
main = do
  a <- getArgs
  sch_tbl <- Lisp.nameTableLoad "/home/rohan/sw/hsc3-lisp/lib/sch-name-tbl.text"
  case a of
    ["db", "polyglot", "autogen"] -> graphs_db_polyglot_autogen
    "db" : "process" : ext : out_dir : in_dir -> graph_fragments_process_dir_set sch_tbl ext out_dir in_dir
    ["fragments", "hs", typ, "play", fn] -> hs_graph_fragments_process_play typ fn
    ["fragments", "hs", typ, "draw", fn] -> hs_graph_fragments_process_draw typ fn
    ["fragments", "hs", typ, "dump-ugens", fn] -> hs_graph_fragments_process_dump_ugens typ fn
    _ -> putStrLn (unlines help)
