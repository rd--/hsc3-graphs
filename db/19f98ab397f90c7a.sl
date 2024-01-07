let input = AudioIn([1]);
let numsamp = 500;
let power= MouseX(0.1, 4, 0, 0.2);
let sum = RunningSum(input ^ power, numsamp);
(sum / numsamp) ^ power.Recip
