module Either exposing (..)

{-| A simple module providing an Either type.

# Types
@docs Either

# Maps
@docs mapLeft, mapRight, mapBoth

# Elimination
@docs elim, isLeft, isRight
-}

{-| For when you want a function that needs to take/return values of
    two different types and you don't want to define a whole type. -}
type Either a b
  = Left a
  | Right b

{-| There's only one possible implementation of this function! Try to guess
    what it is. -}
mapRight : (b -> b') -> Either a b -> Either a b'
mapRight f ex = case ex of
  Left a  -> Left a
  Right b -> Right (f b)

{-| There's only one possible implementation of this function! Try to guess
    what it is. -}
mapLeft : (a -> a') -> Either a b -> Either a' b
mapLeft f ex = case ex of
  Left a  -> Left (f a)
  Right b -> Right b

{-| There's only one possible implementation of this function! Try to guess
    what it is. -}
mapBoth : (a -> a') -> (b -> b') -> Either a b -> Either a' b'
mapBoth f g ex = case ex of
  Left a  -> Left (f a)
  Right b -> Right (g b)

{-| There's only one possible implementation of this function! Try to guess
    what it is. -}
elim : (a -> c) -> (b -> c) -> Either a b -> c
elim f g ex = case ex of
  Left a  -> f a
  Right b -> g b

{-| -}
isLeft : Either a b -> Bool
isLeft ex = case ex of
  Left _ -> True
  _      -> False
  
{-| -}
isRight : Either a b -> Bool
isRight ex = case ex of
  Right _ -> True
  _       -> False

