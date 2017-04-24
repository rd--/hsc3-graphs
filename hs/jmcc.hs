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
     ,("random sine waves",Right "rsw_ot")
     ,("random pulsations",Right "rp_st")
     ,("moto rev",Left "moto_rev")
     ,("scratchy",Left "scratchy")
     ,("tremulate",Right "tremulate_xt")
     ,("reso pulse",Right "reso_pulse_ot")
     ,("sprinkler",Left "sprinkler")
     ,("sprinkler mouse",Left "sprinkler_mouse")
     ,("harmonic swimming",Left "harmonic_swimming")
     ,("harmonic tumbling",Left "harmonic_tumbling")]
    ,[("rails",Right "rails_ot")
     ,("bouncing objects",Right "bouncing_objects_st")
     ,("lots-o-sines",Right "lots_o_sins_xt")
     ,("clustered sines",Right "cs_xt")
     ,("resonators harmonic series",Right "rhs_xt")
     ,("swept resonant noise",Right "srn_ot")
     ,("coolant",Right "coolant_ot")
     ,("pulsing bottles",Right "pulsing_bottles_ot")
     ,("what was i thinking",Left "what_was_i_thinking")
     ,("narrow band filtered crackle noise",Right "nbfcn_st")
     ,("resonant dust",Right "resonant_dust_ot")
     ,("police state",Left "police_state")
     ,("uplink",Right "uplink_ot")
     ,("data space",Right "data_space_ot")
     ,("cymbalism",Right "cymbalism_ot")
     ,("cymbalism accelerando",Right "cymbalism_accellerando_ot")
     ,("ring modulated klank",Right "rmk_ot")]
    ,[("analogue daze",Left "analogue_daze")
     ,("synthetic piano",Right "synthetic_piano_ot")
     ,("reverberated sine percussion",Left "reverberated_sine_percussion")
     ,("reverberated noise bursts",Left "rnb")
     ,("analog bubbles mouse",Left "analog_bubbles_mouse")]
    ,[("berlin 1977",Left "berlin_1977")
     ,("metal plate",Left "metal_plate")
     ,("sample and hold liquidities",Left "sample_and_hold_liquidities")
     ,("random panning sines",Right "rps_ot")]
    ,[("distort input",Left "distort_input")
     ,("ring modulate input",Left "ring_modulate_input")
     ,("filter input",Left "filter_input")]
    ,[("sweepy noise",Left "sweepy_noise")
     ,("string wander-cluster",Right "swc_ot")
     ,("comb delay sweeps",Right "cds_ot")
     ,("noise burst sweep",Right "nbs_ot")
     ,("saucer base",Right "saucer_base_ot")
     ,("alien meadow",Right "alien_meadow_ot")
     ,("birdies",Right "birdies_ot")
     ,("phase modulation",Right "pmwsb_ot")
     ,("hard sync sawtooth with lfo",Right "hsswl_ot")
     ,("noise modulated sines",Right "nms_ot")
     ,("noise modulated sawtooths",Right "nmsw_ot")]
    ,[("aleatoric quartet",Left "aleatoric_quartet")
     ,("slow beating sines",Right "sbs_ot")
     ,("slow beating harmonic sines",Right "sbhs_ot")
     ,("tapping tools",Right "tapping_tools_ot")]
    ,[("modal space",Left "modal_space")
     ,("landon rose",Left "landon_rose")]
    ,[("deep trip",Right "deep_trip_ot")
     ,("sawed cymbals",Right "sawed_cymbals_ot")
     ,("sidereal time",Right "sidereal_time_ot")
     ,("contamination zone",Right "cz_ot")]
    ,[]
    ,[("strummable guitar",Left "str_gtr")
     ,("drone plus rhythm",Right "dpr_ot")
     ,("early space music lp side one",undefined)
     ,("early space music lp side two",Right "esmlp2_ot")]
    -- SC3d1.5
    ,[("blips 001",Right "blips_ot")
     ,("zizle",Right "zizle_ot")]
    -- SC3
    ,[("babbling brook",Left "babbling_brook")]
    ,[("mridangam",Right "mri_run")]]

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
