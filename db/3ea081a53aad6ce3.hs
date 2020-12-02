-- saw ; two band limited sawtooth waves thru a resonant low pass filter
let f = xLine KR 8000 400 5 DoNothing
in rlpf (saw AR (mce2 100 250) * 0.1) f 0.05
