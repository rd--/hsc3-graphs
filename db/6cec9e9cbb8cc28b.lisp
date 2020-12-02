; hypot ; object travels 200 meters in 6 secs (=120kph) passing 10 meters from the listener
(let* ((x 10)
       (y (mul (lf-saw kr 1/6 0) 100))
       (distance (hypot x y))
       (velocity (slope distance))
       (pitch-ratio (f-div (sub 344 velocity) 344)) ; the speed of sound is 344 meters/sec
       (amplitude (f-div 10 (squared distance))))
  (mul (f-sin-osc ar (mul 1000 pitch-ratio) 0) amplitude))
