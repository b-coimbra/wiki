data Color = Red | Blue | Green
data Hex   = FF0 | 000  | FFF

data Bool = True | False

data Point = Point Float Float deriving (Show)

data Shape = Circle Point Float
           | Rectangle Point Point
           deriving (Show)

surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

-- exporting the functions and types in a module (.. means all the value constructors)
module Shapes
  ( Point(..)
  , Shape(..)
  , surface
  , nudge
  ) where


