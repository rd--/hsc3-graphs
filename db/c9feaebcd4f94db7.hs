-- sms ; sine reconstruction left channel, noises on right (sample rate must be 44100)
let z = soundIn 0
    y = mouseY kr 1 50 Linear 0.2
    x = mouseX kr 0.5 4 Linear 0.2
in X.sms {- ar -} z 50 y 8 0.3 x 0 0 0 1 (-1)
