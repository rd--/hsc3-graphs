{- Bit-reduction ; adc -}
let f = LfNoise2(8) * 200 + 300;
let nh = LfNoise2(3) * 10 + 20;
let src = Blip(f, nh);
let sr = MouseX(1000, SampleRate() * 0.1, 1, 0.2);
let bitSize = MouseY(1, 24, 1, 0.2);
let downSample = Latch(src, Impulse(sr, 0));
let bitRedux = downSample.RoundTo(0.5 ^ bitSize);
[downSample, bitRedux]
