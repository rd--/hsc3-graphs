//--tweet0333
a=SinOscFB;Splay.ar({|i|Formant.ar(a.ar(i+1/150).round+1+i*99+a.ar([3,2]),b=i+2*99,b,a.ar(i+1/130).max(0)).tanh}!8)/3
