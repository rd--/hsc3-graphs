;; MiBraids ; scanning
var pitch = MouseY(33, 72, 0, 0.2);
var timbre = LfNoise1(0.3) * 0.5 + 0.5;
var color = LfNoise1(0.3) * 0.5 + 0.5;
var model = MouseX(0, 47, 0, 0.2);
MiBraids(pitch: pitch, timbre: timbre, color: color, model: model, trig: 0, resamp: 1, decim: 0, bits: 0, ws: 0) ! 2 * 0.1