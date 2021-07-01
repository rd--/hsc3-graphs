-- fos ;same as OneZero
let x = lfTri ar 0.4 0 * 0.99
in fos (lfSaw ar 200 0 * 0.1) (1 - (abs x)) x 0
