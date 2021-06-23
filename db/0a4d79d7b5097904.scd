// RBezier - mouse control of frequency & one control point
{var x = MouseX.kr(40,4000,'exponential',0.2)
;var y = MouseY.kr(0.1,0.2,'linear',0.2)
;RBezier.ar(freq: x, phase: 0, param: [0,0,y,-1.3,0.3,-1.3,0.5,0,0.7,1.3,0.8,1.3,1,0]) * 0.1}
