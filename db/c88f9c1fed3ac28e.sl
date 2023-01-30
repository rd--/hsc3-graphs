;; Blip ; event control ; i=o ii=rx iii=ry
var f = { :e | Pan2(Blip((e.p * 127).MidiCps, e.y * 10 + 1), e.o * 2 - 1, e.w * e.z * e.z) };
Voicer(16, f).sum
