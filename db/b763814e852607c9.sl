{-********* Distort input ; Jmcc *********-}
let gain = MouseX(1, 100, 1, 0.2); {- mouse x controls gain into distortion -}
AudioIn([1, 2]).Mul(gain).Distort * 0.4
