module MyAnimation where

import Animation

--Color variables are declared to get rid of rgb structure in the code to make it simple. These color are not present in the library Animation.hs and are created to make a painterly animation.
darkBlue = rgb 0.2 0 0.5
lightBlue = rgb 0.2 0.8 1
navyBlue = rgb 0.2 0 0.3
moonYellow = rgb 1 1 0.5
darkYellow = rgb 1 0.9 0.6

--Picture is the final draw of the created shapes: a typical view of sunrise and sunset in a city. The sky, the sun, the moon and the building will compose it.
picture :: Animation
picture =
    (sky)
    `plus`
    (sun)
    `plus`
    (moon)
    `plus`
    (building)

--The sky is composed of a rectangle (with the same size of the animation to act as background) and a repetition of a polygon (that forms stars). I have used a cartesian plane to make the stars and then I translated the x and y points into code.
sky :: Animation
sky =
    (withPaint (cycleSmooth 3.75
        [darkBlue, lightBlue, darkBlue, navyBlue])
            (rect (always 800) (always 600)))
    `plus`
    withPaint (cycleSmooth 3.75 [darkBlue, lightBlue, darkBlue, white])
        (combine
            [translate (always (30+(i*3), 40+i))
                (scale (always (0.25, 0.25))
                    (polygon [(0,100), (42,100), (50,60), (58,100), (100,100), (60,110), (75,150), (50,118), (25, 150), (40,110), (0,100)]))
            | i <- [45,100,200]])

--The sun is simply a circle that rotates around a center, set at middle-bottom part of the animation.
sun :: Animation
sun =
    withPaint (cycleSmooth 3.75 [red, yellow, red, yellow])
        (translate (always (400, 600))
            (rotate (spinner 15)
                (translate (always (-450,0))
                    (circle (always 25)))))

--The moon acts like the sun, but it starts at the opposite site. It also has 2 craters. I have used a loop to create 2 craters.
moon :: Animation
moon =
    withPaint (always moonYellow)
        (translate (always (400, 600))
            (rotate (spinner 15)
                (translate (always (450,0))
                    (circle (always 25)))))
    `plus`
    (combine
        [translate (always((x*2)+385,(x*2)+590))
            (withPaint (always darkYellow)
                (rotate (spinner 15)
                    (translate (always (450, 0))
                        (circle (always (3+x))))))
        | x <- [2, 9]])

--The buiding is formed by a rectagle (which creates the general shape of a building) and windows (a repetition of squares, using fromIntegral and loops).
building :: Animation
building =
    translate (always (0, 220))
        (withPaint (cycleSmooth 3.75
            [black, silver, black, black])
                (rect (always 180) (always 400)))
    `plus`
    (combine
        [translate (always (fromIntegral i+10, fromIntegral x+270))
            (withPaint (cycleSmooth 3.75 [yellow, white, yellow, yellow])
                (rect (always 20) (always 20)))
        | i <- [0, 40..120], x <- [0,50..300]])

test :: IO () 
test = writeFile "test.svg" (svg 800 600 picture)