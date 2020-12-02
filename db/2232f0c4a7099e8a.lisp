; resonz ; random resonator at a random location
(let ((freq (mul 120 (i-rand 1 16)))
      (bw 1/4)
      (gain 8))
  (pan2 (resonz (white-noise ar) freq (f-div bw freq))
        (rand -1 1)
        gain))
