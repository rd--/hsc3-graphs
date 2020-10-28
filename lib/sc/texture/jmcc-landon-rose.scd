// landon rose (jmcc) #8
(var tring = #[3,3,3,3]
;var specList =
 [`[[32,43,54,89].midicps,nil,tring]
 ,`[[10,34,80,120].midicps,nil,tring]
 ,`[[67,88,90,100].midicps,nil,tring]
 ,`[[14,23,34,45].midicps,nil,tring]
 ,`[[76,88,99,124].midicps,nil,tring]]
;var e = Env.sine(4,1)
;Texture.spawn({
    arg i;
    var n = PinkNoise.ar([0.001,0.001]);
    Klank.ar(specList.wrapAt(i),n) * EnvGen.ar(e,doneAction:2);
},nextTime: 2))
