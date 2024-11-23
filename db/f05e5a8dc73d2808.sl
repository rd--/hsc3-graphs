/* Bit-reduction ; adc */
let f = LfNoise2(8) * 200 + 300;
let nh = LfNoise2(3) * 10 + 20;
let src = Blip(f, nh);
let sr = MouseX(1000, SampleRate() * 0.1, 1, 0.2);
Latch(src, Impulse(sr, 0))
