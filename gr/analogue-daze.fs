\ analogue daze (jmcc) #3

: two-pi 2 pi * ;
: rev unmce swap 2 mce ;
: sequ { s tr } tr 0 inf s Dseq.dr Demand.kr ;

: nt-seq 55 63 60 63 57 65 62 65 8 mce ;
: freq { oct clk-rt pwm-rt flt-rt }
    clk-rt 0 Impulse.kr { tr }
    nt-seq oct 12 * + MIDICPS tr sequ { sq }
    pwm-rt 0 two-pi Rand.ir SinOsc.kr 0.4 * 0.5 + { pwm }
    flt-rt 0 two-pi Rand.ir SinOsc.kr 1400 * 2000 + { cf }
    sq 0.05 Lag 0 pwm LFPulse.ar 0.1 * cf 1 15 / RLPF ;
: noise 0.3 LFNoise1.kr 6000 * 8000 + LFNoise0.ar 0.07 0.08 2 mce * ;
: pulses 2 0 Impulse.ar 0.15 Decay noise * ;
: plain 1 8 0.31 0.2 freq 0 2 0.13 0.11 freq 2 mce pulses + ;
: echoed plain 0.375 0.375 5 CombN plain rev + 0.4 * ;
: env 1 1 0 1 remove-synth 2 56 2 1 env-linen EnvGen.kr ;

echoed env * play
