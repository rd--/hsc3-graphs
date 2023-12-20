-- | Graph & Texture Dbs
module Sound.Sc3.Graphs.Db where

import Data.Char {- base -}
import Data.Maybe {- base -}
import Text.Printf {- base -}

type Author = String
type Title = String
type GraphDb = [(Author, [Title])]

hsc3_graph_db :: GraphDb
hsc3_graph_db =
  [ ("AdC", ["8.1 Schroeder Reverb", "Bit Reduction", "Down Sample"])
  , ("AN", ["Tw 99846300173991936"])
  , ("CR", ["Lucier"])
  , ("DMC", ["PM Crotale"])
  , ("DS", ["Tw 19", "Tw 22"])
  , ("DST", ["1 5fc"])
  , ("EAS", ["rl"])
  ,
    ( "ES"
    ,
      [ "Tw 435684664200540161"
      , "Tw 570012853274615808"
      ]
    )
  ,
    ( "F0"
    ,
      [ "1 4Q6"
      , "20020817"
      , "2012 04 19"
      , "2020 12 11"
      , "Pkt 00"
      , "Pkt 07"
      , "Pkt 26"
      , "Pkt 28"
      , "Tw 0001"
      , "Tw 0002"
      , "Tw 0003"
      , "Tw 0004"
      , "Tw 0005"
      , "Tw 0006"
      , "Tw 0007"
      , "Tw 0008"
      , "Tw 0010"
      , "Tw 0011"
      , "Tw 0014"
      , "Tw 0016"
      , "Tw 0020"
      , "Tw 0026"
      , "Tw 0028"
      , "Tw 0030"
      , "Tw 0033"
      , "Tw 0041"
      , "Tw 0045"
      , "Tw 0049"
      , "Tw 0051"
      , "Tw 0054"
      , "Tw 0055"
      , "Tw 0058"
      , "Tw 0059"
      , "Tw 0061"
      , "Tw 0077"
      , "Tw 0084"
      , "Tw 0101"
      , "Tw 0120"
      , "Tw 0121"
      , "Tw 0125"
      , "Tw 0134"
      , "Tw 0134 (Var)"
      , "Tw 0164"
      , "Tw 0165"
      , "Tw 0220"
      , "Tw 0224"
      , "Tw 0225"
      , "Tw 0230"
      , "Tw 0232"
      , "Tw 0233"
      , "Tw 0238"
      , "Tw 0239"
      , "Tw 0240"
      , "Tw 0246"
      , "Tw 0248"
      , "Tw 0250"
      , "Tw 0251"
      , "Tw 0266"
      , "Tw 0270"
      , "Tw 0272"
      , "Tw 0274"
      , "Tw 0278"
      , "Tw 0279"
      , "Tw 0281"
      , "Tw 0283"
      , "Tw 0287"
      , "Tw 0288"
      , "Tw 0289"
      , "Tw 0290"
      , "Tw 0295"
      , "Tw 0296"
      , "Tw 0297"
      , "Tw 0298"
      , "Tw 0299"
      , "Tw 0301"
      , "Tw 0302"
      , "Tw 0306"
      , "Tw 0307"
      , "Tw 0308"
      , "Tw 0309"
      , "Tw 0310"
      , "Tw 0311"
      , "Tw 0317"
      , "Tw 0318"
      , "Tw 0319"
      , "Tw 0320"
      , "Tw 0321"
      , "Tw 0322"
      , "Tw 0324"
      , "Tw 0329"
      , "Tw 0330"
      , "Tw 0331"
      , "Tw 0332"
      , "Tw 0333"
      , "Tw 0334"
      , "Tw 0335"
      , "Tw 0336"
      , "Tw 0337"
      , "Tw 0339"
      , "Tw 0340"
      , "Tw 0341"
      , "Tw 0342"
      , "Tw 0345"
      , "Tw 0346"
      , "Tw 0347"
      , "Tw 03348"
      , "Tw 03349"
      , "Tw 0350"
      , "Tw 0353"
      , "Tw 0354"
      , "Tw 0356"
      , "Tw 0356"
      , "Tw 0357"
      , "Tw 0358"
      , "Tw 0360"
      , "Tw 0454598285861617665"
      , "Tw 0456384156159574016"
      , "Tw 0839296011982024704"
      , "Tw 1084601286488674304"
      , "Tw 1115745664523218944"
      , "Tw 1125557217086857216"
      , "Tw 1138498427241861122"
      , "Tw 1197185125819277312"
      , "Tw 1246461901669838848"
      , "Tw 1254441448327479299"
      , "Tw 1254441448327479299 (Edit)"
      , "Tw 1319946903711338496"
      , "Tw 1343283697840226307"
      , "Tw 1374139774269857798"
      , "Tw 1374517800048291847"
      , "Tw 1395040511795372038"
      , "Tw 1395519538008141835"
      , "Tw 1395878538297892865"
      , "Tw 1452318302768963589"
      , "Tw 1452599226882535431"
      , "Tw 1452954849885163525"
      , "Tw 1453520892374441986"
      , "Tw 1454150378241548296"
      , "Tw 1464534258173849611"
      , "Tw 1467507942664646661"
      , "Tw 1479212835192332289"
      , "Tw 1509888510525857792"
      , "Tw 1519791409921941507"
      ]
    )
  , ("JAR", ["1-4Qx", "rk_20120422"])
  , ("JH", ["4157"])
  , ("JL", ["1 9", "1 Z", "Bitwise", "Dark Sea Horns", "Rain, Thunder"])
  ,
    ( "JMcC"
    ,
      [ "Aleatoric Quartet"
      , "Alien Froggies"
      , "Alien Meadow"
      , "Analogue Daze"
      , "Analog Bubbles"
      , "Analog Bubbles (Mouse)"
      , "Analog Bubbles (Var)"
      , "Babbling Brook"
      , "Bach Prelude"
      , "Berlin, 1977"
      , "Bidirectional Strummable Guitar"
      , "Birdies"
      , "Blips 001"
      , "Bounce"
      , "Bouncing Objects"
      , "Bowed String"
      , "Bowed String (Texture)"
      , "Choip Choip Choip"
      , "Cf String"
      , "Clipped Inharmonic Warbulence"
      , "Clustered Sines"
      , "Contamination Zone"
      , "Coolant"
      , "Coolant (Texture)"
      , "Cymbalism Accellerando"
      , "Data Space"
      , "Deep Trip"
      , "Deep Trip (Texture)"
      , "Demanding Studies"
      , "Drag to keyboard"
      , "Fast Lfos with Slow Beats"
      , "Hard-Sync Sawtooth with Lfo"
      , "Harmonic Cloud"
      , "Harmonic Swimming"
      , "Harmonic Tumbling"
      , "Harmonic Zither"
      , "Hell Is Busy"
      , "Impulse Sequencer"
      , "Inharmonic Warbulence"
      , "Landon Rose"
      , "Lfo Modulation"
      , "Modal Space"
      , "Modal Space (Partial)"
      , "Moto Rev"
      , "Narrow Band Filtered Crackle Noise"
      , "Narrow Band Filtered Crackle Noise (Texture)"
      , "Noise Burst Sweep"
      , "Noise Modulated Sines"
      , "Ostinoodles"
      , "Pentatonic Pipes"
      , "Phase Modulation with Slow Beats"
      , "Plucked Strings"
      , "Police State"
      , "Pond Life"
      , "Pond Life (Texture)"
      , "Pulse Harmonic Warbulence"
      , "Pulsing Bottles"
      , "Random Panning Sines"
      , "Random Pulsations"
      , "Random Sine Waves"
      , "Repeating Harmonic Klank"
      , "Repeating Inharmonic Klank"
      , "Reso Pulse"
      , "Resonant Dust"
      , "Reverberated Sine Percussion"
      , "Sample and Hold Liquidities"
      , "Saucer Base"
      , "Sawed Cymbals"
      , "Scratchy"
      , "Sidereal Time"
      , "Spe"
      , "Sprinkler"
      , "Sprinkler (Mouse)"
      , "Strummable Metals"
      , "Strummable Silk"
      , "Sweepy Noise"
      , "Swept Resonant Noise"
      , "Synthetic Piano"
      , "Tank"
      , "Tarmac"
      , "Theremin"
      , "Tremulate"
      , "Tremulate (Event)"
      , "Trinkets"
      , "Uplink"
      , "Uplink (Texture)"
      , "What Was I Thinking?"
      , "Why SuperCollider?"
      , "Wind Metals"
      , "Wind Metals (Variables)"
      , "Wuxia"
      , "Zizle"
      ]
    )
  ,
    ( "JR"
    ,
      [ "A Bath"
      , "Deepsea"
      , "(Stereo) Half Life"
      , "Sturmian Sequencer I"
      , "Sturmian Sequencer II"
      , "Sturmian Sequencer III"
      ]
    )
  , ("KL", ["Vibraphone"])
  ,
    ( "LJP"
    ,
      [ "OL 01"
      , "OL 02"
      , "OL 03"
      , "OL 04"
      , "OL 05"
      , "OL 06"
      , "OL 06(a)"
      , "OL 06(b)"
      , "OL 07(a)"
      , "OL 07(b)"
      , "OL 07(c)"
      , "OL 07(d)"
      , "OL 07(e)"
      , "OL 08"
      , "OL 09"
      , "OL 10"
      , "OL 11"
      , "OL 12(a)"
      , "OL 12(b)"
      , "OL 12(c)"
      , "OL 12(d)"
      , "OL 12(e)"
      , "OL 13(a)"
      , "OL 13(b)"
      , "OL 13(c)"
      , "OL 13(d)"
      , "OL 13(e)"
      , "OL 14(a)"
      , "OL 14(e)"
      , "OL 15"
      , "OL 16(a)"
      , "OL 16(d)"
      , "One Line"
      ]
    )
  , ("MM", ["Tw 11"])
  , ("NC", ["SC Tutorial"])
  , ("NH", ["Phase Vocoder"])
  ,
    ( "NV"
    ,
      [ "Tw 2013-12-04"
      , "Tw 2013-12-04 (TimesRepeat)"
      , "TW 2014-06-03"
      , "Tw 01"
      , "Tw 04"
      , "Tw 18"
      , "Tw 40"
      , "Tw 41"
      , "Tw 528187147543511041"
      ]
    )
  , ("OR", ["Gong"])
  ,
    ( "PJ"
    , ["Forest Sounds"]
    )
  , ("RD", ["Oscillator Cluster"])
  , ("TM", ["Drummer", "Tw 463992770596577280"])
  ,
    ( "TW"
    , ["Tw 01", "Tw 02", "Tw 03"]
    )
  , ("ZS", ["Phase Distortion", "Toshiya"])
  ]

type TextureDb = [(Author, [Title])]

hsc3_texture_db :: TextureDb
hsc3_texture_db =
  [
    ( "F0"
    ,
      [ "Tw 0001"
      , "Tw 0002"
      , "Tw 0003"
      , "Tw 0004"
      , "Tw 0005"
      , "Tw 0006"
      , "Tw 0007"
      , "Tw 0100"
      , "Tw 0101"
      , "Tw 0112"
      , "Tw 0202"
      , "Tw 0205"
      , "Tw 0247"
      , "Tw 0252"
      , "Tw 0293"
      , "Tw 1591161283591782401"
      ]
    )
  ,
    ( "JMcC"
    ,
      [ "Alien Froggies"
      , "Alien Meadow"
      , "Birdies"
      , "Blips 001"
      , "Bouncing Objects"
      , "Bowed Garage Door Springs"
      , "Choip"
      , "Clustered Sines"
      , "Comb Delay Sweeps"
      , "Contamination Zone"
      , "Coolant"
      , "Cymbalism Accelerando"
      , "Cymbalism"
      , "Data Space"
      , "Deep Trip"
      , "Early Space Music Lp Side One"
      , "Hard Sync Sawtooth with Lfo"
      , "Hell is Busy"
      , "Inharmonic Warbulence"
      , "Landon Rose"
      , "Lots o' Sines"
      , "Narrow Band Filtered Crackle Noise"
      , "Noise Modulated Sawtooths"
      , "Noise Modulated Sines"
      , "Ostinoodles"
      , "Pentatonic Pipes"
      , "Phase Modulation"
      , "Pond Life"
      , "Pulse Harmonic Warbulence"
      , "Random Panning Sines"
      , "Random Pulsations"
      , "Random Sine Waves"
      , "Resonant Dust"
      , "Resonators Harmonic Series"
      , "Ring Modulated Klank"
      , "Rocks on Rails"
      , "Saucer Base"
      , "Sawed Cymbals"
      , "Sidereal Time"
      , "Slow Beating Harmonic Sines"
      , "Slow Beating Sines"
      , "String Wander Cluster"
      , "Swept Resonant Noise"
      , "Tapping Tools"
      , "Tremulate"
      , "Uplink"
      , "Wind Metals"
      , "Zizle"
      ]
    )
  ,
    ( "RD"
    , ["20060914"]
    )
  ]

filename_rewriter :: (Char -> Char) -> String -> String
filename_rewriter caseFunc =
  map caseFunc
    . map (\c -> if c == ' ' then '-' else c)
    . mapMaybe (\c -> if c `elem` "()?," then Nothing else Just c)

au_title_filename :: String -> String -> String
au_title_filename au nm = printf "%s-%s" (map toLower au) (filename_rewriter toLower nm)

{- | Db file names

> db_file_names hsc3_graph_db
> db_file_names hsc3_texture_db
-}
db_file_names :: GraphDb -> [String]
db_file_names = concatMap (\(au, gr) -> map (au_title_filename au) gr)
