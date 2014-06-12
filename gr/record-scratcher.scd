{ var fn = "/home/rohan/data/audio/pf-c5.snd"
; var b = 0
; var gate = 1
; var e = Env([0, 1, 0], [0.1, 0.1], \sin, 1, nil)
; var env = EnvGen.kr(e, gate, doneAction: 2)
; var x = MouseX.kr(-10, 10, 'linear', 0.2)
; var dx = x - DelayN.kr(x, 0.1, 0.1)
; var bdx = MouseButton.kr(1, 0, 0.3) + dx
; var bdxr = bdx * BufRateScale.kr(b)
; var scr = PlayBuf.ar(1, b, bdxr, 0, 0, 1)
; var s = Server.default
; s.sendMsg("/b_allocRead", b, fn, 0, 0)
; (scr * env).dup }.play
