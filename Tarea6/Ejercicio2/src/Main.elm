module Main exposing (..)

type Expresion = Valor Int | Suma Expresion Expresion | Mult Expresion Expresion

suma : Int-> Int -> Int
suma x y = x + y

multiplicacion : Int-> Int -> Int
multiplicacion x y = x * y

expresion : (Int -> Int -> Int, Int -> Int -> Int) -> Expresion -> Int
expresion (x,y) z = case z of

    Suma a b -> x (expresion (x, y) a) (expresion (x, y) b)
    Mult a b -> y (expresion (x, y) a) (expresion (x, y) b)
    Valor a -> a