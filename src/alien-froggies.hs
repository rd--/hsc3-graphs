-- alien froggies (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Events.OverlapTexture

alien_froggies :: UGen -> (UGen,UGen)
alien_froggies r =
    let r' = fold (r * exp (linRand 'a' (-0.2) 0.2 0)) 1 30
        o = formant AR r' (expRand 'b' 200 3000) (rand 'c' 0 9 * r' + r')
    in (o * 0.05,r')

main :: IO ()
main = overlapTextureS (0.5,0.25,5,maxBound) alien_froggies 11

{-
var rate = 11.0;
play({OverlapTexture.ar({
rate = (rate * (0.2.bilinrand.exp)).fold(1.0,30.0);
var o = Formant.ar(rate,exprand(200,3000.0),9.0.rand * rate + rate,0.05)},
0.5,0.25,5,1)})
-}
