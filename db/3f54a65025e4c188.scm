; Hypot ; object travels 200 meters In 6 secs (=120kph) passing 10 meters from the listener
(let* ((x 10)
       (y (Mul (LFSaw 1/6 0) 100))
       (distance (Hypot x y))
       (velocity (Slope distance))
       (pitchRatio (Fdiv (Sub 344 velocity) 344)) ; the speed of sound is 344 meters/sec
       (amplitude (Fdiv 10 (Squared distance))))
  (Mul (FSinOsc (Mul 1000 pitchRatio) 0) amplitude))
