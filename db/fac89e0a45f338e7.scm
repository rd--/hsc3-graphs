; MulAdd ; written out
(let ((f (Add (Mul (LFSaw kr (mce2 10 9) 0) 200) 400)))
  (Mul (SinOsc ar f 0) 0.1))