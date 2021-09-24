import System.Environment {- base -}

import qualified Sound.SC3.Lisp.Haskell as Lisp {- hsc3-lisp -}

import Sound.SC3.Graphs.Polyglot {- hsc3-graphs -}

-- | DB directory
--
-- > fn <- T.dir_subset graphs_db_fext graphs_db_dir
-- > length fn == 3445
graphs_db_dir :: FilePath
graphs_db_dir = "/home/rohan/sw/hsc3-graphs/db/"

graphs_db_polyglot_autogen :: IO ()
graphs_db_polyglot_autogen = do
  sch_tbl <- Lisp.name_tbl_load "/home/rohan/sw/hsc3-lisp/lib/sch-name-tbl.text"
  _ <- hs_graph_fragments_process_dir "std" graphs_db_dir "/home/rohan/sw/hsc3/Help/Graph/"
  _ <- hs_graph_fragments_process_dir "std" graphs_db_dir "/home/rohan/sw/hsc3/Help/UGen/"
  scd_graph_fragment_process_dir graphs_db_dir "/home/rohan/sw/hsc3-graphs/lib/scd/graph/"
  scd_graph_fragment_process_dir graphs_db_dir "/home/rohan/sw/hsc3-graphs/lib/scd/collect/"
  scd_graph_fragment_process_dir graphs_db_dir "/home/rohan/sw/sc3-rdu/help/scd/"
  scm_graph_fragment_process_dir sch_tbl ".scm" graphs_db_dir "/home/rohan/sw/rsc3/help/graph/"
  scm_graph_fragment_process_dir sch_tbl ".scm" graphs_db_dir "/home/rohan/sw/rsc3/help/ugen/"
  scm_graph_fragment_process_dir sch_tbl ".scm" graphs_db_dir "/home/rohan/sw/rsc3-arf/help/graph/"
  scm_graph_fragment_process_dir sch_tbl ".scm" graphs_db_dir "/home/rohan/sw/rsc3-arf/help/ugen/"
  scm_graph_fragment_process_dir sch_tbl ".sch" graphs_db_dir "/home/rohan/sw/rsc3/help/graph/"
  scm_graph_fragment_process_dir sch_tbl ".sch" graphs_db_dir "/home/rohan/sw/rsc3-arf/help/graph/"
  fs_graph_fragment_process_dir graphs_db_dir "/home/rohan/sw/hsc3-forth/help/graph/"
  fs_graph_fragment_process_dir graphs_db_dir "/home/rohan/sw/hsc3-forth/help/ugen/"
  st_graph_fragment_process_dir ".st" "min" graphs_db_dir "/home/rohan/sw/stsc3/help/graph/"
  st_graph_fragment_process_dir ".st" "min" graphs_db_dir "/home/rohan/sw/stsc3/help/ugen/"
  scala_graph_fragment_process_dir graphs_db_dir "/home/rohan/sw/hsc3-graphs/lib/scala/graph/"
  return ()

help :: [String]
help =
    ["hsc3-graphs command [arguments]"
    ,"  db polyglot autogen"
    ,"  db process ext output-directory input-directory"
    ,"  fragments {hs} {min | std} {play | draw | dump-ugens} FILE-NAME"
    ,""
    ,"    ext = " ++ unwords graphs_db_fext
    ]

main :: IO ()
main = do
  a <- getArgs
  sch_tbl <- Lisp.name_tbl_load "/home/rohan/sw/hsc3-lisp/lib/sch-name-tbl.text"
  case a of
    ["db","polyglot","autogen"] -> graphs_db_polyglot_autogen
    ["db","process",ext,out_dir,in_dir] -> graph_fragments_process_dir sch_tbl ext out_dir in_dir
    ["fragments","hs",typ,"play",fn] -> hs_graph_fragments_process_play typ fn
    ["fragments","hs",typ,"draw",fn] -> hs_graph_fragments_process_draw typ fn
    ["fragments","hs",typ,"dump-ugens",fn] -> hs_graph_fragments_process_dump_ugens typ fn
    _ -> putStrLn (unlines help)
