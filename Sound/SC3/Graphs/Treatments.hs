module Sound.SC3.Graphs.Treatments where

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.UGen.Protect {- hsc3 -}
import qualified Sound.SC3.UGen.Bindings.DB.External as E {- hsc3 -}
import qualified Sound.SC3.UGen.Bindings.HW.External as E {- hsc3 -}

import qualified Sound.SC3.UGen.Bindings.DB.RDU as RDU {- sc3-rdu -}

import Music.Theory.Tuple {- hmt -}

epsilon :: Double
epsilon = 1e-6

-- * Time

ms_to_sec :: Fractional n => n -> n
ms_to_sec = (/ 1000)

sec_to_ms :: Fractional n => n -> n
sec_to_ms = (* 1000)

-- * UGen

-- | ugen_if 1 x y is x, ugen_if 0 x y is y.
ugen_if :: Num a => a -> a -> a -> a
ugen_if a b c = (a * b) + ((1 - a) * c)

-- | Abbreviation, equal to 'control' 'KR'.
ctl :: String -> Double -> UGen
ctl = control KR

-- | A /pre/ (@0@) & /post/ (@1@) mix operator.  pre=dry & post=wet
pre_post_mix :: Num a => a -> a -> a -> a
pre_post_mix mx pre post = ((1 - mx) * pre) + (mx * post)

rsinosc :: Rate -> T3 UGen -> UGen
rsinosc rt (z0,z1,fr) = range z0 z1 (sinOsc rt fr 0) -- rng_osc_kr (z0,z1,1/fr)

rng_osc :: T3 UGen -> UGen
rng_osc (z0,z1,t) = rsinosc AR (z0,z1,1/t) -- range z0 z1 (sinOsc AR (1/t) 0)

rng_osc_kr :: T3 UGen -> UGen
rng_osc_kr (z0,z1,t) = rsinosc KR (z0,z1,1/t) -- range z0 z1 (sinOsc KR (1/t) 0)

-- * Param

-- | (name,value)
type Param1 = (String,Double)
type Param = [Param1]
type Param2 = T2 Param1
type Param3 = T3 Param1
type Param5 = T5 Param1
type Param6 = T6 Param1
type Param8 = T8 Param1
type Param9 = T9 Param1

param1_to_ctl :: Param1 -> UGen
param1_to_ctl (nm,df) = control KR nm df

-- * Meta

-- | Input meta-data, @(name,min,max,def,warp,units)@.
type Meta1 = (String,Double,Double,Double,String,String)
type Meta = [Meta1]

meta1_to_param1 :: Meta1 -> Param1
meta1_to_param1 (nm,_,_,df,_,_) = (nm,df)

mctl :: Meta1 -> UGen
mctl (nm,l,r,df,w,u) =
    let m = (l,r,w,0,u)
    in meta_control KR nm df m

bus_meta :: Double -> Meta1
bus_meta n = ("bus",0,100,n,"lin","#")

k_meta :: Maybe Int -> Meta1 -> Meta1
k_meta k (nm,l,r,d,w,u) = (nm ++ maybe "" show k,l,r,d,w,u)

freqk_meta :: Maybe Int -> Double -> Meta1
freqk_meta k n = k_meta k ("freq",20,20000,n,"exp","hz")

freq_meta :: Double -> Meta1
freq_meta = freqk_meta Nothing

ampk_meta :: Maybe Int -> Double -> Meta1
ampk_meta k n = k_meta k ("amp",0,1,n,"amp","*")

amp_meta :: Double -> Meta1
amp_meta = ampk_meta Nothing

-- * Treatment

type Treatment = UGen -> UGen

-- unless bypass ramps up & down it's no better than n_run?
treatment_syn :: Int -> String -> Treatment -> Synthdef
treatment_syn nc nm tr =
    let b = mctl (bus_meta 0)
        i = in' nc AR b
        mx = mctl ("mx",0,1,1,"lin","*")
        m = pre_post_mix mx i (tr i) * envGate_def
        bp = mctl ("bypass",0,1,0,"lin","*")
        o = ugen_if (bp >** 0) i m
    in synthdef nm (replaceOut b o)

-- * Audition

-- | nc = number of channels, bus = audio bus index, mx = pre/post mix, ugen_f = process
add_t_sig :: (Int,Double,Double) -> Treatment -> UGen
add_t_sig (nc,bus,mx) ugen_f =
  let mx_ctl = mctl ("mx",0,1,mx,"lin","*")
      bus_ctl = mctl ("bus",0,31,bus,"lin","bus")
      pre = in' nc AR bus_ctl
  in replaceOut bus_ctl (pre_post_mix mx_ctl pre (ugen_f pre))

add_t_opt :: (Node_Id,Group_Id) -> (Int,Double,Double) -> Treatment -> IO ()
add_t_opt (nid,grp) opt ugen_f = audition_at (nid,AddToTail,grp,[]) (add_t_sig opt ugen_f)

add_t :: (Int,Double,Double) -> Treatment -> IO ()
add_t = add_t_opt (-1,2)

-- * octave

-- http://en.wikipedia.org/wiki/Octave_effect
octave1 :: Treatment
octave1 z = leakDC (abs z) 0.995

octave1_syn :: Synthdef
octave1_syn = treatment_syn 1 "octave1" octave1

-- http://msp.ucsd.edu/techniques/latest/book-html/node82.html
--
-- > run_t 1 id
-- > add_t (1,0,1) octave2
-- > add_t (1,0,1) (stereo_tremolo1 4 1 6 . octave2)
octave2 :: Treatment
octave2 i =
    let p = pitch i 440 60 4000 100 16 1 0.01 0.5 1 0
        (f,_) = unmce2 p
    in sinOsc AR (f * 0.5) 0 * i

octave2_syn :: Synthdef
octave2_syn = treatment_syn 1 "octave2" octave2

-- > add_t (1,0,1) octave3
octave3 :: Treatment
octave3 i =
    let p = pitch i 440 60 4000 100 16 1 0.01 0.5 1 0
        (f,tr) = unmce2 p
        n = cpsMIDI f
        f' = midiCPS (roundE n)
    in lag3 tr 0.1 * lfTri AR (f' * 0.5) 0 * i

octave3_syn :: Synthdef
octave3_syn = treatment_syn 1 "octave3" octave3

-- > add_t (1,0,1) octave4
octave4 :: Treatment
octave4 i =
    let dv = pulseDivider i 4 0
    in toggleFF dv * 2 - 1

-- > add_t (1,0,1) octave5
octave5 :: Treatment
octave5 i =
    let dv = pulseDivider i 4 0
        sq = toggleFF dv * 2 - 1
        fr = zeroCrossing i
    in lpf (i * sq) fr

-- * distortion

-- aaf = pre-gain,post-gain,lpf-freq
distort_aaf :: (UGen -> UGen) -> T3 UGen -> Treatment
distort_aaf fn (amp0,amp1,freq) z = lpf (fn (z * amp0) * amp1) freq

distort1 :: T3 UGen -> Treatment
distort1 = distort_aaf distort

distort_aaf_meta :: T3 Meta1
distort_aaf_meta =
    (("pre-gain",0,16,1,"amp","*")
    ,("post-gain",0,1,1,"amp","*")
    ,("tone",1000,20000,12000,"exp","hz"))

distort1_p :: Treatment
distort1_p = distort1 (t3_map mctl distort_aaf_meta)

distort1_syn :: Synthdef
distort1_syn = treatment_syn 1 "distort1" distort1_p

distort2 :: T3 UGen -> UGen -> UGen
distort2 = distort_aaf softClip

distort2_p :: Treatment
distort2_p = distort2 (t3_map mctl distort_aaf_meta)

distort2_syn :: Synthdef
distort2_syn = treatment_syn 1 "distort2" distort2_p

distort3 :: T8 UGen -> Treatment
distort3 (hp_freq,gain0,amount,lp_freq,gain1,p_freq,p_rq,p_db) z =
    let z' = hpf z hp_freq * gain0
        amCoef = 2 * amount / (1 - amount)
        d = (1 + amCoef) * (z' / (1 + (amCoef * abs z')))
        d' = lpf d lp_freq * gain1
    in midEQ d' p_freq p_rq p_db

distort3_meta :: T8 Meta1
distort3_meta =
    (("hp_freq",100,10000,400,"exp","hz")
    ,("gain0",0,20,5,"amp","*")
    ,("amount",(-1),1,0.99,"lin","")
    ,("lp_freq",1000,20000,3800,"exp","hz")
    ,("gain1",0,1,0.5,"amp","*")
    ,("p_freq",100,6000,120,"exp","hz")
    ,("p_rq",0,1,0.7,"lin","1/Q")
    ,("p_db",-24,24,8,"lin","db"))

distort3_p :: Treatment
distort3_p = distort3 (t8_map mctl distort3_meta)

distort3_syn :: Synthdef
distort3_syn = treatment_syn 1 "distort3" distort3_p

distort4 :: T3 UGen -> UGen -> UGen
distort4 = distort_aaf tanh

distort4_p :: Treatment
distort4_p = distort4 (t3_map mctl distort_aaf_meta)

distort4_syn :: Synthdef
distort4_syn = treatment_syn 1 "distort4" distort4_p

-- > add_t (1,0,1) (distort5 (rng_osc_kr(1,50,10),0.1,12000))
distort5 :: T3 UGen -> Treatment
distort5 = distort_aaf (\z -> (atan (z * 25) * 2) / pi)

distort5_p :: Treatment
distort5_p = distort5 (t3_map mctl distort_aaf_meta)

distort5_syn :: Synthdef
distort5_syn = treatment_syn 1 "distort5" distort5_p

-- * ringmod

-- > add_t (1,0,1) (ringmod1 100)
-- > add_t (1,0,1) (ringmod1 3500)
ringmod1 :: UGen -> Treatment
ringmod1 f = (*) (sinOsc AR f 0)

ringmod1_p :: Treatment
ringmod1_p = ringmod1 (mctl (freq_meta 100))

ringmod1_syn :: Synthdef
ringmod1_syn = treatment_syn 1 "ringmod1" ringmod1_p

-- > add_t (1,0,1) (ringmod2 500 3500)
ringmod2 :: UGen -> UGen -> Treatment
ringmod2 f0 f1 =
    let f = range f0 f1 (sinOsc AR (1/25) 0)
    in (*) (sinOsc AR f 0)

ringmod2_p :: Treatment
ringmod2_p = ringmod2 (ctl "freq0" 500) (ctl "freq1" 3500)

ringmod2_syn :: Synthdef
ringmod2_syn = treatment_syn 1 "ringmod2" ringmod2_p

-- > add_t (1,0,1) (ringmod3 500 3500)
ringmod3 :: UGen -> UGen -> Treatment
ringmod3 f0 f1 =
    let f = range f0 f1 (sinOsc AR (1/25) 0)
        w = range 0 1 (sinOsc AR (1/12.5) 0)
    in (*) (lfPulse AR f 0 w)

ringmod3_p :: Treatment
ringmod3_p = ringmod3 (ctl "freq0" 500) (ctl "freq1" 3500)

ringmod3_syn :: Synthdef
ringmod3_syn = treatment_syn 1 "ringmod3" ringmod3_p

-- > add_t (1,0,1) (ringmod4 500 3500 1 0)
-- > add_t (1,0,0.5) (ringmod4 2700 3100 0.25 2)
ringmod4 :: UGen -> UGen -> UGen -> UGen -> Treatment
ringmod4 f0 f1 r l =
    let t = dust 'α' KR r
        f = lag3 (tRand 'β' f0 f1 t) l
    in (*) (sinOsc AR f 0)

ringmod4_p :: Treatment
ringmod4_p = ringmod4 (ctl "freq0" 500) (ctl "freq1" 3500) (ctl "rate" 1) (ctl "lag" 0)

ringmod4_syn :: Synthdef
ringmod4_syn = treatment_syn 1 "ringmod4" ringmod4_p

-- > add_t (1,0,0.5) ringmod5
ringmod5 :: Treatment
ringmod5 i =
    let (f,_) = unmce2 (pitch i 440 60 4000 100 16 1 1e-2 0.5 1 0)
        a = amplitude KR i 1e-2 1e-2
        f' = f + sinOsc AR (1/4) 0 * 9 - 4.5
        o = lfSaw AR (f' / 2) 0 * a * 0.5
    in o + (i * sinOsc AR (f * (13/4)) 0)

ringmod5_syn :: Synthdef
ringmod5_syn = treatment_syn 1 "ringmod5" ringmod5

-- * chorus

chorus0_meta :: T3 Meta1
chorus0_meta =
    (("predelay",1,40,20,"lin","ms")
    ,("speed",0.01,1,0.05,"exp","hz")
    ,("depth",0,20,100,"lin","ms"))

chorus0 :: Double -> Double -> T3 UGen -> Treatment
chorus0 max_dt iphase (predelay,speed,depth) i =
    let o = lfPar KR speed (constant iphase)
        dt = o * ms_to_sec depth + ms_to_sec predelay
    in delayC i (constant max_dt) dt

chorus0_p :: Double -> Treatment
chorus0_p max_dt = chorus0 max_dt 0 (t3_map mctl chorus0_meta)

chorus0_syn :: Double -> Synthdef
chorus0_syn max_dt = treatment_syn 1 "chorus0" (chorus0_p max_dt)

chorus1_meta :: T4 Meta1
chorus1_meta =
    (("predelay",1,100,80,"lin","ms")
    ,("speed",0.01,10,0.05,"exp","hz")
    ,("depth",0,150,100,"lin","ms")
    ,("ph_diff",0,pi,0.5,"lin","radians"))

chorus1 :: Int -> Double -> T4 UGen -> Treatment
chorus1 numDelays max_dt (predelay,speed,depth,ph_diff) i =
    let i' = i / sqrt (constant numDelays)
        m k = let o = lfPar KR (speed * rand k 0.94 1.06) (ph_diff * constant k)
              in o * ms_to_sec depth + ms_to_sec predelay
        dt = map m [0 .. numDelays]
    in sum (map (delayC i' (constant max_dt)) dt)

chorus1_p :: Int -> Double -> Treatment
chorus1_p nd max_dt = chorus1 nd max_dt (t4_map mctl chorus1_meta)

chorus1_syn :: Int -> Double -> Synthdef
chorus1_syn nd max_dt =
    let nm = "chorus1-" ++ show nd
    in treatment_syn 1 nm (chorus1_p nd max_dt)

-- * tremolo

tremolo1 :: T3 UGen -> Treatment
tremolo1 (f,a0,a1) = (*) (range a0 a1 (sinOsc AR f 0))

tremolo1_meta :: T3 Meta1
tremolo1_meta =
    (("freq",0.01,10,1,"exp","hz")
    ,ampk_meta (Just 0) 0
    ,ampk_meta (Just 1) 1)

tremolo1_p :: Treatment
tremolo1_p = tremolo1 (t3_map mctl tremolo1_meta)

tremolo1_syn :: Synthdef
tremolo1_syn = treatment_syn 1 "tremolo1" tremolo1_p

-- > add_t (1,0,0.5) (tremolo2 4 8 (1/10) 0 1)
-- > add_t (1,0,0.5) (tremolo2 3 12 (1/16) 0 0.5)
tremolo2 :: UGen -> UGen -> UGen -> UGen -> UGen -> Treatment
tremolo2 f0 f1 ft a0 a1 =
    let f = range f0 f1 (sinOsc KR ft 0)
        a = range a0 a1 (sinOsc AR f 0)
    in (*) a

-- > add_t (1,0,1) (tremolo3 4 1)
tremolo3 :: UGen -> UGen -> Treatment
tremolo3 rt dp = (*) (range (1 - dp) 1 (sinOsc KR rt 0))

-- > add_t (1,0,1) (stereo_tremolo1 4 1 6)
-- > add_t (1,0,1) (stereo_tremolo1 4 1 6 . tremolo3 0.25 0.5)
stereo_tremolo1 :: UGen -> UGen -> UGen -> Treatment
stereo_tremolo1 rt dp dv z =
    let l = range (-1) 1 (sinOsc KR (rt / dv) 0)
    in pan2 z l (tremolo3 rt dp 1)

-- > add_t (1,0,1) (stereo_tremolo2 (mce2 4 (1/6)) (mce2 1 0.1) (mce2 6 1))
stereo_tremolo2 :: UGen -> UGen -> UGen -> Treatment
stereo_tremolo2 rt dp dv z =
    let a = mix (range 0 dp (sinOsc KR rt 0))
        l = range (-1) 1 (mix (sinOsc KR (rt / dv) 0))
    in pan2 z l a

-- > add_t (1,0,1) (tremolo4 0 9 1)
-- > add_t (1,0,1) (tremolo4 1 9 1)
-- > add_t (1,0,1) (tremolo4 (rng_osc_kr (0,1,3)) 4 1)
tremolo4 :: UGen -> UGen -> UGen -> Treatment
tremolo4 shp rt dp =
    let tr = lfTri KR rt 0
        sn = sinOsc KR rt pi
        o = (shp - 1) * tr + shp * sn
    in (*) (range (1 - dp) 1 o)

-- > audition (out 0 (shp_osc AR (rng_osc_kr (0,1,3)) 440 * 0.1))
shp_osc :: Rate -> UGen -> UGen -> UGen
shp_osc cr shp rt =
    let tr = lfTri cr rt 0
        sn = sinOsc cr rt pi
    in (shp - 1) * tr + shp * sn

-- > add_t (1,0,1) (stereo_tremolo3 0.5 4 1 6)
-- > add_t (1,0,1) (stereo_tremolo3 (rng_osc_kr (0,1,3)) 4 1 6)
stereo_tremolo3 :: UGen -> UGen -> UGen -> UGen -> Treatment
stereo_tremolo3 shp rt dp dv z =
    let l = range (-1) 1 (shp_osc KR shp (rt / dv))
    in pan2 z l (tremolo4 shp rt dp 1)

stereo_tremolo3_p :: Treatment
stereo_tremolo3_p =
    stereo_tremolo3
    (ctl "shape" 0.5)
    (ctl "rate" 4)
    (ctl "depth" 1)
    (ctl "stdiv" 6)

stereo_tremolo3_syn :: Synthdef
stereo_tremolo3_syn = treatment_syn 1 "stereo-tremolo3" stereo_tremolo3_p

-- * flanger

-- > add_t (1,0,1) (flanger1' 0.013 0.1 0.08 0.06 0 0)
-- > add_t (1,0,1) (flanger1' 0.013 0.04 0.04 0.01 0.08 0.01)
-- > add_t (1,0,1) (flanger1' 0.013 0.04 0.04 1 0.08 0.01)
-- > add_t (1,0,1) (flanger1' 0.013 0.43 0.2 0.1 0.08 0)
-- > add_t (1,0,1) (flanger1' 0.013 0.93 0.9 0.8 0.8 0)
flanger1' :: Double -> UGen -> UGen -> UGen -> UGen -> UGen -> Treatment
flanger1' dt_max delay depth rate fb dcy i =
    let l = localIn' 1 AR
        rate_max = 10.0
        dt_max' = constant dt_max
        d = let dt = lfPar KR (rate * rate_max) 0 * (depth * dt_max') + (delay * dt_max')
            in allpassC (i + (l * fb)) (dt_max' * 2) dt dcy
        m = i + d
    in mrg2 m (localOut m)

flanger1 :: T5 UGen -> Treatment
flanger1 (a,b,c,d,e) = flanger1' 0.013 a b c d e

flanger1_param :: Param5
flanger1_param = (("delay",0.1),("depth",0.08),("rate",0.06),("feedback",0),("decay",0))

flanger1_p :: Treatment
flanger1_p = flanger1 (t5_map param1_to_ctl flanger1_param)

flanger1_syn :: Synthdef
flanger1_syn = treatment_syn 1 "flanger1" flanger1_p

-- > add_t (1,0,0.65) hf_flanger1
-- > add_t (1,0,0.35) hf_flanger1
hf_flanger1 :: Treatment
hf_flanger1 i = pitchShift i 0.2 2 0.005 0.005

-- > add_t (1,0,0.15) (hf_flanger2 0.1 0.08 0.06 0 0)
-- > add_t (1,0,0.35) (hf_flanger2 0.04 0.04 1 0.08 0.01)
hf_flanger2 :: UGen -> UGen -> UGen -> UGen -> UGen -> Treatment
hf_flanger2 delay depth rate fb dcy i =
    let i' = pitchShift i 0.2 2.0 0.005 0.005
        l = localIn' 1 AR
        dt_max = double_to_ugen 0.013
        rate_max = 10.0
        d = let dt = lfPar KR (rate * rate_max) 0 * (depth * dt_max) + (delay * dt_max)
            in allpassC (i' + (l * fb)) (dt_max * 2) dt dcy
        m = i' + d
    in mrg2 m (localOut m)

-- * reverb

-- > add_t (1,0,0.5) reverb1
reverb1 :: Treatment
reverb1 i = E.zitaRev i i 0.04 200 3 2 6000 160 0 2500 0 1 (-6)

-- > add_t (1,0,0.5) reverb2
reverb2 :: Treatment
reverb2 i = E.zitaRev i i 0.08 200 6 4 6000 190 (-6) 3500 6 1 0

-- * tank/reverb

{- <http://create.ucsb.edu/pipermail/sc-users/2004-April/009692.html> -}
tank_f :: UGen -> UGen
tank_f i =
    let l0 = localIn 2 AR (mce2 0 0) * mctl ("fb_gain",0,0.98,0.98,"lin","*")
        l1 = onePole l0 0.33
        (l1l,l1r) = unmce2 l1
        l2 = rotate2 l1l l1r 0.23
        l3 = allpassN l2 0.05 (RDU.randN 2 'α' 0.01 0.05) 2
        l4 = delayN l3 0.3 (mce2 0.17 0.23)
        l5 = allpassN l4 0.05 (RDU.randN 2 'β' 0.03 0.15) 2
        l6 = leakDC l5 0.995
        l7 = l6 + i
    in mrg [l7,localOut l7]

r_allpass :: UGen -> UGen
r_allpass i = allpassN i 0.03 (RDU.randN 2 'γ' 0.005 0.02) 1

tank_rev :: Treatment
tank_rev = tank_f . useq 'δ' 4 r_allpass

-- * pitchshift

-- > add_t (1,0,0.5) (pitchshift1 1.5 0 0)
-- > add_t (1,0,0.5) (pitchshift1 1.01 0 0)
pitchshift1 :: UGen -> UGen -> UGen -> Treatment
pitchshift1 pr pd td i = pitchShift i 0.2 pr pd td

-- > add_t (1,0,0.5) (pitchshift2 0.95 1.05 0.25 0 0)
-- > add_t (1,0,0.5) (pitchshift2 (2/3) (3/2) 5 0 0)
pitchshift2 :: UGen -> UGen -> UGen -> UGen -> UGen -> Treatment
pitchshift2 pr0 pr1 prt pd td i =
    let pr = range pr0 pr1 (sinOsc KR (1/prt) 0)
    in pitchShift i 0.2 pr pd td

-- > add_t (1,0,1) pps1
pps1 :: Treatment
pps1 z =
    let pd = mouseX KR 0.0 0.05 Linear 0.1
        td = mouseY KR 0.0 0.05 Linear 0.1
    in pitchShift z 0.2 (mce2 1.0 1.5) pd td

-- > add_t (1,0,1) (pps2 (0.025,0.025))
pps2 :: T2 UGen -> Treatment
pps2 (pd,td) s = pitchShift s 0.2 (mce2 1.0 1.5) pd td

pps2_param :: Param2
pps2_param = (("pitch",0.025),("time",0.025))

pps2_p :: Treatment
pps2_p = pps2 (t2_map param1_to_ctl pps2_param)

pps2_syn :: Synthdef
pps2_syn = treatment_syn 1 "pps2" pps2_p

-- > add_t (1,0,1) (pps3 (1,3/2,0.005,3,0.025,0.025))
-- > add_t (1,0,1) (pps3 (3/2,2,0.005,3,0.025,0.025))
pps3 :: T6 UGen -> Treatment
pps3 (r1,r2,dr,dt,pd,td) s =
    let f n = rng_osc_kr (n-dr,n+dr,dt)
    in pitchShift s 0.2 (mce2 (f r1) (f r2)) pd td

pps3_param :: Param6
pps3_param =
    (("ratio1",1)
    ,("ratio2",1.5)
    ,("drift-m",0.005)
    ,("drift-t",3)
    ,("pitch",0.025)
    ,("time",0.025))

pps3_p :: Treatment
pps3_p = pps3 (t6_map param1_to_ctl pps3_param)

pps3_syn :: Synthdef
pps3_syn = treatment_syn 1 "pps3" pps3_p

-- > add_t (1,0,1) (vibrato1 0.95 1.05 0.75 0 0)
-- > add_t (1,0,1) (vibrato1 0.995 1.005 0.75 0 0)
-- > add_t (1,0,1) (vibrato1 0.995 1.005 (range 0.25 0.75 (sinOsc KR (1/6) 0)) 0 0)
vibrato1 :: UGen -> UGen -> UGen -> UGen -> UGen -> Treatment
vibrato1 pr0 pr1 prt pd td i =
    let pr = range pr0 pr1 (sinOsc KR (1/prt) 0)
    in pitchShift i 0.2 pr pd td

-- > add_t (1,0,1) (rfilter1 100 3500 12 0.1 1 9)
-- > add_t (1,0,1) (rfilter1 120 3300 13 0.05 1.35 13)
-- > add_t (1,0,1) (rfilter1 200 2300 7 0.1 2 4)
rfilter1 :: UGen -> UGen -> UGen -> UGen -> UGen -> UGen -> Treatment
rfilter1 f0 f1 ft w0 w1 wt i =
    let f = range f0 f1 (sinOsc KR (1/ft) 0)
        w = range w0 w1 (sinOsc KR (1/wt) 0)
    in resonz i f w

-- > add_t (1,0,1) (ashape1 0.5 0.5 0.1 0.3 0.5 0.3 1)
-- > add_t (1,0,1) (ashape1 0.25 0.75 0.1 0.3 0.5 0.3 1)
-- > add_t (1,0,1) (ashape1 0.25 0.75 0.01 0.15 0.75 0.5 1)
ashape1 :: UGen -> UGen -> UGen -> UGen -> UGen -> UGen -> UGen -> Treatment
ashape1 t w aT dT sL rT pL =
    let t' = t * w
        e = envADSR (aT * t') (dT * t') sL (rT * t') pL (EnvNum (-4)) 0
        g = lfPulse AR (1/t) 0 w
        a = envGen AR g 1 0 1 DoNothing e
    in (*) a

-- > run_t 1 (ashape2 0.25 (0.5,0.75,9) (0.01,0.1,7) (0.15,0.35,13) (0.5,0.75,9) (0.35,0.65,15) (0.5,1,5))
-- > run_t 1 (ashape2 0.15 (0.5,0.75,9) (0.1,0.3,7) (0.25,0.45,13) (0.65,0.85,9) (0.45,0.65,15) (0.75,1,5))
-- > run_t 1 (ashape2 0.15 (0.5,0.75,9) (0.01,0.05,7) (0.1,0.15,13) (0.65,0.85,9) (0.75,0.95,15) (0.75,1,5))
ashape2 :: UGen -> T3 UGen -> T3 UGen -> T3 UGen -> T3 UGen -> T3 UGen -> T3 UGen -> Treatment
ashape2 t w aT dT sL rT pL =
    let f = rng_osc
    in ashape1 t (f w) (f aT) (f dT) (f sL) (f rT) (f pL)

-- * delays

mdelay0 :: Double -> UGen -> UGen -> Treatment
mdelay0 dt_max fb dt i =
    let l = localIn 1 AR 0
        d = delayC (i + (l * fb)) (constant dt_max) dt
        m = i + d
    in mrg2 m (localOut m)

-- the most changed of the delay times wins
--
-- > add_t (1,0,1) (mdelay1 2 (1,0.65,12.5,50,200))
-- > add_t (1,0,1) (mdelay1 2 (1,rng_osc_kr (0.5,1,12),12.5,rng_osc_kr (50,200,10),200))
mdelay1 :: UGen -> T5 UGen -> Treatment
mdelay1 dt_max (gain,fb,dt1,dt2,dt3) z =
    let l = localIn' 1 AR
        dt = ms_to_sec (mostChange dt1 (mostChange dt2 dt3))
        m = delayC (z + (l * fb)) dt_max dt * gain
    in mrg2 m (localOut m)

mdelay1_meta :: T5 Meta1
mdelay1_meta =
    (("gain",0,4,1,"amp","*")
    ,("fb",0,1,0,"lin","*")
    ,("dtS",12.5,50,12.5,"lin","ms")
    ,("dtM",50,200,50,"lin","ms")
    ,("dtL",200,800,200,"lin","ms"))

-- > add_t (1,0,1) (sdelay0 2 0.65 0.75 0.75 1.25)
-- > add_t (1,0,1) (sdelay0 30 0.65 0.75 17.5 22.5)
--
-- > let dt = 60 / 72 :: Double
-- > let fb = 0.25 :: UGen
-- > add_t (1,0,1) (sdelay0 dt 0.15 0.15 (constant dt) (constant dt))
sdelay0 :: Double -> UGen -> UGen -> UGen -> UGen -> Treatment
sdelay0 dt_max fb0 fb1 d0 d1 i =
    let (l0,l1) = unmce2 (localIn' 2 AR)
        d0' = delayC (i + (l0 * fb0)) (constant dt_max) d0
        d1' = delayC (i + (l1 * fb1)) (constant dt_max) d1
        m0 = i + d0'
        m1 = i + d1'
        m = mce2 m1 m0
    in mrg2 m (localOut m)

-- > add_t (1,0,1) (sdelay1 2 (0.65,0.95,7) (0.75,0.90,11) (0.750,0.751,3) (1.250,1.251,7))
sdelay1 :: Double -> T3 UGen -> T3 UGen -> T3 UGen -> T3 UGen -> Treatment
sdelay1 dt_max fb0 fb1 d0 d1 =
    let f = rng_osc
    in sdelay0 dt_max (f fb0) (f fb1) (f d0) (f d1)

-- > add_t (1,0,0.5) (pingpong1 0.25 0.85)
-- > add_t (1,0,0.5) (pingpong1 (60 / 72) 0.15)
pingpong1 :: UGen -> UGen -> Treatment
pingpong1 dt fb i =
    let a1 = localIn' 2 AR + mce [i,0]
        a2 = delayN a1 dt dt
        a3 = mceEdit reverse a2 * fb
    in mrg [a2,localOut a3]

pingpong1_p :: Treatment
pingpong1_p = pingpong1 (ctl "delay" 0.25) (ctl "feedback" 0.85)

pingpong1_syn :: Synthdef
pingpong1_syn = treatment_syn 1 "pingpong1" pingpong1_p

-- > add_t (1,0,0.5) (pingpong2 2 (0.250,0.251,3) (0.85,0.95,7))
-- > add_t (1,0,0.5) (pingpong2 2 (0.1500,0.1525,7) (0.925,0.975,11))
-- > add_t (1,0,0.5) (pingpong2 2 (0.1475,0.1525,23) (0.935,0.985,7))
-- > add_t (1,0,0.45) (pingpong2 25 (15,15.05,7) (0.15,0.95,9))
pingpong2 :: Double -> T3 UGen -> T3 UGen -> Treatment
pingpong2 dt_max dt fb i =
    let dt' = rng_osc dt
        fb' = rng_osc fb
        a1 = localIn' 2 AR + mce [i,0]
        a2 = delayC a1 (constant dt_max) dt'
        a3 = mceEdit reverse a2 * fb'
    in mrg [a2,localOut a3]

pingpong2' :: Double -> T6 UGen -> Treatment
pingpong2' dt_max (a,b,c,d,e,f) = pingpong2 dt_max (a,b,c) (d,e,f)

pingpong2_meta :: Double -> T6 Meta1
pingpong2_meta dt_max =
    (("delayL",0,dt_max,min dt_max 0.250,"lin","s")
    ,("delayR",0,dt_max,min dt_max 0.251,"lin","s")
    ,("delayT",epsilon,12,3,"lin","hz")
    ,("feedbackL",0,1,0.850,"lin","*")
    ,("feedbackR",0,1,0.950,"lin","*")
    ,("feedbackT",epsilon,12,7,"lin","hz"))

pingpong2_p :: Double -> Treatment
pingpong2_p dt_max = pingpong2' dt_max (t6_map mctl (pingpong2_meta dt_max))

-- > let p = [("delayL",0.1500),("delayR",0.1525),("delayT",7)
-- >         ,("feedbackL",0.925),("feedbackR",0.975),("feedbackT",11)
-- >         ,("mx",0.5)]
-- > in run_t_syn (pingpong2_syn 2) p
--
-- > let p = [("delayL",0.1475),("delayR",0.1525),("delayT",23)
-- >         ,("feedbackL",0.935),("feedbackR",0.985),("feedbackT",7)
-- >         ,("mx",0.5)]
-- > in run_t_syn (pingpong2_syn 2) p
pingpong2_syn :: Double -> Synthdef
pingpong2_syn dt_max = treatment_syn 1 "pingpong2" (pingpong2_p dt_max)

-- > add_t (1,0,1) (pingpong3 2 1.25 0.125 12 (0.250,0.251,3) (0.85,0.95,7))
-- > add_t (1,0,1) (pingpong3 2 1.25 0.125 36 (0.250,0.251,3) (0.85,0.95,7))
pingpong3 :: Double -> UGen -> UGen -> UGen -> T3 UGen -> T3 UGen -> Treatment
pingpong3 dt_max aT rT g dt fb i =
    let i' = i * amplitude AR i aT rT * g
        dt' = rng_osc dt
        fb' = rng_osc fb
        a1 = localIn' 2 AR + mce [i',0]
        a2 = delayC a1 (constant dt_max) dt'
        a3 = mceEdit reverse a2 * fb'
    in mrg [i' + a2,localOut a3]

select2 :: Num a => a -> a -> a -> a
select2 p s1 s2 = (p * s1) + ((1 - p) * s2)

-- > add_t (1,0,1) (gate1 (-45))
gate1 :: UGen -> Treatment
gate1 l i =
    let a = amplitude AR i 0.01 0.01
    in select2 (a >** dbAmp l) i (silent 1)

-- > add_t (1,0,1) (gate2 0.001 0.5 (-45))
gate2 :: UGen -> UGen -> UGen -> Treatment
gate2 aT rT l i =
    let a = amplitude AR i 0.01 0.01
    in lag3UD (a >** dbAmp l) aT rT * i

-- > add_t (1,0,1) (pingpong4' 2 1.25 0.125 (-45) (0.250,0.251,3) (0.85,0.95,7))
-- > add_t (1,0,1) (pingpong4' 2 1.25 0.125 (-45) (0.350,0.355,3) (0.875,0.975,7))
-- > add_t (1,0,1) (pingpong4' 2 1.25 0.250 (-45) (0.150,0.152,3) (0.925,0.975,7))
pingpong4' :: Double -> UGen -> UGen -> UGen -> T3 UGen -> T3 UGen -> Treatment
pingpong4' dt_max aT rT g dt fb i =
    let i' = gate2 aT rT g i
        dt' = rng_osc dt
        fb' = rng_osc fb
        a1 = localIn' 2 AR + mce [i',0]
        a2 = delayC a1 (constant dt_max) dt'
        a3 = mceEdit reverse a2 * fb'
    in mrg [{-to_mono -}(i' + a2),localOut a3]

pingpong4 :: Double -> T9 UGen -> Treatment
pingpong4 dt_max (p,q,r,s,t,u,v,w,x) = pingpong4' dt_max p q r (s,t,u) (v,w,x)

pingpong4_param :: Param9
pingpong4_param =
    (("attack",1.25)
    ,("release",0.125)
    ,("level",(-40))
    ,("delayL",0.250)
    ,("delayR",0.251)
    ,("delayT",3)
    ,("feedbackL",0.850)
    ,("feedbackR",0.950)
    ,("feedbackT",7))

pingpong4_p :: Double -> Treatment
pingpong4_p dt_max = pingpong4 dt_max (t9_map param1_to_ctl pingpong4_param)

pingpong4_syn :: Synthdef
pingpong4_syn = treatment_syn 1 "pingpong4" (pingpong4_p 2)

-- > run_t 1 zappa1
zappa1 :: Treatment
zappa1 z =
    let f = lfNoise0 'α' AR 7 * 500 + 1000
        f' = lag f 0.1
    in rlpf z f' 0.07

-- > add_t (1,0,1) (zappa2 7 0.1 200)
-- > add_t (1,0,1) (zappa2 3 0.3 5)
-- > add_t (1,0,1) (zappa2 (rng_osc (5,9,9)) (rng_osc (0.1,0.2,5)) (rng_osc (150,200,13)))
zappa2 :: UGen -> UGen -> UGen -> Treatment
zappa2 nf lt g z =
    let f = lfNoise0 'α' AR nf * 500 + 1000
        f' = lag f lt
        z' = distort (z * g) * 0.5
    in rlpf z' f' 0.07 * 0.15

-- > run_t 1 (zappa3 1.5 1400 1200 0.1)
-- > run_t 1 (zappa3 1.5 1400 900 0.1)
-- > run_t 1 (zappa3 7 (rng_osc (1100,1700,11)) 1100 0.1)
zappa3 :: UGen -> UGen -> UGen -> UGen -> Treatment
zappa3 rt cf mf rq z =
    let cf' = lag3 cf 0.1
        mf' = lag3 mf 0.1
        rq' = ramp rq 0.1
    in distort (rlpf z (lfNoise1 'α' KR rt * mf' + cf') rq' * 10) * 0.15

-- > run_t 1 (twah1 3 0.1 1400)
-- > run_t 1 (twah1 3 0.1 (rng_osc_kr (700,1400,11)))
-- > run_t 1 (twah1 5 0.1 (rng_osc_kr (500,1900,5)))
-- > run_t 1 (twah1 5 0.1 (rng_osc_kr (1200,1700,3)))
-- > run_t 1 (twah1 3 0.1 (rng_osc_kr (1200,1700,1)))
-- > run_t 1 (twah1 3 0.1 (rng_osc_kr (400,900,7)))
twah1 :: UGen -> UGen -> UGen -> Treatment
twah1 g lt cf z =
    let t = lag3 (amplitude KR z 0.01 0.01 * g) lt
        cf' = cf + linLin t 0 1 (-cf) cf
    in resonz z cf' 1

-- > withSC3 (ws1_mkb [1,0,1,1,0,1])
-- > withSC3 (ws1_mkb [1,0,1,1,0,1,0,0.5,0,0,0.25])
ws1_mkb :: Transport m => [Double] -> m Message
ws1_mkb a = do
  _ <- async (b_alloc 10 512 1)
  let f = [Normalise,Wavetable,Clear]
  async (b_gen_cheby 10 f a)

-- > run_t 1 ws1
ws1 :: Treatment
ws1 z =
    let x = sinOsc KR (1/4) 0
    in xFade2 z (shaper 10 z) x 0.5

-- > run_t 0.5 (eh0 0.01 2 3 2500 1 18)
eh0 :: UGen -> UGen -> UGen -> UGen -> UGen -> UGen -> Treatment
eh0 aT rT g cf rq pk i =
    let a = amplitude AR i aT rT
    in bHiPass i cf rq * a * g * pk

-- > run_t (rng_osc_kr (0,1,3)) (eh1 0.01 2 3 2500 4 18)
eh1 :: UGen -> UGen -> UGen -> UGen -> UGen -> UGen -> Treatment
eh1 aT rT g cf rq pk i =
    let a = amplitude AR i aT rT
    in bPeakEQ i cf rq (a * g * pk)

-- > add_t (1,0,1) (arp1 0.15)
-- > add_t (1,0,1) (arp1 (mce2 0.15 0.6))
-- > add_t (1,0,1) (arp1 (mce2 0.15 0.6 * 0.75))
arp1 :: UGen -> Treatment
arp1 t z =
    let q = midiRatio (mce [0,3,7,10,9,14,15,14])
        p = duty KR t 0 DoNothing (dseq 'α' dinf q)
    in pitchShift z 0.2 p 0.005 0.005

-- > withSC3 (async (b_alloc_setn1 10 0 [0,3,7,10,9,14,15,14]))
-- > withSC3 (async (b_alloc_setn1 11 0 [0,9,14,15,22,19,10,2]))
-- > run_t 1 (arp2 10 0 0.15)
-- > run_t 1 (arp2 11 0 0.15)
-- > run_t 1 (arp2 (mce2 10 11) (mce2 0 0.1) 0.15)
-- > run_t 1 (arp2 (mce2 10 11) (mce2 0 4) 0.15)
-- > run_t 1 (arp2 (mce2 10 11) (mce2 0 4) (mce2 0.15 0.3))
-- > run_t 1 (arp2 (mce2 10 11) 0 (mce2 0.15 0.6))
-- > withSC3 (sendMessage (b_setn1 10 0 [0,3,2,7,14,15,10,9]))
-- > withSC3 (sendMessage (b_setn1 10 0 [0,3,7,10,9,14,15,14]))
-- > withSC3 (sendMessage (b_setn1 10 0 [0,9,14,15,22,19,10,2]))
arp2 :: UGen -> UGen -> UGen -> Treatment
arp2 b o t z =
    let ph = dseries 'α' dinf o 1
        p = duty KR t 0 DoNothing (dbufrd 'a' b (floorE ph) Loop)
    in pitchShift z 0.2 (midiRatio p) 0.001 0.001

-- > run_t 1 (arp3 (rng_osc_kr (0,0.05,0.2)) (mce2 0.15 0.6 * 0.75))
arp3 :: UGen -> UGen -> Treatment
arp3 l t z =
    let q = midiRatio (mce [0,3,7,10,9,14,15,14])
        p = duty KR t 0 DoNothing (dseq 'α' dinf q)
    in pitchShift z 0.2 (lag p l) 0.005 0.005

-- > run_t 1 (arp_dr 0.15)
-- > run_t 1 (arp_dr (mce2 0.15 0.6))
arp_dr :: UGen -> Treatment
arp_dr t z =
    let d = [50,53,57,60,64,65,62,60,57,55,57,53,50,53,58,60,62,60]
        q = midiRatio (mce (map (subtract 50) d))
        p = duty KR t 0 DoNothing (dseq 'α' dinf q)
    in pitchShift z 0.2 p 0.005 0.005

-- > withSC3 (sendMessage (b_alloc 10 8192 1))
-- > run_t 1 (wps0 10 8192)
wps0 :: UGen -> UGen -> Treatment
wps0 b n z =
    let r = recordBuf AR b 0 1 0 1 Loop 1 DoNothing z
        ph = (n / sampleRate) * 2 * pi
        p = lfSaw KR (1 / bufDur KR 10) ph * 0.5 + 0.5
        x = mouseX KR 0.5 2 Linear 0.2
        y = mouseY KR 0.01 0.2 Linear 0.2
    in mrg2 (warp1 1 10 p x 0.1 (-1) 8 y 4) r

-- > run_t_nc 2 0.75 (s_ping_pong1 0.25 0.85)
s_ping_pong1 :: UGen -> UGen -> Treatment
s_ping_pong1 dt fb z =
    let a = localIn' 2 AR + z
        (b1,b2) = unmce2 (delayC a dt dt)
        c = mce2 b2 b1 * fb
    in mrg [mce2 b1 b2,localOut c]

-- > run_t_nc 2 0.75 (s_ping_left1 0.25 0.85)
s_ping_left1 :: UGen -> UGen -> Treatment
s_ping_left1 dt fb z =
    let a = localIn' 2 AR + z
        (b1,b2) = unmce2 (delayC a dt dt)
        c = mce2 b1 b1 * fb
    in mrg [mce2 b1 b2,localOut c]

-- > run_t_nc 2 0.75 (s_ping_right1 0.25 0.85)
s_ping_right1 :: UGen -> UGen -> Treatment
s_ping_right1 dt fb z =
    let a = localIn' 2 AR + z
        (b1,b2) = unmce2 (delayC a dt dt)
        c = mce2 b2 b2 * fb
    in mrg [mce2 b1 b2,localOut c]

-- > add_t (1,0,0.75) (fshift1 2)
-- > add_t (1,0,5/6) (fshift1 (rsinosc KR (2,5,1/7)))
fshift1 :: UGen -> Treatment
fshift1 env_dur z =
    let e = lfGauss AR env_dur (1/8) 0 Loop DoNothing
        o = z * e
        a = o / 4 + localIn' 2 AR
        s = freqShift a (lfNoise0 'α' KR (1/4) * 90) 0
        d = delayC s 1 0.1 * 0.9
    in mrg2 s (localOut d)

-- > add_t (1,0,3/7) (ph_shift1 (1/2))
ph_shift1 :: UGen -> Treatment
ph_shift1 rt z = freqShift z 0 (rsinosc KR(0,pi,rt))

-- > add_t (1,0,2/3) (fshift2 1 (1/2))
fshift2 :: UGen -> UGen -> Treatment
fshift2 depth rate z = freqShift z (rsinosc KR (-depth,depth,rate)) 0

-- * pv (phase vocoder)

ffta3 :: ID i => (i,i,i) -> UGen -> UGen -> UGen -> UGen -> UGen -> UGen -> T3 UGen
ffta3 (z1,z2,z3) nf i h wt a ws =
    let c1 = ffta z1 nf i h wt a ws
        (c2,c3) = RDU.pv_splita z2 c1
        (c4,c5) = RDU.pv_splita z3 c2
    in (c3,c4,c5)

-- > run_t 0.5 (pvstretch1 8192 0.25)
pvstretch1 :: UGen -> UGen -> Treatment
pvstretch1 fft_sz hop_sz z =
    let (c1,c2,c3) = ffta3 ('α','β','γ') fft_sz z hop_sz 0 1 0
        c1' = pv_BinShift c1 0.5 0 1
        c2' = pv_BinShift c2 1 0 1
        c3' = pv_BinShift c3 2 0 1
        r = pv_Add c3' (pv_Add c2' c1')
    in ifft r 0 0

-- | allocate buffers (fft,delay,feedback)
pvdelay1_mkb :: Transport m => Int -> Int -> m Message
pvdelay1_mkb b sz = do
  _ <- async (b_alloc b (sz * 2) 1)
  _ <- async (b_alloc (b + 1) sz 1)
  async (b_alloc (b + 2) sz 1)

-- > withSC3 (pvdelay1_mkb 10 128)
-- > withSC3 (sendMessage (b_fill 11 [(0,128,0.25)]))
-- > withSC3 (sendMessage (b_fill 12 [(0,128,0.75)]))
-- > run_t 0.5 pvdelay1
pvdelay1 :: Treatment
pvdelay1 z =
    let maxdel = 0.5
        c1 = fft 10 z 0.25 0 1 0
        c2 = E.pv_BinDelay c1 maxdel 11 12 0.25
    in ifft c2 0 0

-- | generate sin table of n places in range (l,r)
--
-- > withSC3 (sendMessage (b_setn1 11 0 (pvdelay1_gensin 0 0.35 128 0)))
-- > withSC3 (sendMessage (b_setn1 12 0 (pvdelay1_gensin 0.75 0.95 128 pi)))
pvdelay1_gensin :: (Enum t, Floating t) => t -> t -> t -> t -> [t]
pvdelay1_gensin l r n ph =
    let f x = range l r (sin ((x / n) * 2 * pi + ph))
    in map f [0..n]

-- | write modulation signal (blip) to buffer
--
-- > audition (pvdelay1_modbuf 11 (1/27) 3 0.15 0.35)
-- > audition (pvdelay1_modbuf 12 (1/25) 5 0.75 0.95)
pvdelay1_modbuf :: UGen -> UGen -> UGen -> UGen -> UGen -> UGen
pvdelay1_modbuf b f nh l r =
    let o = range l r (blip KR f nh)
    in recordBuf KR b 0 1 0 1 Loop 1 DoNothing o

-- > withSC3 (async (b_alloc 10 2048 1))
-- > run_t 1 (pv_scr1 10)
pv_scr1 :: UGen -> Treatment
pv_scr1 b z =
    let f = fft' b z
        x = mouseX' KR 0 0.5 Linear 0.1
        y = mouseY' KR 0 0.5 Linear 0.1
        i = impulse KR (lfNoise0 'α' KR 2 * 8 + 10) 0
        g = pv_BinScramble 'β' f x y i
    in ifft' g

-- > withSC3 (async (b_alloc 10 2048 1))
-- > run_t 0.5 (pv_shft1 10 1.01 0.1 1)
pv_shft1 :: UGen -> UGen -> UGen -> UGen -> Treatment
pv_shft1 b str shft itp z =
    let f = fft' b z
        g = pv_BinShift f str shft itp
    in ifft' g

-- > run_t 1 (pv1 1024 (k_rng_osc 0 16 0.25 0) (k_rng_osc 1 5 0.15 0))
pv1 :: UGen -> UGen -> UGen -> Treatment
pv1 sz m k z =
    let c0 = ffta 'α' sz z 0.5 0 1 0
        (c1,c2) = RDU.pv_splita 'β' c0
        c3 = pv_LocalMax c1 m
        c4 = pv_MagSmear c2 k
    in mce2 (ifft' c3) (ifft' c4)

-- > run_t 0.15 (pv2 (1024 * 8) (k_rng_osc 0 16 0.15 0) (k_rng_osc 0 16 0.15 pi))
pv2 :: UGen -> UGen -> UGen -> Treatment
pv2 sz m k z =
    let c0 = ffta 'α' sz z 0.5 0 1 0
        (c1,c2) = RDU.pv_splita 'β' c0
        c3 = pv_LocalMax c1 m
        c4 = pv_MagAbove c2 k
    in mce2 (ifft' c3) (ifft' c4)

-- * dict

-- > withSC3 (mapM_ (async . d_recv) syn_dict)
-- > withSC3 (sendBundle (bundle immediately (map d_recv syn_dict)))
syn_dict :: [Synthdef]
syn_dict =
    [{-adc1_syn,cpy2_syn
    ,-}octave1_syn,octave2_syn,octave3_syn
    ,distort1_syn,distort2_syn,distort3_syn,distort4_syn,distort5_syn
    ,ringmod1_syn,ringmod2_syn,ringmod3_syn,ringmod4_syn,ringmod5_syn
    ,chorus0_syn 2,chorus1_syn 12 1
    ,tremolo1_syn
    ,stereo_tremolo3_syn
    ,flanger1_syn
    ,pps2_syn,pps3_syn
    ,pingpong1_syn,pingpong2_syn 2,pingpong4_syn]

{-
-}
