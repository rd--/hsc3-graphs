// tw 0011 (f0) ; https://twitter.com/redFrik/status/23182604046
{var s =
 {arg o, i
 ;SinOsc.ar(freq: [i, i + 0.0001] ** 2 * f.value(o, i - 1)
           ,phase: f.value(o, i - 1) * 0.0001
           ,mul: f.value(o, i - 1))}
;var f = {arg o, i; (i > 0).if({s.value(o, i)}, {o})}
;f.value(60, 6) / 60}

//----
{f={arg o,i; if(i>0,{SinOsc.ar([i,i+1e-4]**2*f.(o,i-1),f.(o,i-1)*1e-4,f.(o,i-1))},o)};f.(60,6)/60}
