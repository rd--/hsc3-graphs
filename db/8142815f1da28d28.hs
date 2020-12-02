-- median ; length can be increased for longer duration noise
let n = dust2 'α' AR 100
in median 5 (saw AR 500 * 0.1 + lpz1 (n * 0.9))
