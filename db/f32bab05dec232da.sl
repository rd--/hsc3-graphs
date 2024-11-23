/* Ring modulate input (Jmcc) #5 ; requires=AudioIn */
let input = AudioIn([1, 2]);
let modulatorFrequency = MouseX(10, 4000, 1, 0.2);
let modulator = SinOsc(modulatorFrequency, [0, 0.5 * pi]); /* offset phase of one oscillator by ninety degrees */
input * modulator
