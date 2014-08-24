import System.FilePath {- filepath -}

prj_dir :: FilePath
prj_dir = "/home/rohan/sw/hsc3-graphs"

to_file_name :: String -> String
to_file_name =
    let f c = if c `elem` " " then '-' else c
    in map f

to_scd_file :: String -> FilePath
to_scd_file nm = prj_dir </> "gr" </> to_file_name nm <.> "scd"

jmcc_sc2 :: [[String]]
jmcc_sc2 =
    -- SC2
    [["analog bubbles"
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
     ,"modal space local"
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

-- > writeFile "/tmp/jmcc.scd" . unlines =<< jmcc_sc2_src
jmcc_sc2_src :: IO [String]
jmcc_sc2_src = do
  let fn = concatMap (map to_scd_file) jmcc_sc2
  d <- mapM readFile fn
  let d' = map (\s -> concat ["(\n",s,")\n"]) d
  return d'
