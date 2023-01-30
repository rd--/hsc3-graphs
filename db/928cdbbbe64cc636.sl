;; PmOsc ; modulator expressed as ratio
var carrier = LfNoise0(MouseY(3, 11, 0, 0.2)) * 500 + 700;
var modRatio = MouseX(1, 2, 0, 0.2);
PmOsc(carrier, carrier * modRatio, 12, 0) * 0.1
