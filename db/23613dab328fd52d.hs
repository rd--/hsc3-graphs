-- moogLadder ; wind (Unsafe)
let mk _ = let n = whiteNoise ar
               force = lfNoise2 kr 0.25 `in_range` (0.25,0.75)
               freq = pianokey_to_cps (force * 88)
           in X.moogLadder n freq force
in splay (mceFill 6 mk) 1 1 0 True
