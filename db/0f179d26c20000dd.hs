-- median ; signal with impulse noise
let n = dust2Id 'α' ar 100
in median 3 (saw ar 500 * 0.1 + n * 0.9)
