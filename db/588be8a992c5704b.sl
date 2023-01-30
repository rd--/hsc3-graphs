;; Blip ; event control ; shared parameter
var nh = 1;
Voicer(16, { :e | Blip((e.p * 127).MidiCps, nh) * e.w * e.z }).Splay2
