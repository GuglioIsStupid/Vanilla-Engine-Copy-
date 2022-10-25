return {
    enter = function(self)
        cam.sizeX, cam.sizeY = 5, 5
        love.graphics.setDefaultFilter("nearest", "nearest")
        bfsprite = love.graphics.newImage(graphics.imagePath("overworld/bf"))
        keyPressed = "down"
        bfAnim = {
            ["down"] = {
                love.graphics.newQuad(16, 0, 16, 16, bfsprite),
                love.graphics.newQuad(0, 0, 16, 16, bfsprite),
                love.graphics.newQuad(16, 0, 16, 16, bfsprite),
                love.graphics.newQuad(32, 0, 16, 16, bfsprite),
            },
            ["up"] = {
                love.graphics.newQuad(64, 0, 16, 16, bfsprite),
                love.graphics.newQuad(48, 0, 16, 16, bfsprite),
                love.graphics.newQuad(64, 0, 16, 16, bfsprite),
                love.graphics.newQuad(80, 0, 16, 16, bfsprite),
            },
            ["left"] = {
                love.graphics.newQuad(112, 0, 16, 16, bfsprite),
                love.graphics.newQuad(96, 0, 16, 16, bfsprite),
            },
            ["right"] = {
                love.graphics.newQuad(144, 0, 16, 16, bfsprite),
                love.graphics.newQuad(128, 0, 16, 16, bfsprite),
            },
            frame = 1,
            timer = 0,
            speed = 8,
            direction = "down",
            x = 160,
            y = 65
        }
        cam.x, cam.y = bfAnim.x, bfAnim.y
        cinnabar = love.graphics.newImage(graphics.imagePath("overworld/cinnabar"))
        gameboy_graphic = love.graphics.newImage(graphics.imagePath("overworld/gameboy_graphic"))
        ocean = love.graphics.newImage(graphics.imagePath("overworld/ocean"))
        cinnabarCollisionData = love.image.newImageData(graphics.imagePath("overworld/cinnabar-collision"))
        cinnabarCollision = {}
        for x = 0, cinnabarCollisionData:getWidth() - 1 do
            cinnabarCollision[x] = {}
            for y = 0, cinnabarCollisionData:getHeight() - 1 do
                local r, g, b, a = cinnabarCollisionData:getPixel(x, y)
                cinnabarCollision[x][y] = a > 0
            end
        end
    end,

    update = function(self, dt)
        -- check for image cinnabar-colliosion
            local r, g, b, a = cinnabarCollisionData:getPixel(bfAnim.x, bfAnim.y)
            if r == 0 and g == 0 and b == 0 and a == 0 then
                if love.keyboard.isDown("up") then
                    if keyPressed ~= "up" then
                        bfAnim.frame = 1
                        bfAnim.timer = 0
                        bfAnim.direction = "up"
                    end
                    keyPressed = "up"
                    bfAnim.y = bfAnim.y - 18 * dt
                    bfAnim.timer = bfAnim.timer + dt
                    if bfAnim.timer >= 1 / bfAnim.speed then
                        bfAnim.timer = bfAnim.timer - 1 / bfAnim.speed
                        bfAnim.frame = bfAnim.frame + 1
                        if math.floor(bfAnim.frame) > #bfAnim["up"] then
                            bfAnim.frame = 0.5 * dt
                        end
                    end
                elseif love.keyboard.isDown("down") then
                    if keyPressed ~= "down" then
                        bfAnim.frame = 1
                        bfAnim.timer = 0
                        bfAnim.direction = "down"
                    end
                    keyPressed = "down"
                    bfAnim.y = bfAnim.y + 18 * dt
                    bfAnim.timer = bfAnim.timer + dt
                    if bfAnim.timer >= 1 / bfAnim.speed then
                        bfAnim.timer = bfAnim.timer - 1 / bfAnim.speed
                        bfAnim.frame = bfAnim.frame + 1
                        if math.floor(bfAnim.frame) > #bfAnim["down"] then
                            bfAnim.frame = 0.5 * dt
                        end
                    end
                elseif love.keyboard.isDown("left") then
                    if keyPressed ~= "left" then
                        bfAnim.frame = 1
                        bfAnim.timer = 0
                        bfAnim.direction = "left"
                    end
                    keyPressed = "left"
                    bfAnim.x = bfAnim.x - 18 * dt
                    bfAnim.timer = bfAnim.timer + dt
                    if bfAnim.timer >= 1 / bfAnim.speed then
                        bfAnim.timer = bfAnim.timer - 1 / bfAnim.speed
                        bfAnim.frame = bfAnim.frame + 1
                        if math.floor(bfAnim.frame) > #bfAnim["left"] then
                            bfAnim.frame = 0.5 * dt
                        end
                    end
                elseif love.keyboard.isDown("right") then
                    if keyPressed ~= "right" then
                        bfAnim.frame = 1
                        bfAnim.timer = 0
                        bfAnim.direction = "right"
                    end
                    keyPressed = "right"
                    bfAnim.x = bfAnim.x + 18 * dt
                    bfAnim.timer = bfAnim.timer + dt
                    if bfAnim.timer >= 1 / bfAnim.speed then
                        bfAnim.timer = bfAnim.timer - 1 / bfAnim.speed
                        bfAnim.frame = bfAnim.frame + 1
                        if math.floor(bfAnim.frame) > #bfAnim["right"] then
                            bfAnim.frame = 0.5 * dt
                        end
                    end
                end
                if bfAnim.frame > #bfAnim[bfAnim.direction] then
                    bfAnim.frame = 1
                end
                -- if no key is pressed, reset the frame to 1
                if not love.keyboard.isDown("up", "down", "left", "right") then
                    bfAnim.frame = 1
                end
                cam.x, cam.y = bfAnim.x, bfAnim.y
            else
                if keyPressed == "up" then
                    bfAnim.y = bfAnim.y + 18 * dt
                elseif keyPressed == "down" then
                    bfAnim.y = bfAnim.y - 18 * dt
                elseif keyPressed == "left" then
                    bfAnim.x = bfAnim.x + 18 * dt
                elseif keyPressed == "right" then
                    bfAnim.x = bfAnim.x - 18 * dt
                end
            end
        
        print(bfAnim.direction, bfAnim.x, bfAnim.y, math.floor(bfAnim.frame))
    end,

    draw = function(self)
        love.graphics.push()
            love.graphics.scale(cam.sizeX, cam.sizeY)
            -- lock the camera to the player
            love.graphics.translate(-bfAnim.x + 120, -bfAnim.y+60)
            -- draw the boyfriend sprite
            love.graphics.draw(cinnabar, 0, 0)
            love.graphics.draw(
                bfsprite,
                bfAnim[bfAnim.direction][math.floor(bfAnim.frame)] or bfAnim[bfAnim.direction][1],
                bfAnim.x,
                bfAnim.y
            )
            love.graphics.draw(ocean, 0, 0)
        love.graphics.pop()
        love.graphics.draw(gameboy_graphic, 0, 0, 0, 5, 5)
        --love.graphics.translate(graphics.getWidth()/2, graphics.getHeight()/2)
    end,

    leave = function(self)

    end
}