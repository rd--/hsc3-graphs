-- doppler (jmcc,rd)

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}

-- observer at origin, signal 's' at coordinates ('x','y')
doppler :: (UGen,UGen) -> UGen -> UGen
doppler (x,y) s =
    let d = hypot x y
        a = 40 / squared d
        maxd = 110
    in delayL s (maxd / 344) (d / 344) * a

-- straight line at x axis from (-y,y) over dt seconds
line_x :: UGen -> UGen -> UGen -> (UGen,UGen)
line_x x y dt = (x,line KR (-y) y dt RemoveSynth)

-- ellipse centered at origin and interecting x at +-a and y at +-b.
-- traversal is over dt seconds
ellipse :: UGen -> UGen -> UGen -> (UGen,UGen)
ellipse a b dt =
    let t = line KR (-pi/2) (pi * 3/2) dt RemoveSynth
    in (a * cos t,b * sin t)

main :: IO ()
main = do
  let s = rlpf (fSinOsc AR 200 0 * lfPulse AR 31.3 0 0.4) 400 0.3
  withSC3 (do play (out 0 (doppler (line_x 10 100 6) s))
              pauseThread 8
              play (out 0 (doppler (ellipse 10 75 12) s)))
