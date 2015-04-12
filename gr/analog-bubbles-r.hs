import Sound.SC3.UGen.Rate {- hsc3 -}
import Sound.SC3.UGen.Record.DRF {- hsc3-rec -}

-- > draw analog_bubbles
analog_bubbles :: UGenR
analog_bubbles =
    let o = lfSaw {rate = KR,freq = mce [8,7.23]} * 3 + 80
        f = lfSaw {rate = KR,freq = 0.4} * 24 + o
        s = sinOsc {freq = midiCPS f} * 0.04
        c = combN {input = s,decaytime = 4}
    in out {input = c}

main :: IO ()
main = audition analog_bubbles
