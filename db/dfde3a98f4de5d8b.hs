-- localIn ; tape-delay ; mouse control ; warning=feedback
let rotate2_mce z p =
      case mceChannels z of
        [l,r] -> rotate2 l r p
        _ -> error "rotate2_mce"
    tape_delay dt fb z =
      let a = amplitude kr (mix z) 0.01 0.01
          z' = z * (a >** 0.02)
          l0 = localIn 2 ar 0
          l1 = onePole l0 0.4
          l2 = onePole l1 (-0.08)
          l3 = rotate2_mce l2 0.2
          l4 = delayN l3 dt dt
          l5 = leakDC l4 0.995
          l6 = softClip ((l5 + z') * fb)
      in mrg2 (l6 * 0.1) (localOut l6)
    y = mouseY kr 0.75 1.25 Linear 0.2
in tape_delay 0.25 y (soundIn 0)
