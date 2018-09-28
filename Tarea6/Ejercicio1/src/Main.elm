module Main exposing (..)

type Natural = Suc Natural | Cero

suma : Natural -> Natural -> Natural
suma x y = case (x,y) of
   
    (Cero, y_) -> y_
    (x_, Cero) -> x_
    (x_, Suc y_) -> suma (Suc x_) y_

resta : Natural -> Natural -> Natural
resta x y = case (x,y) of
   
    (Cero, y_) -> Cero
    (x_, Cero) -> x
    (Suc x_, Suc y_) -> resta x_ y_

multiplicacion : Natural -> Natural -> Natural
multiplicacion x y = case (x,y) of
   
    (Cero, y_) -> Cero
    (x_, Cero) -> Cero    
    (x_, Suc y_) -> suma (x_)(multiplicacion x_ y_)

division : Natural -> Natural -> (Natural,Natural)
division x y = contador (x) (y) (Cero)
contador x y z = 

    if x == (Suc(Cero)) && y == (Suc(Cero)) then ((Suc(z),Cero))
    else if resta x y == Cero then (z,y)
    else contador (resta x y) (y) (Suc (z))
    
        
     
     

    
