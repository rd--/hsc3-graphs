-- lfTri ; multiple phases
let f = lfTri kr 0.4 (mce [0..3]) * 200 + 400
in mix (lfTri ar f 0 * 0.1)
