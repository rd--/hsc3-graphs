-- stkPluck ; default param
let delete_when_silent s a t= mrg2 s (detectSilence s a t RemoveSynth)
in delete_when_silent (X.stkPluck AR 440 0.99) 0.001 0.5
