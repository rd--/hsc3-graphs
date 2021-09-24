"sinOsc ; When two tones are sounded together, a tone of lower frequency is
frequently heard. Such a tone is called a combination tone.  The most
commonly heard combination tone occurs at a frequency f2 - f1."
| f1 f2 f3 a3 |
f1 := 300.
f2 := 300 * 3 / 2. "450"
f3 := (f2 - f1) abs. "150"
a3 := (SinOsc freq: 0.05 phase: 0 mul: 0.1) max: 0.
(SinOsc freq: {f1. f2. f3} phase: 0 mul: {0.1. 0.1. a3}) mix
