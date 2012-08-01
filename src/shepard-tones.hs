-- shepard tones (alberto de campo)

import Sound.OSC
import Sound.SC3

interp :: (Fractional t,Enum t) => t -> t -> t -> [t]
interp n l r =
    let i = (r - l) / n
    in [l,l + i .. r - i]

hanningWindow :: (Floating b,Enum b) => b -> [b]
hanningWindow n =
    let lp = pi * (-0.5)
        rp = lp + 2 * pi
        hf i = sin i * 0.5 + 0.5
    in map hf (interp n lp rp)

shepard_tones :: UGen
shepard_tones =
    let ratescale = 1024 / 44100 / 10
        rate = 0.1
        ph = phasor AR 0 (rate * ratescale) 0 1024 0
        phases = mce (map (\n -> n * 0.1 * 1024 + ph) [0..9])
        freqs = bufRdC 1 AR 1 phases Loop
        amps = bufRdC 1 AR 2 phases Loop
    in mix (sinOsc AR freqs 0 * amps) * 0.1

run :: Transport m => m ()
run = do
  let square x = x * x
      ampTable = map square (hanningWindow 1024)
      amp_f i = (0.5 ** i) * 20000
      freqTable = map amp_f (interp 1024 0 10)
  _ <- async (b_alloc_setn1 1 0 freqTable)
  _ <- async (b_alloc_setn1 2 0 ampTable)
  play (out 0 shepard_tones)

main :: IO ()
main = withSC3 run
