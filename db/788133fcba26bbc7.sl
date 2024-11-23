/* https://sccode.org/1-4Qy ; f0 ; 0318 */
let b = [1 .. 3];
let o1 = SinOscFb(13 * 13 * b, 1 / 3);
let o2 = SinOscFb(b / 13, 1);
let o3 = SinOscFb(1 / 13:3, 0) + 133 * b;
let o4 = SinOscFb(b, 1) % 1;
let o5 = SinOscFb(b / 333, o4) % 1;
let o6 = SinOscFb(o3, o5);
Splay(o1 * o2 / 13 + o6) / 3
