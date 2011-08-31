-- rails (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture

rand2 :: ID a => a -> UGen -> UGen
rand2 e n = rand e (-n) n

rails :: UGen
rails =
    let n = 20 -- resonant modes
        e = dust 'a' AR 100 * 0.04 -- excitation
        f = xLine KR 3000 300 8 DoNothing -- sweep filter down
        l = line KR (rand2 'b' 1) (rand2 'c' 1) 8 DoNothing -- sweep pan
        r = upar' 'a' n (200 + linRand 'd' 0 3000 0) -- resonant frequencies
        a = replicate n 1
        t = upar' 'b' n (0.2 + rand 'e' 0 1) -- ring times
        k = klank (resonz e f 0.2) 1 0 1 (klankSpec r a t)
    in pan2 k l 1

main :: IO ()
main = overlapTextureU (2,3,4,maxBound) rails

{-
audition (out 0 rails)
Sound.SC3.UGen.Dot.draw rps
-}

{-
({var n = 20;
  var e = Dust.ar(100, 0.04);
  var f = XLine.kr(3000,300,8);
  var l = Line.kr(1.0.rand2, 1.0.rand2, 8);
  var r = Array.fill(n, { 200 + 3000.0.linrand });
  var t = Array.fill(n, { 0.2 + 1.0.rand });
  var k = Klank.ar(`[r,nil,t],Resonz.ar(e,f,0.2));
  Pan2.ar(k,l);
}.play)
-}
