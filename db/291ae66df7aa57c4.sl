var input = AudioIn([1]);
var numsamp = 500;
var power= MouseX(0.1, 4, 0, 0.2);
var sum = RunningSum(input ^ power, numsamp);
(sum / numsamp) ^ power.Recip
