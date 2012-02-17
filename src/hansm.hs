{-
http://www.fredrikolofsson.com/f0blog/?q=node/457
http://obiwannabe.co.uk/tutorials/html/tutorial_birds.html
-}

import Sound.OpenSoundControl {- hosc -}
import Sound.SC3 {- hsc3 -}

type T3 a = (a,a,a)
type Bird_Call_Param a = (T3 a,T3 a,T3 a,T3 a,T3 a)

bird_call :: Bird_Call_Param UGen -> IO ()
bird_call ((freq,atk,dcy)
          ,(fmod1,atkf1,dcyf1)
          ,(fmod2,atkf2,dcyf2)
          ,(amod1,atka1,dcya1)
          ,(amod2,atka2,dcya2)) =
    let mk_env a aT dT g lS md =
            let x = EnvNum (-4)
                c = Envelope [0,a,0] [aT,dT] [x,x] Nothing Nothing
            in envGen AR g lS 0 1 md c
        e = mk_env 0.5 atk dcy 1 1 RemoveSynth
        freq1 = mk_env fmod1 atkf1 dcyf1 1 3000 DoNothing
        freq2 = mk_env fmod2 atkf2 dcyf2 1 3000 DoNothing
        amp1 = mk_env amod1 atka1 dcya1 1 1 DoNothing
        amp2 = mk_env amod2 atka2 dcya2 1 1 DoNothing
        fmodc = sinOsc AR freq1 0 * amp1 + 1
        amod = 1 - sinOsc AR freq2 0 * amp2
        z = sinOsc AR ((freq * 7000 + 300) * fmodc) 0 * amod
    in audition (out 0 (pan2 z 0 e))

triple_tailed_tree_troubler :: (Fractional a) => Bird_Call_Param a
triple_tailed_tree_troubler =
    ((0.387755, 0.0204082, 0.204082)
    ,(0.367347, 0.571429, 0.734694)
    ,(0.918367, 1, 0.77551)
    ,(0.571429, 0.367347, 0.22449)
    ,(0.0204082, 0.183673, 0.44898))

speckled_throated_spew :: (Fractional a) => Bird_Call_Param a
speckled_throated_spew =
    ((0.183673, 0.591837, 0.387755)
    ,(0.0104082, 0.530612, 0.346939)
    ,(0.244898, 0.55102, 0.122449)
    ,(0.387755, 1, 0.612245)
    ,(0.346939, 0.816327, 0.653061))

lesser_spotted_grinchwarbler :: (Fractional a) => Bird_Call_Param a
lesser_spotted_grinchwarbler =
    ((0.55102, 0.591837, 0.387755)
    ,(0.0716327, 0.0204082, 0.346939)
    ,(0.0204082, 0.55102, 0.122449)
    ,(0.632653, 1, 0.612245)
    ,(0.346939, 0.816327, 0.653061))

long_toed_mudhopper :: (Fractional a) => Bird_Call_Param a
long_toed_mudhopper =
    ((0.163265, 0.22449, 0.183673)
    ,(0.00306122, 0.122449, 1)
    ,(0.0612245, 1, 0.77551)
    ,(0.979592, 0.204082, 0.734694)
    ,(1, 0.142857, 0.612245))

yellow_yiffled_yaffle :: (Fractional a) => Bird_Call_Param a
yellow_yiffled_yaffle =
    ((0.0204082, 0.367347, 0.183673)
    ,(0.0612245, 0, 1)
    ,(0.285714, 0.22449, 0.489796)
    ,(0.367347, 0.387755, 0.734694)
    ,(0.204082, 0.428571, 0.142857))

pointy_beaked_beetlefiend :: (Fractional a) => Bird_Call_Param a
pointy_beaked_beetlefiend =
    ((0.428571, 0.204082, 0.489796)
    ,(0.0204082, 0.795918, 0.591837)
    ,(0.285714, 0.22449, 0.489796)
    ,(0.204082, 0.836735, 0.734694)
    ,(0.77551, 0.428571, 0.142857))

african_boojuboolubala :: (Fractional a) => Bird_Call_Param a
african_boojuboolubala =
    ((0.306122, 0.959184, 0.0408163)
    ,(1, 0, 0.591837)
    ,(0.285714, 0.22449, 0.489796)
    ,(0.204082, 0.836735, 0.734694)
    ,(0.77551, 0.428571, 0.142857))

common_muckoink :: (Fractional a) => Bird_Call_Param a
common_muckoink =
    ((0.0204082, 0.8, 0.0816327)
    ,(0.0204082, 0.001, 0.99)
    ,(0.0204082, 0.01, 1)
    ,(1, 0.142857, 0.734694)
    ,(1, 0.0612245, 0.530612))

main :: IO ()
main = do
  let xs = [triple_tailed_tree_troubler
           ,speckled_throated_spew
           ,lesser_spotted_grinchwarbler
           ,long_toed_mudhopper
           ,yellow_yiffled_yaffle
           ,pointy_beaked_beetlefiend
           ,african_boojuboolubala
           ,common_muckoink]
      fn x = bird_call x >> pauseThread 1.25
  mapM_ fn xs
