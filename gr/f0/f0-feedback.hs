-- <http://www.fredrikolofsson.com/f0blog/?q=node/619> (f0)

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}

feedback4 :: UGen
feedback4 =
    let k = control KR
        freq = k "freq" 400
        amp = k "amp" 0.1
        fb = k "fb" 2
        del = k "del" 0.1
        lfo = k "lfo" 1
        rate = k "rate" 2
        cutoff = k "cutoff" 500
        env = envGen KR 1 1 0 1 RemoveSynth (envPerc 1  4)
        lin = delayN (hpf (localIn 1 AR 0) cutoff) 1 del
        src = sinOsc AR (freq + sinOsc AR rate 0 * lfo) (lin * 2 * pi * fb) * amp * env
    in mrg2 (out 0 (pan2 src 0 1)) (localOut src)

f0_fb_param :: [Param]
f0_fb_param =
    [[]
    ,[("del",0.5)]
    ,[("del",0.1),("cutoff",100)]
    ,[("del",0.1),("fb",3),("cutoff",100)]
    ,[("del",0.1),("fb",2),("lfo",15),("cutoff",100)]
    ,[("del",0.2),("fb",3),("lfo",100),("freq",100),("cutoff",100)]
    ,[("del",0.5),("fb",1),("lfo",200),("freq",300),("rate",0.01),("cutoff",100)]]

f0_fb_au :: Param -> IO ()
f0_fb_au p = audition_at (-1,AddToHead,1,p) feedback4 >> pauseThread (2::Double)

main :: IO ()
main = mapM_ f0_fb_au f0_fb_param
