~wr_scsyndef = {
    arg nm,f;
    var path = thisProcess.nowExecutingPath;
    if(path.isNil,{
        Error("wr_scsyndef: ?").throw
    },{
        var s_dir = path.dirname.dirname +/+ "scsyndef";
        [nm,s_dir].postln;
        SynthDef(nm,{Out.ar(0,SynthDef.wrap(f))}).writeDefFile(s_dir);
    });
}

