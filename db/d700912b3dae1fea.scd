// PanAz ; Mce (ie. at numChans)
PanAz.ar([8, 4], SinOsc.ar([333, 555], 0) * 0.1, LFSaw.kr(1 / 9, 0), 1, 2, [0, 0.5]).flat
