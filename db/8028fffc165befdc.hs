-- fbSineC ; increase feedback
let fb = line KR 0.01 4 10 DoNothing
in fbSineC AR sampleRate 1 fb 1.1 0.5 0.1 0.1 * 0.1
