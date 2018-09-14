module Main exposing(esPrimo)
esPrimo : Int -> Bool
esPrimo a = primoX 2 a
primoX cont a =
    if a == 2 then True
    else if modBy cont a == 0 then False
    else if cont == a-1 then True else primoX (cont + 1) a