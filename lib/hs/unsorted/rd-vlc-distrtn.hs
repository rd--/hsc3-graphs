-- vlc-distrtn (rd)
{-# OPTIONS_GHC -F -pgmF hsc3-uparam #-}
-- caution - audio feedback graph

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Lang.Random.IO as L {- hsc3-lang -}

prep :: (Double,Double) -> [Double]
prep (ampl,phase) = [dbAmp ampl,phase]

partial :: UId m => UGen -> UGen -> UGen -> UGen -> UGen -> UGen -> m UGen
partial b i freq detune fall n = do
  n0 <- lfNoise1M KR 1
  n1 <- randM 0.75 1.25
  let m = n * 2
      ampl = bufRdN 1 KR b m NoLoop
      f = freq * (n + 1) * (n0 * detune + 1)
  return (ringz i f (fall * n1) * ampl)

plyr :: UId m => UGen -> UGen -> m UGen
plyr i n = do
  let uparam = {buf=0,iamp=0.1,ampl=0.1,freq=129.897,fall=0.5,loc=0.0,detune=0.001}
  s <- mapM (partial buf (i * iamp) freq detune fall) [0 .. n-1]
  return (out 0 (clip2 (pan2 (sum s) loc ampl) 0.1))

degree_to_key :: Int -> [Int] -> Int -> Int
degree_to_key degree scale steps =
    let scale_n = length scale
    in (steps * (degree `div` scale_n)) + (scale !! (degree `mod` scale_n))

getCps :: (Transport m,UnaryOp b) => [b] -> m b
getCps b = do
  b_ <- L.choose b
  d <- L.choose [0 .. 8]
  let k = degree_to_key d [0,2,3,5,7,8,10] 12
  return (midiCPS (b_ + realToFrac k))

pattern :: Transport m => m ()
pattern = do
  f <- getCps [24,36,48,55,60]
  ia <- L.rrand 0.05 0.75
  l <- L.rrand (-1) 1
  a <- L.rrand 0.05 0.1
  d <- L.rrand 0.001 0.005
  fl <- L.rrand 1 7
  sendMessage (n_set 1002 [("freq",f)
                          ,("iamp",ia)
                          ,("buf",0)
                          ,("loc",l)
                          ,("ampl",a)
                          ,("detune",d)
                          ,("fall",fl)])
  wait =<< L.choose [0.25,0.5,0.75,1.5]

run :: (Transport m,UId m) => m ()
run = do
  _ <- async (b_alloc 0 (length vlc * 2) 1)
  sendMessage (b_setn1 0 0 (concatMap prep vlc))
  let i = soundIn 0
  _ <- async . d_recv . synthdef "plyr48" =<< plyr i 48
  sendMessage (s_new "plyr48" 1002 AddToTail 1 [])
  sequence_ (replicate 32 pattern)

main :: IO ()
main = withSC3 run

vlc :: [(Double,Double)]
vlc = [(0.00000,1.85550)
      ,(-9.92383,-0.65147)
      ,(-8.74205,-0.74728)
      ,(-3.70464,-1.39796)
      ,(-9.43435,-1.14812)
      ,(-25.84790,-1.03375)
      ,(-16.99500,-2.41724)
      ,(-29.17040,2.67419)
      ,(-26.82750,-1.61810)
      ,(-18.59870,1.34568)
      ,(-19.72160,-2.85972)
      ,(-29.43650,0.54603)
      ,(-23.63120,-1.47813)
      ,(-28.20100,-1.98501)
      ,(-41.20700,-1.11808)
      ,(-33.14310,-2.19369)
      ,(-31.54010,1.43134)
      ,(-47.62740,1.28571)
      ,(-28.79740,-1.03754)
      ,(-34.97950,0.37740)
      ,(-39.05770,-0.57557)
      ,(-38.84060,2.34836)
      ,(-40.18090,-0.96978)
      ,(-47.32150,2.14768)
      ,(-45.49290,2.52100)
      ,(-40.57100,-1.39905)
      ,(-47.19530,-2.23994)
      ,(-50.80920,2.97853)
      ,(-48.13640,0.46815)
      ,(-58.56890,-1.01821)
      ,(-57.81200,-3.08971)
      ,(-47.96870,-0.48657)
      ,(-43.96100,-0.10311)
      ,(-50.49810,-2.80977)
      ,(-50.61640,-0.17212)
      ,(-60.64640,-1.02433)
      ,(-58.03410,1.06921)
      ,(-55.46390,-2.04501)
      ,(-54.31000,-1.53512)
      ,(-52.78670,-1.49875)
      ,(-57.99380,0.17697)
      ,(-56.76990,2.28241)
      ,(-54.17450,-1.85553)
      ,(-62.58220,-2.40971)
      ,(-59.86460,1.04782)
      ,(-61.58570,1.56183)
      ,(-52.62080,1.68360)
      ,(-49.82940,-1.11019)
      ,(-56.18160,-0.78538)
      ,(-57.73320,-2.23918)
      ,(-49.87560,3.09604)
      ,(-51.00100,-0.53762)
      ,(-59.71530,0.99017)
      ,(-65.73280,2.43855)
      ,(-73.01270,-0.90664)
      ,(-61.81450,-0.53346)
      ,(-65.58980,1.51174)
      ,(-75.94320,-3.06072)
      ,(-65.22210,-1.49937)
      ,(-70.79970,-2.96199)
      ,(-64.72450,1.78172)
      ,(-73.24130,0.26939)
      ,(-66.17110,-0.23305)
      ,(-61.32910,-3.12592)
      ,(-66.98180,0.64700)
      ,(-65.23060,-2.94395)
      ,(-70.13430,1.29805)
      ,(-68.43470,-1.35906)
      ,(-71.33000,-2.71582)
      ,(-86.90080,2.11646)
      ,(-74.97450,2.76118)
      ,(-68.02520,0.94979)
      ,(-67.32960,3.05994)
      ,(-67.32140,-2.79905)
      ,(-68.22010,-2.33831)]
