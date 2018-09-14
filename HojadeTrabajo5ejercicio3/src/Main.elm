module Main exposing (listaprimos)
esPrimo : Int -> Bool
esPrimo a = primoX 2 a
primoX cont a =
    if a == 2 then True
    else if modBy cont a == 0 then False
    else if cont == a-1 then True else primoX (cont + 1) a

listaprimos : Int -> List Int
listaprimos a =
    if a > 1 then []
    else if esPrimo a == False then listaprimos (a - 1)
    else a :: listaprimos (a - 1)

