-- whiteNoiseM ; Control.Monad.ap
uid_st_eval
(do x <- return (-) `ap` whiteNoiseM AR `ap` whiteNoiseM AR
    return (x * 0.05))
