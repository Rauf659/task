module Task
    ( run
    ) where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game

window :: Display
window = InWindow "MyWindow" (700, 600) (250, 30)

background :: Color
background = mixColors 0.9 0.3 red green

--drawing :: Picture
--drawing = circle 80

baseWin :: Display
baseWin = window

renderWin :: Display -> Picture
renderWin _ = Blank

handleWin :: Event -> Display -> Display
handleWin _ x = x

updateWin :: Float -> Display -> Display
updateWin _ x = x

run :: IO ()
run = play window background 0 baseWin renderWin handleWin updateWin