-- ladspa ; caps ; # 2586 C* PhaserII - Mono phaser
let s = soundIn 0
    x = mouseX kr 0 1 Linear 0.2
    y = mouseY kr 0 1 Linear 0.2
in X.ladspa 1 ar 2586 [0.3,x,0.5,y,0.8,s]
