-- median ; length can be increased for longer duration noise
let n = dust2Id 'α' ar 100
in median 5 (saw ar 500 * 0.1 + lpz1 (n * 0.9))
