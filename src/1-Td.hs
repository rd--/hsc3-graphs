-- http://sccode.org/1-Td

import Sound.OSC {- hosc -}
import Sound.SC3.ID {- hsc3 -}
import qualified Sound.SC3.Lang.Collection as C {- hsc3-lang -}
import Sound.SC3.UGen.External.RDU {- sc3-rdu -}

-- > audition one_td_u
one_td_u :: UGen
one_td_u =
    let base = control IR "base" 2.6
        z1 = C.geom 5 2 2
        z2 = C.geom 4 (base / 2) 2
        z3 = C.geom 5 (base / 4) 2
        z4 = C.geom 5 (1/8) 2
        z5 = [4,6..24]
        rand_sym z n = rand z (- n) n
        a = let fr = range 20 10000 (lfdNoise3 'a' KR (base / 4))
            in lfBrownNoise2 'a' AR fr 0.005 0
        b = let x = mouseX KR 0 (lchoose 'a' z1) Linear 0.2
            in gbmanL AR x (rand_sym 'a' 3) (rand_sym 'b' 3) / 3
        c = let y = mouseY KR 0 (lchoose 'b' z1) Linear 0.2
                fr = gbmanL AR y (rand_sym 'c' 3) (rand_sym 'd' 3)
            in impulse AR (a2K fr * base / 4) 0 / 4
        d = dust 'j' AR (lchoose 'c' z2) / 4
        e = impulse AR (lchoose 'd' z2) 0 / 4
        g = let n = lfdNoise3 'b' KR base
                fr = range (rand 'e' 62 100) (rand 'f' 110 350) n
            in lfPulse AR fr 0 0.5 * 0.003
        amp = let n = dxrand 'a' dinf (mce z3)
                  fr = demand (impulse KR (base / 16) 0) 0 n
                  g_f = lchoose 'e' z4
                  am = a2K (gbmanL AR g_f (rand_sym 'g' 3) (rand_sym 'h' 3))
              in sinOsc KR fr 0 * 0.1 * am + 0.1
        loc = let mu = rand 'i' 0.2 0.7
                  ad = rand 'j' 0 0.3
              in lfTri KR (base / lchoose 'f' z5) 0 * mu + ad
        klk = let fr = randN 30 'a' 50 10000
                  ph = randN 30 'a' 0 1
                  am = randN 30 'b' 0 1
                  l = klankSpec_mce fr ph am
              in klank (lchoose 'g' [a,b,c,d,e,g]) 1 0 1 l
        sig = pan2 klk loc amp
    in out 0 sig

one_td_s :: Synthdef
one_td_s = synthdef "one_td" one_td_u

postprocess_u :: UGen
postprocess_u =
    let z = freeVerb (in' 2 AR 0) (rand 'a' 0.33 1) 0.5 0.5
    in replaceOut 0 (limiter z 1 1e-2)

postprocess_s :: Synthdef
postprocess_s = synthdef "postprocess" postprocess_u

run :: Transport m => [Double] -> m ()
run n = do
  _ <- async (d_recv postprocess_s)
  _ <- async (d_recv one_td_s)
  send (s_new "postprocess" (-1) AddToTail 2 [])
  mapM_ (\i -> send (s_new "one_td" (-1) AddToHead 1 [("base",i)])) n

main :: IO ()
main = withSC3 (run (replicate 8 2.6))
