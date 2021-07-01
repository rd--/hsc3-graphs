-- allpassN ; phasing ; warning=feedback
let i = soundIn (mce2 0 1) -- two channels of input signal
    f = mouseX kr 0.1 1.0 Linear 0.2 -- phaser freq
    e = allpassN i 0.02 (sinOsc kr f 0 * 0.01 + 0.01) 1 -- max delay of 20msec
in i + e -- sum phase-shifted signal to original signal
