-- bit reduction (adc)

import Sound.SC3.ID

sample_rate_decrease :: UGen
sample_rate_decrease =
  let f = lfNoise2 'a' KR 8
      nh = lfNoise2 'a' KR 3
      src = blip AR (f * 200 + 300) (nh * 10 + 20)
      sr = mouseX' KR 1000 (sampleRate * 0.1) Exponential 0.2
  in latch src (impulse AR sr 0)

bit_rate_decrease :: UGen
bit_rate_decrease =
  let f = lfNoise2 'a' KR 8
      nh = lfNoise2 'a' KR 3
      src = blip AR (f * 200 + 300) (nh * 10 + 20)
      sr = mouseX' KR 1000 (sampleRate * 0.1) Exponential 0.2
      bit_sz = mouseY' KR 1 24 Exponential 0.2
      down_sample = latch src (impulse AR sr 0)
      bit_redux = roundTo down_sample (0.5 ** bit_sz)
  in mce2 down_sample bit_redux

main :: IO ()
main = audition (out 0 (sample_rate_decrease + bit_rate_decrease))
