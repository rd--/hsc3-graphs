-- http://tai-studio.org/index.php/2012/02/alarm-clock-sound/
-- partial...

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Pattern {- hsc3-lang -}

grain :: UGen
grain =
    let o = control KR "out" 0
        f = control KR "freq" 100
        attack = control KR "attack" 0
        decay' = control KR "decay" 1
        sus = control KR "sustain" 0.1
        distort' = control KR "distort" 0
        fTime = control KR "fTime" 0.1
        fFac = control KR "fFac" 1.2
        amp' = control KR "amp" 1
        delay = control KR "delay" 0
        startFreq = fFac * f
        endFreq = f
        env l t = Envelope l t [] Nothing Nothing
        aEnv = let e = envPerc attack decay'
               in envGen AR 1 amp' 0 sus RemoveSynth e
        fEnv = let e = env [startFreq,endFreq] [fTime]
               in envGen AR 1 1 0 1 DoNothing e
        src = wrap2 (sinOsc AR fEnv 1 * (1 + distort')) 1
    in out o (delayN (src * mce2 aEnv aEnv) 0.1 delay)

pattern :: Enum e => (Field,e) -> [P_Bind]
pattern (f,z) =
    let f_mul = prand 'α' [4,1,2,3,4,8] inf
    in [(K_instr,pinstr "grain")
       ,(K_freq,prepeat f * f_mul * phold (pwhite z 0.99 1 inf))
       ,(K_dur,pseq [pseq [10,0.1,10] 1
                    ,pseq [0.1] 6
                    ,pseq [1,pseq [0.1] 6,1] inf] 1)
       ,(K_param "fTime",0.0125)
       ,(K_param "fFac",5)
       ,(K_sustain,0.1)
       ,(K_param "attack",0.0005)
       ,(K_param "decay",2)
       ,(K_amp,0.1)
       ,(K_param "delay",phold (pwhite z 0.01 0.1 inf * 0.1))]

main :: IO ()
main =
    let f = concat (replicate 12 [1200, 800, 600, 200])
        p = ppar (map (pbind . pattern) (zip f ['β'..]))
    in withSC3 (async (d_recv (synthdef "grain" grain)) >> play p)
