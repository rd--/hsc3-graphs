-- linExp
let mod = sinOsc KR (line KR 1 10 10 DoNothing) 0
in sinOsc AR (mce2 (mod * 400 + 500) (linExp mod (-1) 1 100 900)) 0 * 0.05
