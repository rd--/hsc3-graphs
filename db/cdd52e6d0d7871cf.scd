// analog bubbles with mouse control (jmcc) #3
{var y = MouseY.kr(0.1,10,'exponential') /* lfo 1 rate */
;var x = MouseX.kr(2,40,'exponential')  /* lfo 2 rate */
;var lfo_2 = LFSaw.kr(x,0,-3,80) /* depth & offset in semitones */
;var lfo_1 = LFSaw.kr(y,0,24,lfo_2) /* depth in semitones, offset is lfo_2 */
;var freq = lfo_1.midicps /* convert to frequency */
;CombN.ar(SinOsc.ar(freq, 0, 0.04), 0.2, 0.2, 2) /* echoing sine wave */
}
