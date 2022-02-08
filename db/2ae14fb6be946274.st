"rd (edit) ; f0 <https://twitter.com/redFrik/status/1254441448327479299>"
| b e c d m l j k o |
b := #(1 3 5 8 10).
e := {3. 2/3. 4. 3/2. 2}.
c := 0.021.
d := LFTri freq: b / 999 iphase: 0.
m := LFTri freq: b * c iphase: 0.
l := m * 7 + 20 + (Seq repeats: Float infinity list: b % m * 5 + 6).
j := Duty dur: (e / (12 ** m)) reset: 0 doneAction: 0 level: l.
k := DegreeToKey bufnum: (b asLocalBuf) in: j octave: 12.
o := SinOscFB freq: k midiCps feedback: (LFTri freq: (c / b) iphase: 1 mul: d).
FreeVerb in: o splay2 mix: 0.1 room: 1 damp: 0.5 mul: 0.15
