module Task
    ( run
    ) where

import Graphics.Gloss

window :: Display
window = InWindow "MyWindow" (700, 600) (250, 30)

background :: Color
background = mixColors 0.9 0.3 red green

--drawing :: Picture
--drawing = circle 80

run :: IO ()
run = display window background Blank