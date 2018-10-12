module Main exposing (..)

zipWith : (a -> b -> c) -> List a -> List b -> List c
zipWith combine lista1 lista2 = case (lista1, lista2) of 
    ( [] , lista2_) -> []
    (lista1_ , []) -> []
    (x :: xs, y :: ys) -> combine x y :: zipWith combine xs ys

        

