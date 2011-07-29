module Mice where

import Sound.SC3.ID

mouseR :: ID a => a -> Rate -> UGen -> UGen -> Warp -> UGen -> UGen
mouseR z rt l r ty tm =
  let f = case ty of
            Linear -> linLin
            Exponential -> linExp
            _ -> undefined
  in lag (f (lfNoise1 z rt 1) (-1) 1 l r) tm

mouseX' :: Rate -> UGen -> UGen -> Warp -> UGen -> UGen
mouseX' = mouseR 'x'

mouseY' :: Rate -> UGen -> UGen -> Warp -> UGen -> UGen
mouseY' = mouseR 'y'
