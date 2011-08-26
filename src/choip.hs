-- choip (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture

chain :: Int -> (t -> t) -> t -> t
chain j f x = if j == 0 then x else chain (j - 1) f (f x)

xl :: ID a => a -> a -> UGen -> UGen -> UGen -> UGen
xl e0 e1 l r t = xLine KR (expRand e0 l r) (expRand e1 l r) t DoNothing

r2 :: ID a => a -> UGen -> UGen
r2 e n = rand e (-n) n

choip :: UGen
choip =
    let t = 12
        i = impulse AR (xl 'a' 'b' 1 30 t) 0
        f = xl 'c' 'd' 600 8000 t
        a = sinOsc AR (decay2 i 0.05 0.5 * (-0.9 * f) + f) 0
        l = line KR (r2 'e' 1) (r2 'f' 1) t DoNothing
    in pan2 (decay2 (i * xl 'g' 'h' 0.01 0.5 t) 0.01 0.2 * a) l 1

choip_pp :: UGen -> UGen
choip_pp i =
    let f x = allpassN x 0.1 (mce2 (rand 'a' 0 0.05) (rand 'b' 0 0.05)) 4
    in chain 4 f i

main :: IO ()
main = overlapTextureU_pp (10,1,8,maxBound) choip 2 choip_pp

{-
var t = 12;
var z = OverlapTexture.ar({
  var i = Impulse.ar(XLine.kr(exprand(1,30),exprand(1,30),t));
  var f = XLine.kr(exprand(600.0,8000.0),exprand(600.0,8000.0),t);
  var a = SinOsc.ar(Decay2.ar(impulses,0.05,0.5,-0.9*f,f));
  var l = Line.kr(1.0.rand2,1.0.rand2,t);
  var j = XLine.kr(exprand(0.01,0.5),exprand(0.01,0.5),t);
  Pan2.ar(Decay2.ar(i * j,0.01,0.2,a),l)},t-2,1,8,2);
4.do({z = AllpassN.ar(z,0.1,[0.05.rand,0.05.rand],4)});
-}
