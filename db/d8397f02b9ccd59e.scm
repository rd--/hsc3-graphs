; Formant ; event control
(let ((f (lambda (g x y z _o _rx _ry _p _px _py)
           (let ((f0 (Mul (list 200 300) x))
                 (ff (LinExp y 0 1 400 1200)))
             (Mul3 (Formant f0 ff 200) g z)))))
  (Mul (Mix (Voicer 16 f)) (ctl "gain" 0.5)))
