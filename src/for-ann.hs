-- http://musicweb.ucsd.edu/~tre/wordpress/?p=131

import Sound.OpenSoundControl {- hosc -}
import Sound.SC3 {- hsc3 -}

-- map sixth ["just","golden","equal"]
sixth :: Floating a => String -> a
sixth z =
    case z of
      "just" -> 8/5
      "golden" -> (sqrt 5 + 1) / 2
      "equal" -> 2 ** (8 / 12)
      _ -> 3/2

freq :: Double -> (Double,Double)
freq z =
    let n0 = 27.5
        n1 = n0 + (log z / log 2) * 12 * 12
    in (midiCPS n0,midiCPS n1)

for_ann :: Double -> Synthdef
for_ann z =
    let d = 33.6
        (f0,f1) = freq z
        k = constant
        f_e = Envelope [k f0,k f1] [d] [EnvExp] Nothing Nothing
        f = envGen AR 1 1 0 1 DoNothing f_e
        a_e = envLinen (d/4) (d/2) (d/4) 0.1
        a = envGen AR 1 1 0 1 RemoveSynth a_e
    in synthdef "for-ann" (out 0 (pan2 (sinOsc AR f 0 * a) 0 1))

score :: Double -> [OSC]
score z =
    let at t = Bundle (NTPr t)
        i = [d_recv (for_ann z),g_new [(1,AddToTail,0)]]
        s t = at t [s_new "for-ann" (-1) AddToTail 1 []]
    in at 0 i : map s [0,2.8 .. 669.2]

main :: IO ()
main = withSC3 (\fd -> performOSC fd (score (sixth "just")))
