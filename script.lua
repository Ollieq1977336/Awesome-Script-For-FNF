local note_Screen_Shake = true -- Makes the screen shake on note hit.
local drainHealth = true -- You know what this does.
local background_Shake = false -- Continuesly shakes the background.
local note_Background_Shake = true -- background_Shake MUST BE false FOR THIS TO WORK PROPERLY.
local WINDOWSHAKE = true -- does the awsome window shaking
local BFWINDOWSHAKE = false
local Modcharts = true -- m o d c h a r t s
local movescreen = true

--MODCHART SECTION
local screentiltonbeat = true
local angletilt = 30
local tweening = 'quadOut'
-- END OF MODCHARTS
local shakepower = 5
local shakepowerbf = 5
local intensity = 0.02 -- For the hud.
local duration = 0.1
local intensity2 = 0.01 -- For the background (IF CONTINUOUS).
local duration2 = 0.1
local intensity3 = 0.02 -- For the background (IF WHEN TRIGGERED ON NOTE HIT).
local duration3 = 0.1
local healthDrain_AMOUNT = 0.1
local healthDrain_MAX = 0.1 -- (50 = HALF HEALTH)

local angleshit = angletilt;
local anglevar = angletilt;

-- DO NOT TOUCH WHATS BELOW.

function onBeatHit()
    if Modcharts then
        if screentiltonbeat then
            if curBeat % 2 == 0 then
  
                angleshit = anglevar;
              else
                angleshit = -anglevar;
              end
                        
              setProperty('camHUD.angle', angleshit)
            
              doTweenAngle('turn', 'camHUD', 0, stepCrochet*0.005, tweening)
          
              
          end 
        end 
        end



function opponentNoteHit()
    if note_Screen_Shake == true then
        camShake()  
    end
    if drainHealth == true then
        healthDrain(healthDrain_AMOUNT,healthDrain_MAX) 
    end
    if note_Background_Shake == true then
        cameraShake('game', intensity3, duration3)
    end
    if WINDOWSHAKE then
        windowShake(shakepower)
    end
    end
    function goodNoteHit(id, direction, noteType, isSustainNote)
        if BFWINDOWSHAKE then
            windowShake(shakepowerbf)
            
        end
        
    end

    function windowShake(power)
        if Modcharts then
            if movescreen then
                local windowX = getPropertyFromClass('openfl.Lib', 'application.window.x')
                local windowY = getPropertyFromClass('openfl.Lib', 'application.window.y')
                setPropertyFromClass('openfl.Lib','application.window.x',windowX + math.random(-power,power))
            
                setPropertyFromClass('openfl.Lib','application.window.y',windowY + math.random(-power,power))

            end
        end
    end


function healthDrain(drainage, maxDrainage)
    health = getProperty('health')
    if getProperty('health') > maxDrainage / 50 then
        setProperty('health', health- drainage / 50);
end
end

function onUpdatePost(elapsed)
    if background_Shake == true then
        cameraShake('game', intensity2, duration2)
    end
end
function camShake()
    cameraShake('hud', intensity, duration)
end
