-- birds-am-fm (af)
-- http://www.obiwannabe.co.uk/tutorials/html/tutorial_birds.html
-- perhaps some mis-translations...

-- import Debug.Trace {- base -}
import System.Random {- random -}

import Sound.SC3 hiding (sweep) {- hsc3 -}

import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}
import qualified Sound.SC3.Lang.Random.Gen as R {- hsc3-lang -}

-- > audition (out 0 (pd_noise 'a' * 0.1))
pd_noise :: ID a => a -> UGen
pd_noise e = whiteNoise e AR

-- > audition (out 0 (pd_lop (pd_noise 'a') 500 * 0.1))
pd_lop :: UGen -> UGen -> UGen
pd_lop = lpf -- actually lop is one-pole, lpf is two pole...

-- > audition (out 0 (pd_osc 440 * 0.1))
pd_osc :: UGen -> UGen
pd_osc f = sinOsc AR f pi

-- > audition (out 0 (pd_phasor 440 * 0.1))
pd_phasor :: UGen -> UGen
pd_phasor f = linLin_b (lfSaw AR f 0) 0 1

-- | Ramp doesn't make sense with a constant input signal.
--
-- > audition (out 0 (pd_osc (pd_line (lfNoise0 'a' AR 0.5) 300 * 500 + 300) * 0.1))
pd_line :: UGen -> UGen -> UGen
pd_line x msec = if isConstant x then x else ramp x (msec / 1000)

-- > audition (out 0 (pd_clip (pd_osc 220) (-0.05) 0.05))
pd_clip :: UGen -> UGen -> UGen -> UGen
pd_clip = clip

-- > audition (out 0 (pd_cos (pd_phasor 440) * 0.1))
pd_cos :: Floating a => a -> a
pd_cos i = cos (i * 2 * pi)

-- > audition (out 0 (pd_vcf (pd_noise 'a') (pd_phasor 0.1 * 500 + 200) 6 * 0.1))
pd_vcf :: UGen -> UGen -> UGen -> UGen
pd_vcf i cf q = bpf i cf (1 / q)

data B n = B {artic :: n
             ,tweet :: n
             ,syr1a :: n
             ,syr1m :: n
             ,syr2a :: n
             ,syr2m :: n
             ,basef :: n
             ,sweep :: n
             ,moda :: n
             ,modb :: n
             ,tf1 :: n
             ,tb1 :: n
             ,tf2 :: n
             ,tb2 :: n
             ,reson :: n
             ,vol :: n}
         deriving (Show)

square :: Num a => a -> a
square n = n * n

-- > let (_,o) = autotweet (presets !! 0)
-- > Sound.SC3.UGen.Dot.draw o
-- > audition (out 0 (sinOsc AR (sqrt o * 1000) 0 * 0.1))
autotweet :: B UGen -> (UGen,UGen)
autotweet b_data =
    let artic' = pd_line (artic b_data) 300
        tweet' = tweet b_data * 3
        ph = let x = abs (pd_lop (pd_noise 'a') 0.01) * (tweet' * 1000)
                 y = pd_osc x * (x * tweet')
             in pd_lop (pd_phasor y) 2
    in (ph,square (pd_cos (pd_clip (artic' - ph) (-0.25) 0.25)))

type TW = (UGen, UGen, UGen, UGen, UGen, UGen, UGen)

-- > Sound.SC3.UGen.Dot.draw (tweetypie (1,2,3,4,5,6,7))
tweetypie :: TW -> UGen
tweetypie (a,b,c,d,e,f,g) =
    let m = pd_osc (pd_osc a * pd_osc b * c + d)
    in pd_lop ((pd_vcf m e g + pd_vcf m f g) * 0.5) 5000

modmatrix :: UGen -> B UGen -> TW
modmatrix modall b_data =
    let get var mul tm = pd_line (var b_data * mul) tm
        syr1a' = get syr1a 3000 300
        syr1m' = get syr1m 200 500
        syr2a' = get syr2a 3000 300
        syr2m' = get syr2m 200 500
        basef' = get basef 5000 300
        sweep' = get sweep 3000 300
        moda' = get moda 2000 300
        modb' = get modb 50 300
        tf1' = get tf1 3000 300
        tb1' = get tb1 3000 300
        tf2' = get tf2 3000 300
        tb2' = get tb2 3000 300
        reson' = reson b_data * 20 + 2
        a = (syr1a' * modall) + syr2a'
        b = let p = syr1a' + syr1m'
                q = p * modall
                r = syr2a' + syr2m'
            in q + r
        c = modall * moda' * modb'
        d = (modall * sweep') + basef'
        e = (modall * tf1') + tb1'
        f = (modall * tf2') + tb2'
    in (a,b,c,d,e,f,reson')

-- > Sound.SC3.UGen.Dot.draw (birdbox (presets !! 0))
birdbox :: B UGen -> UGen
birdbox b_data =
    let (modall,a) = autotweet b_data
        tw = tweetypie (modmatrix modall b_data)
        a' = sqrt a * 1000
    in pd_vcf tw a' 0.1 * vol b_data

-- > length presets == 13
presets :: Fractional n => [B n]
presets =
    [B 0.683544 0.658228 0.177215 0.0886076 0.911392 0.0126582 0.291139 0.772152 0.0886076 0.632911 0.316456 0.860759 0.227848 0.620253 0.417722 0.199808
    ,B 0.683544 0.582278 0.405063 0.78481 0.911392 0.0126582 0.848101 0.0506329 0.0886076 0.632911 0.316456 0.240506 0.113924 0.620253 0.417722 0.199808
    ,B 0.924051 0.936709 0.886076 0.78481 0 0.291139 0.126582 0.721519 0.0253165 0.189873 0.0759494 0.810127 0.329114 0.139241 0.0759494 0.243502
    ,B 0.455696 0.620253 0 0.0506329 0.0126582 0.0126582 0.56962 1 0.0506329 0.620253 0.949367 0.810127 0.848101 0.683544 0.0886076 0.127144
    ,B 0.21519 0.518987 0.379747 1 0.0126582 0.0126582 0.405063 1 0.0506329 0.620253 0.949367 0.164557 0.848101 0.164557 0.746835 0.372008
    ,B 0.886076 0.518987 0 0.0632911 0.0126582 0.0126582 0.278481 0.417722 0.0506329 0.278481 0.443038 0.164557 0.544304 0.164557 0.746835 0.372008
    ,B 0.962025 0.898734 0 0.278481 0.164557 0.822785 0.0759494 0.417722 0.556962 0.113924 0.291139 0.126582 0.544304 0.151899 0.911392 0.372008
    ,B 0.164557 0.974684 0.734177 0.670886 0.240506 0.202532 0.227848 0.392405 0.0253165 0.392405 0.291139 0.126582 0.544304 0.734177 0.379747 0.868261
    ,B 0.708861 0.721519 0.253165 0.0759494 0.658228 0.177215 0.746835 0.202532 0.329114 0.202532 0.417722 0.177215 0.392405 0.405063 1 0.314002
    ,B 0.392405 0.721519 0.0759494 0.316456 0.658228 0.177215 0.177215 0.848101 0.0886076 0.202532 0.417722 0.177215 0.392405 0.405063 1 0.314002
    ,B 0.379747 0.962025 0.265823 0.0126582 0.0886076 0.177215 0.721519 0.139241 0.113924 0.139241 0.0759494 0.759494 0.936709 0.911392 0.848101 0.314002
    ,B 0.291139 0.556962 0.0632911 0.0253165 0.0506329 0.0379747 0.0759494 0 0.177215 0.227848 0.0759494 0.240506 0.0379747 0.506329 0.924051 0.314002
    ,B 0.848101 0.772152 0.367089 0.189873 0.35443 0.0506329 0.0126582 0.177215 0.101266 0.0253165 0.924051 0.0886076 1 0.0886076 0.455696 0.732876]

-- > hearb (presets !! 4)
hearb :: B UGen -> IO ()
hearb = audition . out 0 . birdbox

main :: IO ()
main = do
  let f g = let (p,g') = R.choose presets g in (birdbox p,g')
  O.overlapTextureS (20,4,5,maxBound) f =<< getStdGen

-- Local Variables:
-- truncate-lines:t
-- End:
