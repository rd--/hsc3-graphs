-- | why supercollider (jmcc) #0

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.UGen.Protect as Protect {- hsc3-rw -}
import qualified Sound.SC3.UGen.Bindings.DB.RDU as RDU {- sc3-rdu -}

-- > putStrLn $ synthstat_concise why_supercollider_protect
why_supercollider_protect :: UGen
why_supercollider_protect =
    let r = resonz (dust 'α' AR 0.2 * 50) (rand 'β' 200 3200) 0.003
        s = mix (Protect.uclone (const False) 'γ' 10 r)
        z = delayN s 0.048 0.048
        c = combL z 0.1 (lfNoise1 'δ' KR (rand 'ε' 0 0.1) * 0.04 + 0.05) 15
        y = mix (Protect.uclone (== s) 'ζ' 7 c)
        f i = allpassN i 0.05 (RDU.randN 2 'η' 0 0.05) 1
        x = Protect.useq (== y) 'θ' 4 f y
    in s + 0.2 * x
