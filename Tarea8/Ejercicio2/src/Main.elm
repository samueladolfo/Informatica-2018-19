module Main exposing (..)

groupBy : (a -> Bool) -> List a -> (List a, List a) 
groupBy a list = (acept a list, dontacept a list)

acept a list = case list of 
    [] -> []
    (c :: css) -> if a c 
                  then acept a css 
                  else c :: acept a css

dontacept a list = case list of 
    [] -> []
    (d :: dss) -> if a d 
                  then d :: dontacept a dss 
                  else dontacept a dss