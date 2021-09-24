"Dseq ; rather than Mce expansion at tr, it can be clearer to view tr as a functor"
|m|
m := [:f|
  |tr sq|
  tr := Impulse freq: f phase: 0.
  sq := Dseq repeats: #dinf list: #(60 63 67 69).
  (Demand trig: tr reset: 0 demandUGens: sq) midicps kr].
(SinOsc freq: (#(2 3 5) collect: m) phase: 0 mul: 0.1) splay
