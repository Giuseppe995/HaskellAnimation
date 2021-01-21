module Week8 where

import Animation

picture :: Animation
picture =
    translate (always (400,300)) (combine
     [(withBorder (always grey) (always 4)
          (withoutPaint
           (circle (always 80))))
        `plus`
         withPaint (always black)
          (rotate (spinner 10)
            (translate (always (80,0))
              (circle (always 5))))
         `plus`
         (withBorder (always grey) (always 4)
          (withoutPaint
           (circle (always 240))))
         `plus`
         withPaint (always black)
          (rotate (spinner 15)
            (translate (always (240,0))
              (circle (always 5))))])

test :: IO ()
test = writeFile "testPlanets.svg" (svg 800 600 picture)

{-module MyAnimation where

import Animation

darkBlue = rgb 0.2 0 0.5
lightBlue = rgb 0.2 0.8 1
navyBlue = rgb 0.2 0 0.3
moonYellow = rgb 1 1 0.5
lightYellow = rgb 1 1 0.9
darkYellow = rgb 1 0.9 0.6

sky :: Animation
sky =
    (withPaint (cycleSmooth 3.0
            [darkBlue, lightBlue, darkBlue, navyBlue, navyBlue, navyBlue, navyBlue, navyBlue])
                (rect (always 800) (always 600)))
    `plus`
    withPaint (cycleSmooth 3.0
            [white, lightBlue, white, white, white, white, white, white])
        (combine
            [translate (always (30+(i*3), 40+i))
                (scale (always (0.25, 0.25))
                            (polygon [(0,100), (42,100), (50,60), (58,100), (100,100), (60,110), (75,150), (50,118), (25, 150), (40,110), (0,100)]))
            | i <- [45,100,200]])
            
sun :: Animation
sun =
    withPaint (cycleSmooth 3.0 [red, yellow, red, yellow])
        (translate (always (400, 600))
            (rotate (spinner 12)
                (translate (always (450,0))
                    (circle (always 20)))))
                    
moon :: Animation
moon =
    withPaint (cycleSmooth 3.0 [moonYellow, lightYellow, moonYellow, lightYellow])
        (translate (cycleSmooth 6.0 
            [(840, 640), (-40, 640), (-40, 200), (830, 200)])
                (circle (always 20)))
    {-`plus`
    withPaint (always darkYellow)
        (combine
            [translate (cycleSmooth 6.0 
                [(840, 640), (-40, 640), (-44, 208), (824, 208)])
                    (circle (always 5))
            | x <- [-6, 0, 7], y <- [0]])-}
    `plus`
    withPaint (always darkYellow)
        (translate (cycleSmooth 6.0 
            [(840, 640), (-40, 640), (-37, 192), (833, 192)])
                (circle (always 8)))
    `plus`
    withPaint (always darkYellow)
        (translate (cycleSmooth 6.0 
            [(840, 640), (-40, 640), (-50, 190), (820, 190)])
                (circle (always 3)))
                
building :: Animation
building =
    translate (always (0, 220))
      (withPaint (cycleSmooth 3.0
            [black, silver, black, black, black, black, black, black])
                (rect (always 180) (always 400)))
    `plus`
    (combine
        [translate (always (fromIntegral i+10, fromIntegral x+270))
            (withPaint (cycleSmooth 3.0 [yellow, white, yellow, yellow, yellow, yellow, yellow, yellow])
                (rect (always 20) (always 20)))
        | i <- [0, 40..120], x <- [0,50..300]])


picture :: Animation
picture =
    (sky)
    `plus`
    (sun)
    `plus`
    (moon)
    `plus`
    (building)
    
    


test :: IO () 
test = writeFile "test.svg" (svg 800 600 picture)

module MyAnimation where

import Animation

darkBlue = rgb 0.2 0 0.5
lightBlue = rgb 0.2 0.8 1
navyBlue = rgb 0.2 0 0.3
moonYellow = rgb 1 1 0.5
lightYellow = rgb 1 1 0.9
darkYellow = rgb 1 0.9 0.6

sky :: Animation
sky = 
    translate (always (0, 0))
        (withPaint (cycleSmooth 3.0
            [darkBlue, lightBlue, darkBlue, navyBlue, navyBlue, navyBlue, navyBlue, navyBlue])
                (rect (always 800) (always 600)))
    `plus`
    withPaint (cycleSmooth 3.0
            [white, lightBlue, white, white, white, white, white, white])
        (combine
            [translate (always (30+(i*3), 40+i))
                (scale (always (0.25, 0.25))
                            (polygon [(0,100), (42,100), (50,60), (58,100), (100,100), (60,110), (75,150), (50,118), (25, 150), (40,110), (0,100)]))
            | i <- [45,100,200]])

sun :: Animation
sun = 
    withPaint (cycleSmooth 3.0 [red, yellow, red, yellow] )
        (translate (cycleSmooth 6.0 [(-98, 150), (782, 150), (840, 640), (-40, 640)])
            (scale (always (0.15, 0.15))
                (polygon [(414, 380), (393, 600), (357, 375), (183, 507), (331, 336), (100, 293), (341, 300), (193, 083), (369, 279), (407, 0), (400, 284), (617, 93), (440, 304), (700, 307), (451, 351), (607, 517)])))
    `plus`
     withPaint (cycleSmooth 3.0 [red, yellow, red, yellow])
        (translate (cycleSmooth 6.0 
            [(-40, 200), (840, 200), (840, 640), (-40, 640)])
                (circle (always 20)))

moon :: Animation
moon = 
    withPaint (cycleSmooth 3.0 [moonYellow, lightYellow, moonYellow, lightYellow] )
        (translate (cycleSmooth 6.0 
            [(840, 640), (-40, 640), (-40, 200), (830, 200)])
                (circle (always 20)))
    `plus`
    withPaint (always darkYellow)
        (translate (cycleSmooth 6.0 
            [(840, 640), (-40, 640), (-44, 208), (824, 208)])
                (circle (always 5)))
    `plus`
    withPaint (always darkYellow)
        (translate (cycleSmooth 6.0 
            [(840, 640), (-40, 640), (-37, 192), (833, 192)])
                (circle (always 8)))
    `plus`
    withPaint (always darkYellow)
        (translate (cycleSmooth 6.0 
            [(840, 640), (-40, 640), (-50, 190), (820, 190)])
                (circle (always 3)))

 building :: Animation 
 building = 
    translate (always (0, 220))
      (withPaint (cycleSmooth 3.0
            [black, silver, black, black, black, black, black, black])
                (rect (always 180) (always 400)))
    `plus`
    (combine
        [translate (always (fromIntegral i+10, fromIntegral x+270))
            (withPaint (cycleSmooth 3.0 [yellow, white, yellow, yellow, yellow, yellow, yellow, yellow])
                (rect (always 20) (always 20)))
        | i <- [0, 40..120], x <- [0,50..300]])
                
pic :: Animation
pic =
    (sky)
    `plus`
    (sun)
    `plus`
    (moon)
    `plus`
    (building)
    
test :: IO () 
test = writeFile "test.svg" (svg 800 600 pic)-}