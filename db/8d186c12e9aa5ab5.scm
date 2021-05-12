; Hypot ; object travels 200 meters In 6 secs (=120kph) passing 10 meters from the listener
(let* ((x 10)
       (y (Mul (LFSaw kr 1/6 0) 100))
       (distance (Hypot x y))
       (velocity (Slope distance))
       (pitch-ratio (FDiv (Sub 344 velocity) 344)) ; the speed of sound is 344 meters/sec
       (amplitude (FDiv 10 (Squared distance))))
  (Mul (FSinOsc ar (Mul 1000 pitch-ratio) 0) amplitude))
