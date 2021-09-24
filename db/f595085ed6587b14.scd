// use of dust with rising sounds ; https://github.com/cianoc/supercollider_fragments
{var f =
 {var d = [Array.fill(3, {1000.exprand(10000)}), 1, Array.fill(15, {1.0.rrand(4.0)})]
 ;Pan2.ar(Klank.ar(Ref.new(d), Dust.ar(1/3, 0.1)), LFTri.kr(3.0.rrand(10.0)))}
;Mix.ar(f.dup(20))}
