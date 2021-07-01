-- linExp
let mod = sinOsc kr (line kr 1 10 10 DoNothing) 0
in sinOsc ar (mce2 (mod * 400 + 500) (linExp mod (-1) 1 100 900)) 0 * 0.05
