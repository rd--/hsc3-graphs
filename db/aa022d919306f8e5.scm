; f0 <https://twitter.com/redFrik/status/1343283697840226307>
(let ((b 'undefined) (f 'undefined) (z 'undefined) (t 'undefined) (d 'undefined) (c 'undefined) (p 'undefined))
  (set! b (fdiv (to 2 12) 12))
  (set! f '(136.1 163.3 181.4 204.1 244.9 272.1 326.5 362.8 408.2 489.8 544.2))
  (set! z (add (mul (mcefill 11 (lambda (_) (let () (whitenoise)))) (fdiv (add (lftri b 0) 1) 2)) (brownnoise)))
  (set! t (lftri (pow 121 (lftri (mul (fdiv 2 121) b) 0)) 0))
  (set! d (fdiv (add (mul (fdiv (lag2 (le (lftri (fdiv 1 212.1) 0) (fdiv 1 212)) (fdiv 2 b)) 12) 1.2) 1.2) f))
  (set! c (fdiv (add (lftri (fdiv b 12) 0) 1) 2))
  (set! p (pluck z t (fdiv 2 121) d (fdiv (mul (fdiv 1 2) 12) 1.2) c))
  (fdiv (fdiv (splay2 (hpf p 12)) 2.1) 2))
