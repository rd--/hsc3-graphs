; modal space (jmcc) #8
(let* ((b (asLocalBuf (list 0 2 3.2 5 7 9 10)))
       (x (MouseX 0 15 0 0.1))
       (k (DegreeToKey b x 12))
       (c (lambda (n r)
            (let* ((o (Mul (SinOsc (MidiCps (Add3 r k n)) 0) 0.1))
                   (t (LfPulse (MidiCps (Mce2 48 55)) 0.15 0.5))
                   (f (MidiCps (MulAdd (SinOsc 0.1 0) 10 r)))
                   (d (Mul (Rlpf t f 0.1) 0.1))
                   (m (Add o d)))
              (Add (CombN m 0.31 0.31 2) m))))
       (n (Mul (LfNoise1 (Mce2 3 3.05)) 0.04)))
  (Mul (Add (c n 48) (c n 72)) 0.1))
