-- pan2 ; ctl=freq:220,220,440,exp;amp:0.1,0,1,amp;pan:0,-1,1,lin
pan2 (sinOsc ar (control kr "freq" 220) 0) (control kr "pan" 0) (control kr "amp" 0.1)
