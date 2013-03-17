-- http://tai-studio.org/index.php/2012/02/alarm-clock-sound/
-- partial...

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.Event {- hsc3-lang -}
import Sound.SC3.Lang.Control.Instrument {- hsc3-lang -}
import Sound.SC3.Lang.Pattern.ID

grain :: UGen
grain =
    let o = control KR "out" 0
        freq' = control KR "freq" 100
        attack = control KR "attack" 0
        decay' = control KR "decay" 1
        sustain' = control KR "sustain" 0.1
        distort' = control KR "distort" 0
        fTime = control KR "fTime" 0.1
        fFac = control KR "fFac" 1.2
        amp' = control KR "amp" 1
        delay = control KR "delay" 0
        startFreq = fFac * freq'
        endFreq = freq'
        env l t = Envelope l t [] Nothing Nothing
        aEnv = let e = envPerc attack decay'
               in envGen AR 1 amp' 0 sustain' RemoveSynth e
        fEnv = let e = env [startFreq,endFreq] [fTime]
               in envGen AR 1 1 0 1 DoNothing e
        src = wrap2 (sinOsc AR fEnv 1 * (1 + distort')) 1
    in out o (delayN (src * mce2 aEnv aEnv) 0.1 delay)

pattern :: Enum e => (Field,e) -> P_Bind
pattern (f,z) =
    let f_mul = prand 'α' [4,1,2,3,4,8] inf
    in [("freq",return f * f_mul * pwhite z 0.99 1 (12 * 4))
       ,("dur",pseq [pseq [10,0.1,10] 1,pseq [0.1] 6
                    ,pseq [1,pseq [0.1] 6,1] inf] 1)
       ,("fTime",0.0125)
       ,("fFac",5)
       ,("sustain",0.1)
       ,("attack",0.0005)
       ,("decay",2)
       ,("amp",0.1)
       ,("delay",pwhite z 0.01 0.1 1 * 0.1)]

grain_ip :: P Instrument
grain_ip =
    let n = "grain"
        s = synthdef n grain
    in pcons (InstrumentDef s False) (prepeat (InstrumentName n False))

main :: IO ()
main =
    let f = concat (replicate 12 [1200, 800, 600, 200])
        p = ppar (map (pbind . pattern) (zip f ['β'..]))
    in audition (pinstr grain_ip p)
