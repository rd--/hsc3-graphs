-- in ; patching input to output, with delay
let i = in' 2 ar numOutputBuses
    d = delayN i 0.5 0.5
in i + d
