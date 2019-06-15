-- e-lamell (rd)

import Control.Monad
import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Lang.Random.IO as R {- hsc3-lang -}

e_lamell :: UGen
e_lamell =
    let ctl = control KR
        f = ctl "f" 440
        n = ctl "n" 12
        d = ctl "d" 0.1
        l = ctl "l" 0
        a = ctl "a" 1
        t = lchoose 'α' [1,32]
        h = line AR n t d DoNothing
        s = blip AR f h
        e_d = envPerc 0.005 d
        e = envGen AR 1 a 0 1 RemoveSynth e_d
    in pan2 s l e

sendSynth :: Transport m => String -> UGen -> m Message
sendSynth n u = async (d_recv (synthdef n u))

mk_s_new :: Double -> Double -> Double -> Double -> Double -> Message
mk_s_new f n d a l =
    let p = [("f",f)
            ,("n",n)
            ,("d",d)
            ,("a",a)
            ,("l",l)]
    in s_new "blip" (-1) AddToTail 1 p

pattern :: Transport m => m ()
pattern = do
  let r_note o p = do oe <- R.choose o
                      pe <- R.choose p
                      return (oe * 12 + pe)
      l_sel = r_note [2,3] [0]
      h_sel = r_note [2,3,4,5] [0,2,5,7]
  p <- do f <- liftM midiCPS l_sel
          n <- R.rrand 2 36
          d <- R.exprand 0.01 0.8
          a <- R.rrand 0 0.75
          l <- R.rrand (-1) 1
          return (mk_s_new f n d a l)
  q <- do f <- liftM midiCPS h_sel
          n <- R.rrand 2 36
          d <- R.exprand 0.01 1.2
          a <- R.choose [0,0.25,0.5,1]
          l <- R.rrand (-1) 1
          return (mk_s_new f n d a l)
  sendBundle (bundle immediately [p,q])
  wait 0.1

run :: Transport m => m ()
run = do
  _ <- sendSynth "blip" (out 0 e_lamell)
  replicateM_ 64 pattern

main :: IO ()
main = withSC3 run
