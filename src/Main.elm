module Main exposing (main)

import Browser
import Canvas
import CanvasColor as Color exposing (Color)
import Html exposing (Html)
import Html.Attributes exposing (class, style)

fractal = [
    (300, 100),
    (66.3333, 450),
    (533.6666, 450)]

rep x y ctx = repaux (x) (y) (450) (8) ctx
repaux x y z n ctx = if n > 0
                    then dibujar ([(x,z),(((x)-((1/3)*(z-y))),((z/2)+(y/2))),(((x)+((1/3)*(z-y))),((z/2)+(y/2)))]) ctx
                        |> repaux x y ((z/2)+(y/2)) (n-1)
                        |> repaux ((x)-((1/3)*(z-y))) ((z/2)+(y/2)) (z) (n-1)
                        |> repaux ((x)+((1/3)*(z-y))) ((z/2)+(y/2)) (z) (n-1)
                    else dibujar ([(x,z),(((x)-((1/3)*(z-y))),((z/2)+(y/2))),(((x)+((1/3)*(z-y))),((z/2)+(y/2)))]) ctx
    --[(a,z),(((a)-((1/3)*(z-y))),((z/2)+(b/2))),(((a)+((1/3)*(z-y))),((z/2)+(b/2)))] (z/2)+(y/2)

koch reps = fractal

dibujar triangulo context =
    let
        acc (x,y) s = s |> Canvas.lineTo x y
    in
        case triangulo of
            (x0,y0)::xs ->
                List.foldl acc (Canvas.moveTo x0 y0 context) xs
                |> Canvas.lineTo x0 y0
            _ -> context

-- Funcion que genera el html que corresponde al
-- poligono siendo dibujado
view : Html msg
view =
    let
        width = 600
        height = 600
        poligono ctx = dibujar (koch 5) ctx
        marianaTeExtrano ctx = rep 300 100 ctx
        rojo = Color.red
        verde = Color.green
        azul = Color.blue
    in
        Canvas.element
            width
            height
            [ style "border" "5px solid yellow" ]
            (
                Canvas.empty
                |> Canvas.clearRect 0 0 width height
                |> Canvas.strokeStyle (verde)
                |> poligono
                |> marianaTeExtrano
                |> Canvas.strokeStyle (verde)
                |> Canvas.stroke
                |> Canvas.fillStyle (verde)
                |> Canvas.fill (Canvas.NonZero)
            )
            
main = view