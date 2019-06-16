~add_env = {
    arg newEventFunc, i;
    {
        var sustainTime = \sustainTime.kr(4);
        var transitionTime = \transitionTime.kr(1);
        var env = Env([0,1,1,0],[transitionTime,sustainTime,transitionTime],\sin);
        Out.ar(0,newEventFunc.(i) * EnvGen.kr(env,doneAction: 2));
    };
};

~spawn = {
    arg newEventFunc, nextTime, maxRepeats = inf;
    Task({
        maxRepeats.do({
            arg i;
            {Out.ar(0,newEventFunc.(i))}.play;
            nextTime.value.wait;
        });
    }).play;
};

~xfade_texture = {
    arg newEventFunc, sustainTime = 4.0, transitionTime = 4.0, maxRepeats = inf;
    var period = sustainTime + transitionTime;
    Task({
        maxRepeats.do({
            arg i;
            ~add_env.(newEventFunc,i).play(args:[
                \sustainTime:sustainTime,
                \transitionTime:transitionTime]);
            period.wait;
        });
    }).play;
};

~overlap_texture = {
    arg newEventFunc, sustainTime = 4.0, transitionTime = 4.0, overlap = 2, maxRepeats = inf,
        postProcess = nil, bus = 0, numChannels = 2;
    var period = (sustainTime + (transitionTime * 2)) / overlap;
    Task({
        maxRepeats.do({
            arg i;
            ~add_env.(newEventFunc,i).play(args:[
                \sustainTime:sustainTime,
                \transitionTime:transitionTime]);
            period.wait;
        });
    }).play;
    if(postProcess.notNil,{~post_process.(postProcess,bus,numChannels)});
};

~post_process = {
    arg treatment, bus = 0, numChannels = 2;
    {
        var z = In.ar(bus,numChannels);
        z = treatment.(z);
        ReplaceOut.ar(bus,z);
    }.play(addAction: \addToTail);
};
