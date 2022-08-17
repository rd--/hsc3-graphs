-- diffraction (rd,  2006-09-09)
let noise z = cr (LFNoise0 z)
    p () =
      let x = MouseX 0.001 0.02 1 0.1
          y = MouseY 120 400 1 0.1
          s = Pulse ([32,  64] * noise 4) (x * noise 32)
      in Resonz s (y + 0.1 * noise 2) (noise 6 * 0.4 + 0.8) * 0.5
    q = CombN (p ()) 0.2 (noise 128 * 0.1 + 0.1) 3
in p () + q
