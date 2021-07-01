-- fbSineC ; increase phase multiplier
let a = line kr 1 2 10 DoNothing
in fbSineC ar sampleRate 1 0 a 0.5 0.1 0.1 * 0.1
