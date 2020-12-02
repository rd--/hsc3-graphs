-- blip ; self-modulation at control rate
let fr = blip KR 0.25 3 * 300 + 500
    nh = blip KR 0.15 2 * 20 + 21
in blip AR fr nh * 0.2
