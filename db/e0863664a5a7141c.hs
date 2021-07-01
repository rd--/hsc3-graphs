-- blip ; self-modulation at control rate
let fr = blip kr 0.25 3 * 300 + 500
    nh = blip kr 0.15 2 * 20 + 21
in blip ar fr nh * 0.2
