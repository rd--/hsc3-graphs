{- LocalIn ; stereo cross channel feedback modulation ; mouse control -}
let index = 5;
let fb = [10, 5];
let pan = 0;
let amp = 0.1;
let freq = MouseY(20, 4000, 1, 0.2);
let mratio = MouseX(1 / 8, 8, 1, 0.2);
let in = LocalIn(2, [0 0]);
let mod = SinOsc(freq * mratio, 0) * freq * mratio * index;
let car = SinOsc([freq * mod * in.second, freq + mod + in.first], 0);
Pan2(LeakDc(car.Sum, 0.995), pan, amp) <! LocalOut(car * fb)
