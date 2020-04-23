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

myElps :: Picture
myElps = scale 1.5 1 (circleSolid 30)

mySmile :: Float -> Float -> Picture
mySmile n m = Pictures [translate (-300) 0 (color yellow (circleSolid 50)),
                    translate (-275) 20 (color orange (circleSolid 10)),
                    translate (-325) 20 (color orange (circleSolid 10)),
                    translate (-300) (-15) (color (dark orange) (arcSolid n m 25))]

myText :: Picture
myText = translate (-330) 150 (text "Extra thick")

baseWin :: Picture
baseWin = Pictures [myElps, myCircle, myRectangle, myText, myHex, mySmile 180 0]

newWin = Pictures [myElps]

renderWin :: Picture -> Picture
renderWin x = x

--func :: Float -> Float -> Picture -> Picture
--func st1 st2 pic | (st1 <= 0) = func st1 st2 (translate (st1 - 10.0) 0 pic)
--                 | (st1 >= 0) = func st1 st2 (translate (st1 + 10.0) 0 pic)
--                 | (st2 <= 0) = func st1 st2 (translate 0 (st2 - 10.0) pic)
--                 | (st2 >= 0) = func st1 st2 (translate 0 (st2 + 10.0) pic)

handleWin :: Event -> Picture -> Picture
handleWin (EventKey (SpecialKey KeyLeft) Down _ _) pic = translate (-10) 0 pic
handleWin (EventKey (SpecialKey KeyRight) Down _ _) pic = translate 10 0 pic
handleWin (EventKey (SpecialKey KeyUp) Down _ _) pic = translate 0 10 pic
handleWin (EventKey (SpecialKey KeyDown) Down _ _) pic = translate 0 (-10) pic
handleWin (EventKey (SpecialKey KeySpace) Down _ _) pic = Pictures [translate (-300) 150 (text "Surpize!!!"), translate 350 (-50) (scale 1.5 1.5 (mySmile 0 180))]
handleWin _ x = x

updateWin :: Float -> Picture -> Picture
updateWin _ x = x

run :: IO ()
run = play window background 0 newWin renderWin handleWin updateWin