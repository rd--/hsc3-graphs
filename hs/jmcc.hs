import Control.Monad {- base -}
import System.Directory {- directory -}
import System.FilePath {- filepath -}

prj_dir :: FilePath
prj_dir = "/home/rohan/sw/hsc3-graphs"

to_file_name :: String -> String
to_file_name =
    let f c = if c `elem` " " then '-' else c
    in map f

to_file :: String -> String -> FilePath
to_file ext nm = prj_dir </> "gr" </> to_file_name nm <.> ext

jmcc_sc2 :: [[String]]
jmcc_sc2 =
    -- SC2
    [["why supercollider"]
    ,["analog bubbles"
     ,"lfo modulation"
     ,"hell is busy"
     ,"pond life"
     ,"alien froggies"
     ,"random sine waves"
     ,"random pulsations"
     ,"moto rev"
     ,"scratchy"
     ,"tremulate"
     ,"reso pulse"
     ,"sprinkler"
     ,"sprinkler mouse"
     ,"harmonic swimming"
     ,"harmonic tumbling"]
    ,["rails"
     ,"bouncing objects"
     ,"lots-o-sines"
     ,"clustered sines"
     ,"resonators harmonic series"
     ,"swept resonant noise"
     ,"coolant"
     ,"pulsing bottles"
     ,"what was i thinking"
     ,"narrow band filtered crackle noise"
     ,"resonant dust"
     ,"police state"
     ,"uplink"
     ,"data space"
     ,"cymbalism"
     ,"cymbalism accelerando"
     ,"ring modulated klank"]
    ,["analogue daze"
     ,"synthetic piano"
     ,"reverberated sine percussion"
     ,"reverberated noise bursts"
     ,"analog bubbles mouse"]
    ,["berlin 1977"
     ,"metal plate"
     ,"sample and hold liquidities"
     ,"random panning sines"]
    ,["distort input"
     ,"ring modulate input"
     ,"filter input"]
    ,["sweepy noise"
     ,"string wander-cluster"
     ,"comb delay sweeps"
     ,"noise burst sweep"
     ,"saucer base"
     ,"alien meadow"
     ,"birdies"
     ,"phase modulation"
     ,"hard sync sawtooth with lfo"
     ,"noise modulated sines"
     ,"noise modulated sawtooths"]
    ,["aleatoric quartet"
     ,"slow beating sines"
     ,"slow beating harmonic sines"
     ,"tapping tools"]
    ,["modal space"
     ,"landon rose"]
    ,["deep trip"
     ,"sawed cymbals"
     ,"sidereal time"
     ,"contamination zone"]
    ,[]
    ,["strummable guitar"
     ,"drone plus rhythm"
     ,"early space music lp side one"
     ,"early space music lp side two"]
    -- SC3d1.5
    ,["blips 001"
     ,"zizle"]
    -- SC3
    ,["babbling brook"]
    ,["mridangam"]]

jmcc_fnames :: String -> [FilePath]
jmcc_fnames ext = concatMap (map (to_file ext)) jmcc_sc2

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

-- > writeFile "/tmp/jmcc.scd" . unlines =<< jmcc_scd
jmcc_scd :: IO [String]
jmcc_scd = let f s = concat ["(\n",s,")\n"] in jmcc_concat "scd" f

-- > writeFile "/home/rohan/sw/hsc3-lisp/help/jmcc.lisp" . unlines =<< jmcc_scm
jmcc_scm :: IO [String]
jmcc_scm = jmcc_concat "scm" id

-- > writeFile "/home/rohan/sw/hsc3-forth/help/jmcc.fs" . unlines =<< jmcc_fs
jmcc_fs :: IO [String]
jmcc_fs = jmcc_concat "fs" id
