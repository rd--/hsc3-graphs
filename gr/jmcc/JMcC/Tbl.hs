import Sound.SC3 {- hsc3 -}

import JMcC.SC2
import JMcC.SC3

-- * TABLE

jmcc_sc2 :: [[(Maybe UGen,Maybe (IO ()))]]
jmcc_sc2 =
    -- SC2
    [[(Just why_supercollider,Nothing)]
    ,[(Just analog_bubbles,Nothing)
     ,(Just lfo_modulation,Nothing)
     ,(Just hell_is_busy,Just hell_is_busy_ot)
     ,(Just pond_life,Just pond_life_ot)
     ,(Just alien_froggies,Just alien_froggies_ot)
     ,(Just random_sine_waves,Just random_sine_waves_ot)
     ,(Just random_pulsations,Just random_pulsations_st)
     ,(Just moto_rev,Nothing)
     ,(Just scratchy,Nothing)
     ,(Just tremulate,Just tremulate_xt)
     ,(Just reso_pulse,Just reso_pulse_ot)
     ,(Just sprinkler,Nothing)
     ,(Just sprinkler_mouse,Nothing)
     ,(Just harmonic_swimming,Nothing)
     ,(Just harmonic_tumbling,Nothing)]
    ,[(Just rails,Just rails_ot)
     ,(Just bouncing_objects,Just bouncing_objects_st)
     ,(Just lots_o_sins,Just lots_o_sins_xt)
     ,(Just clustered_sines,Just clustered_sines_xt)
     ,(Just resonators_harmonic_series,Just resonators_harmonic_series_xt)
     ,(Just swept_resonant_noise,Just swept_resonant_noise_ot)
     ,(Just coolant,Just coolant_ot)
     ,(Just pulsing_bottles,Just pulsing_bottles_ot)
     ,(Just what_was_i_thinking,Nothing)
     ,(Just narrow_band_filtered_crackle_noise,Just narrow_band_filtered_crackle_noise_st)
     ,(Just resonant_dust,Just resonant_dust_ot)
     ,(Just police_state,Nothing)
     ,(Just uplink,Just uplink_ot)
     ,(Just data_space,Just data_space_ot)
     ,(Just cymbalism,Just cymbalism_ot)
     ,(Just cymbalism_accellerando,Just cymbalism_accellerando_ot)
     ,(Just ring_modulated_klank,Just ring_modulated_klank_ot)]
    ,[(Just analogue_daze,Nothing)
     ,(Just synthetic_piano,Just synthetic_piano_ot)
     ,(Just reverberated_sine_percussion,Nothing)
     --,(Just rnb,Nothing)
     ,(Just analog_bubbles_mouse,Nothing)]
    ,[(Just berlin_1977,Nothing)
     ,(Just metal_plate,Nothing)
     ,(Just sample_and_hold_liquidities,Nothing)
     ,(Just random_panning_sines,Just random_panning_sines_ot)]
    ,[(Just distort_input,Nothing)
     ,(Just ring_modulate_input,Nothing)
     ,(Just filter_input,Nothing)]
    ,[(Just sweepy_noise,Nothing)
     ,(Nothing,Just string_wander_cluster_ot)
     ,(Nothing,Just comb_delay_sweeps_ot)
     ,(Just noise_burst_sweep,Just noise_burst_sweep_ot)
     ,(Just saucer_base,Just saucer_base_ot)
     ,(Just alien_meadow,Just alien_meadow_ot)
     ,(Just birdies,Just birdies_ot)
     ,(Just phase_modulation_with_slow_beats,Just phase_modulation_with_slow_beats_ot)
     ,(Just hard_sync_sawtooth_with_lfo,Just hard_sync_sawtooth_with_lfo_ot)
     ,(Just noise_modulated_sines,Just noise_modulated_sines_ot)
     ,(Just noise_modulated_sawtooths,Just noise_modulated_sawtooths_ot)]
    ,[(Just aleatoric_quartet,Nothing)
     --,(Just sbs,Just sbs_ot)
     --,(Just sbhs,Just sbhs_ot)
     ,(Just tapping_tools,Just tapping_tools_ot)]
    ,[(Just modal_space,Nothing)
     ,(Just landon_rose,Nothing)]
    ,[(Just deep_trip,Just deep_trip_ot)
     ,(Just sawed_cymbals,Just sawed_cymbals_ot)
     ,(Just sidereal_time,Just sidereal_time_ot)
     ,(Just contamination_zone,Just contamination_zone_ot)]
    ,[(Just choip,Just choip_ot)]
    ,[(Just strummable_guitar,Nothing)]
    -- SC3d1.5
    ,[(Just blips_001,Just blips_001_ot)
     ,(Just zizle,Just zizle_ot)]
    -- SC3
    ,[(Just babbling_brook,Nothing)]
    ]
