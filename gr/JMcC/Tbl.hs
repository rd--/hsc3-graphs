
import Sound.SC3.Graphs.JMcC.Blips_001.Plain {- hsc3-graphs -}
import Sound.SC3.Graphs.JMcC.Why_SuperCollider.Plain {- hsc3-graphs -}

-- * TABLE

jmcc_sc2 :: [[(String,Maybe UGen,Maybe (IO ()))]]
jmcc_sc2 =
    -- SC2
    [[("why supercollider",Just why_supercollider,Nothing)]
    ,[("analog bubbles",Just analog_bubbles,Nothing)
     ,("lfo modulation",Just lfo_modulation,Nothing)
     ,("hell is busy",Just hib,Just hib_ot)
     ,("pond life",Just pond_life,Just pond_life_ot)
     ,("alien froggies",Just alien_froggies_11,Just alien_froggies_ot)
     ,("random sine waves",Just rsw,Just rsw_ot)
     ,("random pulsations",Just rp,Just rp_st)
     ,("moto rev",Just moto_rev,Nothing)
     ,("scratchy",Just scratchy,Nothing)
     ,("tremulate",Just tremulate,Just tremulate_xt)
     ,("reso pulse",Just reso_pulse,Just reso_pulse_ot)
     ,("sprinkler",Just sprinkler,Nothing)
     ,("sprinkler mouse",Just sprinkler_mouse,Nothing)
     ,("harmonic swimming",Just harmonic_swimming,Nothing)
     ,("harmonic tumbling",Just harmonic_tumbling,Nothing)]
    ,[("rails",Just rails,Just rails_ot)
     ,("bouncing objects",Just bouncing_objects,Just bouncing_objects_st)
     ,("lots-o-sines",Just lots_o_sins,Just lots_o_sins_xt)
     ,("clustered sines",Just cs,Just cs_xt)
     ,("resonators harmonic series",Just rhs,Just rhs_xt)
     ,("swept resonant noise",Just srn,Just srn_ot)
     ,("coolant",Just coolant,Just coolant_ot)
     ,("pulsing bottles",Just pulsing_bottles,Just pulsing_bottles_ot)
     ,("what was i thinking",Just what_was_i_thinking,Nothing)
     ,("narrow band filtered crackle noise",Just nbfcn,Just nbfcn_st)
     ,("resonant dust",Just resonant_dust,Just resonant_dust_ot)
     ,("police state",Just police_state,Nothing)
     ,("uplink",Just uplink,Just uplink_ot)
     ,("data space",Just data_space,Just data_space_ot)
     ,("cymbalism",Just cymbalism,Just cymbalism_ot)
     ,("cymbalism accelerando",Just cymbalism_accellerando,Just cymbalism_accellerando_ot)
     ,("ring modulated klank",Just rmk,Just rmk_ot)]
    ,[("analogue daze",Just analogue_daze,Nothing)
     ,("synthetic piano",Just synthetic_piano,Just synthetic_piano_ot)
     ,("reverberated sine percussion",Just reverberated_sine_percussion,Nothing)
     ,("reverberated noise bursts",Just rnb,Nothing)
     ,("analog bubbles mouse",Just analog_bubbles_mouse,Nothing)]
    ,[("berlin 1977",Just berlin_1977,Nothing)
     ,("metal plate",Just metal_plate,Nothing)
     ,("sample and hold liquidities",Just sample_and_hold_liquidities,Nothing)
     ,("random panning sines",Just rps,Just rps_ot)]
    ,[("distort input",Just distort_input,Nothing)
     ,("ring modulate input",Just ring_modulate_input,Nothing)
     ,("filter input",Just filter_input,Nothing)]
    ,[("sweepy noise",Just sweepy_noise,Nothing)
     ,("string wander-cluster",Just swc',Just swc_ot)
     ,("comb delay sweeps",Just cds',Just cds_ot)
     ,("noise burst sweep",Just nbs,Just nbs_ot)
     ,("saucer base",Just saucer_base,Just saucer_base_ot)
     ,("alien meadow",Just alien_meadow,Just alien_meadow_ot)
     ,("birdies",Just birdies,Just birdies_ot)
     ,("phase modulation",Just pmwsb,Just pmwsb_ot)
     ,("hard sync sawtooth with lfo",Just hsswl,Just hsswl_ot)
     ,("noise modulated sines",Just nms,Just nms_ot)
     ,("noise modulated sawtooths",Just nmsw,Just nmsw_ot)]
    ,[("aleatoric quartet",Just aleatoric_quartet,Nothing)
     ,("slow beating sines",Just sbs,Just sbs_ot)
     ,("slow beating harmonic sines",Just sbhs,Just sbhs_ot)
     ,("tapping tools",Just tapping_tools,Just tapping_tools_ot)]
    ,[("modal space",Just modal_space,Nothing)
     ,("landon rose",Just landon_rose,Nothing)]
    ,[("deep trip",Just deep_trip,Just deep_trip_ot)
     ,("sawed cymbals",Just sawed_cymbals,Just sawed_cymbals_ot)
     ,("sidereal time",Just sidereal_time,Just sidereal_time_ot)
     ,("contamination zone",Just cz,Just cz_ot)]
    ,[]
    ,[("strummable guitar",Just str_gtr,Nothing)
     ,("drone plus rhythm",Nothing,Just dpr_ot_)
     ,("early space music lp side one",Nothing,Nothing)
     ,("early space music lp side two",Nothing,Just esmlp2_ot)]
    -- SC3d1.5
    ,[("blips 001",Just blips_001,Just blips_001_ot)
     ,("zizle",Just zizle,Just zizle_ot)]
    -- SC3
    ,[("babbling brook",Just babbling_brook,Nothing)]
    ,[("mridangam",Nothing,Just mri_run)]]
