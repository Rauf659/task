module Task
    ( run
    ) where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game

window :: Display
window = InWindow "MyWindow" (700, 600) (250, 30)

background :: Color
background = mixColors 0.2 0.6 red blue

myCircle :: Picture
myCircle = circle 80

myRectangle :: Picture
myRectangle = lineLoop (rectanglePath 250 250)

--mH :: Path
--mH = [(20, 0), (10, 20), (-10, 20), (-20, 0), (-10, -20), (10, -20)]

myHex :: Picture
myHex = lineLoop [(50, 0), (30, 50), (-30, 50), (-50, 0), (-30, -50), (30, -50)]

myText :: Picture
myText = translate (-330) 150 (text "Extra thick")

baseWin :: Picture
baseWin = pictures [myCircle, myRectangle, myText, myHex]

renderWin :: Picture -> Picture
renderWin x = x

handleWin :: Event -> Picture -> Picture
handleWin _ x = x

updateWin :: Float -> Picture -> Picture
updateWin _ x = x

run :: IO ()
run = play window background 0 baseWin renderWin handleWin updateWin