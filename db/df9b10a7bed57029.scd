// RShufflerL - unary node
{var o = ar(SinOsc,[440,441],0) * 0.2
;var x = kr(MouseX,0.0001,0.2)
;var y = kr(MouseY,0.001,0.2,\exponential)
;ar(RShufflerL,o,x,y)}
