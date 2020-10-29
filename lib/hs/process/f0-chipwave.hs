-- <http://sccode.org/1-4Q6> (f0)

import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Lang.Pattern.Plain as P {- hsc3-lang -}

-- * chipwave

control_n :: Rate -> String -> [Double] -> UGen
control_n rt nm =
    let f n = control rt (if n == 0 then nm else nm ++ show n)
    in mce . zipWith f [0::Int ..]

cw_ioscs :: [Double] -> [Double] -> UGen
cw_ioscs ws_def ps_def =
    let k = control KR
        k_n = control_n KR
        bus = k "out" 0
        amp = k "amp" 0.5
        freq = k "freq" 400
        width = k "width" 0.25
        gt = k "gate" 1
        atk = k "atk" 0.002
        dec = k "dec" 0
        sus = k "sus" 1
        rel = k "rel" 0.2
        ws = k_n "ws" ws_def
        ps = k_n "ps" ps_def
        e = envGen AR gt amp 0 1 RemoveSynth (envADSR_def atk dec sus rel)
        w = duty AR 0.025 0 DoNothing (dseq 'α' 1 ws)
        p = duty AR 0.025 0 DoNothing (dseq 'β' 1 ps)
        freq' = freq * midiRatio p
        ti = lfTri AR freq' 0 * 0.5 + 0.5
        sq = lfPulse AR freq' 0 (width * 0.5) * 2 - 1
        ns = lfNoise0 'γ' AR (freq' * 10)
        z = select w (mce [dc AR 0, ti, sq, ns])
    in out bus (leakDC (z * e) 0.995)

cw_ioscs_arp :: Synthdef
cw_ioscs_arp = synthdef "ioscs-arp" (cw_ioscs [0,2,2,3,2,2,2,2,2] [0,12,-12,0,7,0,7,0,7])

cw_ioscs_bass :: Synthdef
cw_ioscs_bass = synthdef "ioscs-bass" (cw_ioscs [0,1,1,1,1,1,1,1,1] [0,24,0,12,0,-1,1,-1,0])

-- > nrt_audition chipwave
chipwave :: NRT
chipwave =
    let a = (cw_ioscs_arp
            ,[("freq",cycle (map midiCPS [60,60,70,60,65,63]))
             ,("amp",repeat 0.15)
             ,("dur",repeat 0.25)
             ,("width",cycle [0,0.05 .. 1])])
        b = (cw_ioscs_bass
            ,[("freq",cycle (map midiCPS [40,48,48,60]))
             ,("amp",repeat 0.5)
             ,("rel",repeat 0.3)
             ,("dur",repeat 0.5)
             ,("width",repeat 0.5)
             ,("out",repeat 1)])
    in nrt_merge (P.sbind1 b) (P.sbind1 a)

main :: IO ()
main = nrt_audition chipwave
