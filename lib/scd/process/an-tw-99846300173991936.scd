// https://twitter.com/alln4tural/status/99846300173991936
fork{
	loop{
		h=[5,7,8].choose*(2**(2..8).choose);
		play{Splay.ar({SinOsc.ar(exprand(h,h+(h/64)),0,0.1)}!64)*LFGauss.ar(9,1/4,0,0,2)};
		2.wait
	}
}

fork{
	loop{
		h=([33,38,40].choose.midicps)*(2**((0 .. 5).choose));
		play{Splay.ar({SinOsc.ar(exprand(h-(h/256),h+(h/256)),0,0.1)}!64)*LFGauss.ar(19,1/4,0,0,2)};
		4.wait
	}
}

{
    {
        var h = ([33, 38, 40].choose.midicps) * (2 ** (0 .. 5).choose);
        { { SinOsc.ar(ExpRand.ir(h - (h / 256), h + (h / 256)), 0) * 0.05 }.dup(64).splay * LFGauss.ar(19, 1 / 4, 0, 0, 2) }.play;
        4.wait
    }.loop;
}.fork

fork{
	loop{
		h=([33,38,40].choose.midicps)*(2**((0 .. 4).choose));
		play{Splay.ar({SinOsc.ar(exprand(h-(h/64),h+(h/64)),0,0.1)}!8)*LFGauss.ar(19,1/4,0,0,2)};
		0.25.wait
	}
}

fork{
	loop{
		h=(4 .. 100).choose.nthPrime*(2**(0..3).choose);
		play{Splay.ar({SinOsc.ar(exprand(h-(h/256),h+(h/256)),0,0.1)}!64)*LFGauss.ar(19,1/4,0,0,2)};
		2.wait
	}
}

fork{
	loop{
		h=(List.fib(15).choose)*(2**(0..4).choose);
		play{Splay.ar({SinOsc.ar(exprand(h-(h/64),h+(h/64)),0,0.1)}!64)*LFGauss.ar(19,1/4,0,0,2)};
		2.wait
	}
}
