{- Chaos engine hum ; http://sccode.org/1-5aJ ; requires=kr -}
let o1 = SinOsc(101, Saw(0.12345) * 678 + 9) * 0.2 + 0.8;
let o2 = Pulse([25, 25.5], 0.25) * 0.125 - 0.25;
let o3 = SinOsc([50, 51], 0) * o1 + o2;
SinOsc(10 + (50 * o3.kr), 0) * 0.5
