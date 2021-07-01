-- sc-users, 2007-04-06 (pj) [paul jones]
let insects _ =
      let o = sinOsc kr (lfNoise2 kr 50 * 50 + 50) 0 * 100 + 2000
      in bpf (brownNoise ar) o 0.001 * 10
in mceFill 2 insects
