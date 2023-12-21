; rukano; Apr 22, 2012; Re: Epic Pads (jar)
(let* ((freqFunc
        (lambda ()
          (Mul
           (MidiCps (choose (list 60 64 65 67)))
           (MulAdd (LfNoise2 1) 0.011 1))))
       (freq (! freqFunc 24))
       (gen (Mul (LfSaw freq 0) 0.1))
       (fmod (LinRange (LfCub 1/12 0) 1 (MouseX 2 16 0 0.2)))
       (rqmod (LinRange (LfNoise2 1/8) 0.1 1.0))
       (sig (Rlpf gen (Mul freq fmod) rqmod))
       (amp (MouseY 0.1 0.25 0 0.2)))
  (Mul (Splay2 sig) amp))
