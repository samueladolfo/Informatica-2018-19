module Main exposing (..)

bind : Maybe a -> (a -> Maybe b) -> Maybe b
bind abc b = 
  case abc of 
    Nothing -> Nothing 
    Just a -> b a