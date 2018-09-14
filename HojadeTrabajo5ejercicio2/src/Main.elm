module Main exposing (fibonacci)

fibonacci : Int -> Int
fibonacci a =
    if a == 0 then 0
    else if a == 1 then 1 else fibonacci (a - 1) + fibonacci (a - 2)
