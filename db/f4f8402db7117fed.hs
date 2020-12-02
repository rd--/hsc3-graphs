-- median ; signal with impulse noise
let n = dust2 'α' AR 100
in median 3 (saw AR 500 * 0.1 + n * 0.9)
