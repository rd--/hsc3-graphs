// f0 -- tweet0011
{var s = {|o,i| SinOsc.ar([i,i + 1e-4] ** 2 * f.(o,i-1),f.(o,i - 1) * 1e-4) * f.(o,i - 1)}
;var f = {|o,i| if(i > 0,{s.(o,i)},o)}
;f.(60,6) / 60}
