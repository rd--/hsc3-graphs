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

-- | Left = ugen graph, Right = texture (ot=overlap,xt=xfade,st=spawn)
jmcc_sc2 :: [[(String,Either String String)]]
jmcc_sc2 =
    -- SC2
    [[("why supercollider",Left "why_supercollider")]
    ,[("analog bubbles",Left "analog_bubbles")
     ,("lfo modulation",Left "lfo_modulation")
     ,("hell is busy",Right "hib_ot")
     ,("pond life",Right "pond_life_ot")
     ,("alien froggies",Right "alien_froggies_ot")
     ,("random sine waves",undefined)
     ,("random pulsations",undefined)
     ,("moto rev",undefined)
     ,("scratchy",undefined)
     ,("tremulate",undefined)
     ,("reso pulse",undefined)
     ,("sprinkler",undefined)
     ,("sprinkler mouse",undefined)
     ,("harmonic swimming",undefined)
     ,("harmonic tumbling",undefined)]
    ,[("rails",undefined)
     ,("bouncing objects",undefined)
     ,("lots-o-sines",undefined)
     ,("clustered sines",undefined)
     ,("resonators harmonic series",undefined)
     ,("swept resonant noise",undefined)
     ,("coolant",Right "coolant_ot")
     ,("pulsing bottles",undefined)
     ,("what was i thinking",undefined)
     ,("narrow band filtered crackle noise",undefined)
     ,("resonant dust",undefined)
     ,("police state",undefined)
     ,("uplink",undefined)
     ,("data space",undefined)
     ,("cymbalism",undefined)
     ,("cymbalism accelerando",undefined)
     ,("ring modulated klank",undefined)]
    ,[("analogue daze",undefined)
     ,("synthetic piano",undefined)
     ,("reverberated sine percussion",undefined)
     ,("reverberated noise bursts",undefined)
     ,("analog bubbles mouse",undefined)]
    ,[("berlin 1977",undefined)
     ,("metal plate",undefined)
     ,("sample and hold liquidities",undefined)
     ,("random panning sines",undefined)]
    ,[("distort input",undefined)
     ,("ring modulate input",undefined)
     ,("filter input",undefined)]
    ,[("sweepy noise",undefined)
     ,("string wander-cluster",undefined)
     ,("comb delay sweeps",undefined)
     ,("noise burst sweep",undefined)
     ,("saucer base",undefined)
     ,("alien meadow",undefined)
     ,("birdies",undefined)
     ,("phase modulation",undefined)
     ,("hard sync sawtooth with lfo",undefined)
     ,("noise modulated sines",undefined)
     ,("noise modulated sawtooths",undefined)]
    ,[("aleatoric quartet",undefined)
     ,("slow beating sines",undefined)
     ,("slow beating harmonic sines",undefined)
     ,("tapping tools",undefined)]
    ,[("modal space",undefined)
     ,("landon rose",undefined)]
    ,[("deep trip",undefined)
     ,("sawed cymbals",undefined)
     ,("sidereal time",undefined)
     ,("contamination zone",undefined)]
    ,[]
    ,[("strummable guitar",undefined)
     ,("drone plus rhythm",undefined)
     ,("early space music lp side one",undefined)
     ,("early space music lp side two",undefined)]
    -- SC3d1.5
    ,[("blips 001",undefined)
     ,("zizle",undefined)]
    -- SC3
    ,[("babbling brook",undefined)]
    ,[("mridangam",undefined)]]

jmcc_fnames :: String -> [FilePath]
jmcc_fnames ext = concatMap (map (to_file ext . fst)) jmcc_sc2

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
