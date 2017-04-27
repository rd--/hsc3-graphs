-- http://sccode.org/1-Td

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.UGen.Bindings.HW.External as E {- hsc3 -}
import qualified Sound.SC3.Lang.Collection as C {- hsc3-lang -}
import qualified Sound.SC3.UGen.External.RDU as RDU {- sc3-rdu -}

one_td_u :: UGen
one_td_u =
    let base = control IR "base" 2.6
        z1 = C.geom (5::Int) 2 2
        z2 = C.geom (4::Int) (base / 2) 2
        z3 = C.geom (5::Int) (base / 4) 2
        z4 = C.geom (5::Int) (1/8) 2
        z5 = [4,6..24]
        rand_sym z n = rand z (- n) n
        a = let fr = range 20 10000 (lfdNoise3 'α' KR (base / 4))
            in E.lfBrownNoise2 'β' AR fr 0.005 0
        b = let x = mouseX KR 0 (lchoose 'γ' z1) Linear 0.2
            in gbmanL AR x (rand_sym 'δ' 3) (rand_sym 'ε' 3) / 3
        c = let y = mouseY KR 0 (lchoose 'ζ' z1) Linear 0.2
                fr = gbmanL AR y (rand_sym 'η' 3) (rand_sym 'θ' 3)
            in impulse AR (a2K fr * base / 4) 0 / 4
        d = dust 'ι' AR (lchoose 'κ' z2) / 4
        e = impulse AR (lchoose 'λ' z2) 0 / 4
        g = let n = lfdNoise3 'μ' KR base
                fr = range (rand 'ν' 62 100) (rand 'ξ' 110 350) n
            in lfPulse AR fr 0 0.5 * 0.003
        amp = let n = dxrand 'ο' dinf (mce z3)
                  fr = demand (impulse KR (base / 16) 0) 0 n
                  g_f = lchoose 'π' z4
                  am = a2K (gbmanL AR g_f (rand_sym 'ρ' 3) (rand_sym 'σ' 3))
              in sinOsc KR fr 0 * 0.1 * am + 0.1
        loc = let mu = rand 'τ' 0.2 0.7
                  ad = rand 'υ' 0 0.3
              in lfTri KR (base / lchoose 'φ' z5) 0 * mu + ad
        klk = let fr = RDU.randN 30 'χ' 50 10000
                  ph = RDU.randN 30 'ψ' 0 1
                  am = RDU.randN 30 'ω' 0 1
                  l = klankSpec_mce fr ph am
              in klank (lchoose 'Α' [a,b,c,d,e,g]) 1 0 1 l
        sig = pan2 klk loc amp
    in out 0 sig

one_td_s :: Synthdef
one_td_s = synthdef "one_td" one_td_u

postprocess_u :: UGen
postprocess_u =
    let z = freeVerb (in' 2 AR 0) (rand 'Β' 0.33 1) 0.5 0.5
    in replaceOut 0 (limiter z 1 1e-2)

postprocess_s :: Synthdef
postprocess_s = synthdef "postprocess" postprocess_u

run :: Transport m => [Double] -> m ()
run n = do
  _ <- async (d_recv postprocess_s)
  _ <- async (d_recv one_td_s)
  sendMessage (s_new "postprocess" (-1) AddToTail 2 [])
  mapM_ (\i -> sendMessage (s_new "one_td" (-1) AddToHead 1 [("base",i)])) n

main :: IO ()
main = withSC3 (run (replicate 8 2.6))
