-- lfTri ; multiple phases
let f = lfTri KR 0.4 (mce [0..3]) * 200 + 400
in mix (lfTri AR f 0 * 0.1)
