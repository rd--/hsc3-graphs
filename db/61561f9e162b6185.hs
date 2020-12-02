-- controlDur
sinOsc AR (mce2 (recip controlDur) (recip (blockSize / sampleRate) + 1)) 0 * 0.1
