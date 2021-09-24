-- moogLadder ; wind (Id)
let mk k = let n = whiteNoiseId k ar
               force = lfNoise2Id k kr 0.25 `in_range` (0.25,0.75)
               freq = pianokey_to_cps (force * 88)
           in X.moogLadder n freq force
in splay (mceFillInt 6 mk) 1 1 0 True
