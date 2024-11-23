/* Pulse ; envelope */
SinOsc(234, 0) * Lag((Pulse(MouseX(3.14, 23, 1, 0.2), MouseY(0.23, 0.78, 1, 0.2)) > 0), 0.01) * 0.1
