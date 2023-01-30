;; MiBraids ; fluted
var pitch = 38;
var timbre = MouseX(0.7, 1, 0, 0.2);
var color = MouseY(0, 1, 0, 0.2);
MiBraids(pitch: pitch, timbre: timbre, color: color, model: 31, trig: 0, resamp: 1, decim: 0, bits: 0, ws: 0) ! 2 * 0.1
