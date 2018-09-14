module Main exposing (nPrimos)

esPrimo : Int -> Bool
esPrimo a = primoX 2 a
primoX cont a =
    if a == 2 then True
    else if modBy cont a == 0 then False
    else if cont == a-1 then True else primoX (cont + 1) a

nPrimos : Int -> List Int
nPrimos a = conta (a,2)
conta (a,x) =
    -- if a == 1 then []
    if a == 0 then []
    else if esPrimo a == False then conta (a, x + 1)
    else x :: conta (a - 1,x + 1)