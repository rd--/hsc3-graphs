-- https://github.com/supercollider-quarks/SynthDefPool/blob/master/pool/sos_bell.scd

import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.UGen.Bindings.DB.RDU as RDU {- sc3-rdu -}
import qualified Sound.SC3.Lang.Pattern as P {- hsc3-lang -}

mce_mean :: UGen -> UGen
mce_mean x = sum (mceChannels x) / fromIntegral (mceDegree_err x)

sos_bell :: UGen
sos_bell =
    let freq = control KR "freq" 440.0
        out_ = control KR "out" 0.0
        amp = control KR "amp" 0.1
        pan = control KR "pan" 0.0
        -- Stretched harmonic series
        son1 = sinOsc AR (mce [2,3,4.1,5.43,6.8,8.21] * freq) 0 * mce [1,0.9,0.8,0.7,0.6,0.5] * 0.1
        son2 = let e_dat = Envelope [0,1,0.3,0.2,0] [0,0.3,0.3,0.3] [] Nothing Nothing 0
               in son1 * envGen AR 1 1 0 1 DoNothing e_dat
        -- A bit of FM adds 'warble'
        son3 = son2 * (lfTri AR (RDU.randN 6 'α' 1.0 1.8) 1 * 0.3 + 0.7)
        -- Mix down the partials in the main sound
        son4 = mce_mean son3
        strike = let e_dat = Envelope [0,1,0.2,0.1,0] [0,0.01,0,0.04] [] Nothing Nothing 0
                     e =  envGen AR 1 1 0 1 DoNothing e_dat
                 in sinOsc AR (lfNoise1 'β' AR (freq * 36) * 100 + (freq * 8 )) 1 * 0.1 * e
        hum = let e_dat = Envelope [0,0.05,0.05,0] [0.5,0.5,1] [] Nothing Nothing 0
                  e = envGen AR 1 1 0 1 RemoveSynth e_dat
              in mce_mean (sinOsc AR (mce2 (freq * 1.01) (freq * 0.47)) 0 * e)
    in out out_ (pan2 ((son4 + strike + hum) * 4 * amp) pan 1)

sos_bell_syn :: Synthdef
sos_bell_syn = synthdef "sos_bell" sos_bell

main :: IO ()
main =
  P.paudition (P.pbind [(P.K_instr,P.psynth sos_bell_syn)
                       ,(P.K_degree,P.toP [0,2,4,7])
                       ,(P.K_dur,0.5)])

{-
import Sound.SC3.RW.PSynth
putStrLn$rewrite_param_list "freq=440,out=0,amp=0.1,pan=0"
-}
