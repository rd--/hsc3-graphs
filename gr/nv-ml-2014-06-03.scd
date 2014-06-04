{var y = MouseY.kr(1,100)
;var x = MouseX.kr(50,400,\exponential)
;var i = Decay.ar(Impulse.ar(0.5),0.1)
;var i_ = BPF.ar(i * y, 50).sin
;Pluck.ar(i_,LFSaw.ar(10000),0.1,1 / x,4) ! 2}.play
