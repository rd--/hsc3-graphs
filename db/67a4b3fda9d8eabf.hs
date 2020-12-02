-- sinOsc ; "When two tones are sounded together, a tone of lower frequency is
-- frequently heard. Such a tone is called a combination tone.  The most
-- commonly heard combination tone occurs at a frequency f2 - f1."
let f1 = 300
    f2 = 300 * 3/2 {- 450 -}
    f3 = abs (f2 - f1) {- 150 -}
    a3 = max (sinOsc KR 0.05 0 * 0.1) 0
in mix (sinOsc AR (mce3 f1 f2 f3) 0 * mce3 0.1 0.1 a3)
