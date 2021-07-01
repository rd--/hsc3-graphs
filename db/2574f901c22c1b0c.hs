-- controlDur
sinOsc ar (mce2 (recip controlDur) (recip (blockSize / sampleRate) + 1)) 0 * 0.1
