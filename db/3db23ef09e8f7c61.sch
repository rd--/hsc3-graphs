-- nv 52 https://swiki.hfbk-hamburg.de/MusicTechnology/899
let y = [[256,144],[128,72],[256,144],[128,162],[256,144],[128,450],[256,144],[128,648],[256,144],[216,72],[256,144],[216,162]
        ,[256,144],[216,450],[256,144],[216,648],[256,144],[320,72],[256,144],[320,162],[256,144],[320,450],[256,144],[320,648]
        ,[256,144],[432,72],[256,144],[432,162],[256,144],[432,450],[256,144],[432,648],[256,243],[128,72],[256,243],[128,162]
        ,[256,243],[128,450],[256,243],[128,648],[256,243],[216,72],[256,243],[216,162],[256,243],[216,450],[256,243],[216,648]
        ,[256,243],[320,72],[256,243],[320,162],[256,243],[320,450],[256,243],[320,648],[256,243],[432,72],[256,243],[432,162]
        ,[256,243],[432,450],[256,243],[432,648],[256,360],[128,72],[256,360],[128,162],[256,360],[128,450],[256,360],[128,648]
        ,[256,360],[216,72],[256,360],[216,162],[256,360],[216,450],[256,360],[216,648],[256,360],[320,72],[256,360],[320,162]
        ,[256,360],[320,450],[256,360],[320,648],[256,360],[432,72],[256,360],[432,162],[256,360],[432,450],[256,360],[432,648]
        ,[256,486],[128,72],[256,486],[128,162],[256,486],[128,450],[256,486],[128,648],[256,486],[216,72],[256,486],[216,162]
        ,[256,486],[216,450],[256,486],[216,648],[256,486],[320,72],[256,486],[320,162],[256,486],[320,450],[256,486],[320,648]
        ,[256,486],[432,72],[256,486],[432,162],[256,486],[432,450],[256,486],[432,648],[324,144],[128,72],[324,144],[128,162]
        ,[324,144],[128,450],[324,144],[128,648],[324,144],[216,72],[324,144],[216,162],[324,144],[216,450],[324,144],[216,648]
        ,[324,144],[320,72],[324,144],[320,162],[324,144],[320,450],[324,144],[320,648],[324,144],[432,72],[324,144],[432,162]
        ,[324,144],[432,450],[324,144],[432,648],[324,243],[128,72],[324,243],[128,162],[324,243],[128,450],[324,243],[128,648]
        ,[324,243],[216,72],[324,243],[216,162],[324,243],[216,450],[324,243],[216,648],[324,243],[320,72],[324,243],[320,162]
        ,[324,243],[320,450],[324,243],[320,648],[324,243],[432,72],[324,243],[432,162],[324,243],[432,450],[324,243],[432,648]
        ,[324,360],[128,72],[324,360],[128,162],[324,360],[128,450],[324,360],[128,648],[324,360],[216,72],[324,360],[216,162]
        ,[324,360],[216,450],[324,360],[216,648],[324,360],[320,72],[324,360],[320,162],[324,360],[320,450],[324,360],[320,648]
        ,[324,360],[432,72],[324,360],[432,162],[324,360],[432,450],[324,360],[432,648],[324,486],[128,72],[324,486],[128,162]
        ,[324,486],[128,450],[324,486],[128,648],[324,486],[216,72],[324,486],[216,162],[324,486],[216,450],[324,486],[216,648]
        ,[324,486],[320,72],[324,486],[320,162],[324,486],[320,450],[324,486],[320,648],[324,486],[432,72],[324,486],[432,162]] -- ...
    f = duty (1/5) 0 donothing (dseq 1 y)
    s = varsaw f 0 0.9 * lfpulse 5 0 0.5
in gverb (mix s) 99 5 0.5 0.5 15.0 1.0 0.7 0.5 300.0 / 10
