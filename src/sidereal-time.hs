-- sidereal time (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Events.OverlapTexture

enumFromN :: Enum a => a -> Int -> [Int]
enumFromN e i = let j = fromEnum e in [j .. j + i]

sidereal_time :: UGen
sidereal_time =
  let p = 15
      z = let y n = let fr = map (\e -> expRand e 100 6000) (enumFromN n p)
                        rt = map (\e -> rand e 2 6) (enumFromN n p)
                    in klankSpec fr (replicate p 1) rt
          in mce2 (y 'a') (y 'A')
      f = xLine KR (expRand 'α' 40 300) (expRand 'β' 40 300) 12 DoNothing
      t = lfPulse AR f 0 (rand 'γ' 0.1 0.9) * 0.002 * max 0 (lfNoise2 'δ' KR (rand 'ε' 0 8))
      o = distort (klank t 1 0 1 (mceTranspose z)) * 0.1
  in combN o 0.6 (rand 'ζ' 0.1 0.6) 8 + mceReverse o

main :: IO ()
main = overlapTextureU (4,4,6,maxBound) sidereal_time

{-
var p = 15;
play({OverlapTexture.ar({
var z = Array.fill(2,{`[Array.fill(p,{exprand(100.0,6000.0)}),
                        nil,
                        Array.fill(p,{2.0 + 4.0.rand})]});
var f = XLine.kr(exprand(40.0,300.0),exprand(40.0,300.0),12);
var t = LFPulse.ar(f,rrand(0.1,0.9),0.002 * LFNoise2.kr(8.0.rand).max(0));
var o = Klank.ar(z,t).distort * 0.1;
CombN.ar(o,0.6,0.5.rand + 0.1,8,1,o.reverse);},4,4,6,2)}))
-}
