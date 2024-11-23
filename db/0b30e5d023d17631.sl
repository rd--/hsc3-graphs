/* Select ; list expansion at first input */
let m = [0 2 3 5 7 9] + 48;
let k = m.size + 1;
let x = MouseX(0, k, 0, 0.2);
let y = MouseY(0, k, 0, 0.2);
SinOsc(Select([x, y], m).MidiCps, 0) * 0.1
