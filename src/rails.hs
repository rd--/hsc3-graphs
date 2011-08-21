-- rails (jmcc)

import Sound.SC3.ID

rand2 :: ID a => a -> UGen -> UGen
rand2 e n = rand e (-n) n

mapr :: Int -> (Char -> b) -> [b]
mapr n f = map f (take n ['a'..])

rails :: UGen
rails =
    let n = 20 -- resonant modes
        e = dust 'a' AR 100 * 0.04 -- excitation
        f = xLine KR 3000 300 8 DoNothing -- sweep filter down
        l = line KR (rand2 'b' 1) (rand2 'c' 1) 8 DoNothing -- sweep pan
        r = mapr n (\i -> 200 + linRand i 0 3000 0) -- resonant frequencies
        a = replicate n 1
        t = mapr n (\i -> 0.2 + rand i 0 1) -- ring times
        k = klank (resonz e f 0.2) 1 0 1 (klankSpec r a t)
    in out 0 (pan2 k l 1)

main :: IO ()
main = audition rails

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
