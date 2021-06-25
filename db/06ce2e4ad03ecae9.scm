; Formant ; event control
(let ((f (lambda (g x y z _o _rx _ry _p _px _py)
           (let ((f0 (Mul (asMce (list 200 300)) x))
                 (ff (LinExp y 0 1 400 1200)))
             (Mul3 (Formant ar f0 ff 200) g z)))))
  (Mul (Mix (EventVoicer 16 f)) (ctl kr "gain" 0.5)))
