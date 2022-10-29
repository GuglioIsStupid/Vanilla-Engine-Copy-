return {
    enter = function(self)
        cam.sizeX, cam.sizeY = 2.5, 2.5

        love.graphics.setDefaultFilter("nearest", "nearest")
        selectArrow = graphics.newImage(love.graphics.newImage(graphics.imagePath("pasta-ui/PastaSelect_Arrow")))
        BG = graphics.newImage(love.graphics.newImage(graphics.imagePath("pasta-ui/PastaSelect_BG")))

        HypnoSelect1 = graphics.newImage(love.graphics.newImage(graphics.imagePath("pasta-ui/PastaSelect_Hypno_01")))
        HypnoSelect2 = graphics.newImage(love.graphics.newImage(graphics.imagePath("pasta-ui/PastaSelect_Hypno_02")))
        HypnoNotSelect = graphics.newImage(love.graphics.newImage(graphics.imagePath("pasta-ui/PastaSelect_Hypno_03")))

        LordXSelect1 = graphics.newImage(love.graphics.newImage(graphics.imagePath("pasta-ui/PastaSelect_LordX_01")))
        LordXSelect2 = graphics.newImage(love.graphics.newImage(graphics.imagePath("pasta-ui/PastaSelect_LordX_02")))
        LordXNotSelect = graphics.newImage(love.graphics.newImage(graphics.imagePath("pasta-ui/PastaSelect_LordX_03")))

        MXSelect1 = graphics.newImage(love.graphics.newImage(graphics.imagePath("pasta-ui/PastaSelect_MX_01")))
        MXSelect2 = graphics.newImage(love.graphics.newImage(graphics.imagePath("pasta-ui/PastaSelect_MX_02")))
        MXNotSelect = graphics.newImage(love.graphics.newImage(graphics.imagePath("pasta-ui/PastaSelect_MX_03")))

        curChar = 2
        selectArrow.x = 0
        selectArrow.y = 0

        MXSelect1.x = -50
        MXSelect2.x = -50
        MXNotSelect.x = -50

        HypnoSelect1.x = 50
        HypnoSelect2.x = 50
        HypnoNotSelect.x = 50

        MXSelect1.y = 35
        MXSelect2.y = 35
        MXNotSelect.y = 35

        HypnoSelect1.y = 41
        HypnoSelect2.y = 41
        HypnoNotSelect.y = 41

        LordXSelect1.y = 45
        LordXSelect2.y = 45
        LordXNotSelect.y = 45

        bgMusic = love.audio.newSource("songs/misc/PastaNightSelect.ogg", "stream")
        bgMusic:setLooping(true)
        bgMusic:play()

        charnames = {
            "Hypno",
            "Lord X",
            "MX"
        }

        theFunny = {
            false,
            false,
            false,
        }

        graphics.fadeIn(
            0.5
        )
    end,

    update = function(self, dt)
        if input:pressed("right") then
            selectArrow.x = selectArrow.x + 50
            curChar = curChar - 1
            if curChar < 1 then
                curChar = 3
                selectArrow.x = -50
            end
        elseif input:pressed("left") then
            curChar = curChar + 1
            selectArrow.x = selectArrow.x - 50
            if curChar > 3 then
                curChar = 1
                selectArrow.x = 50
            end
        end

        if input:pressed("confirm") then
            theFunny[curChar] = true 
                Timer.after(
                    0.15,
                    function()
                        theFunny[curChar] = false
                        Timer.after(
                            0.15,
                            function()
                                theFunny[curChar] = true
                                Timer.after(
                                    0.15,
                                    function()
                                        theFunny[curChar] = false
                                        Timer.after(
                                            0.15,
                                            function()
                                                theFunny[curChar] = true
                                                Timer.after(
                                                    0.15,
                                                    function()
                                                        theFunny[curChar] = false
                                                        Timer.after(
                                                            0.15,
                                                            function()
                                                                theFunny[curChar] = true
                                                                status.setLoading(true)
                                                                songAppend = "hard"
                                                                songNum = 1
                                                                storyMode = false
                                                                --overworldMusic:stop()
                                                                Gamestate.switch(pasta)
                                                                status.setLoading(false)
                                                            end
                                                        )
                                                    end
                                                )
                                            end
                                        )
                                    end
                                )
                            end
                        )
                    end
                )
        end

    end,

    draw = function(self)
        love.graphics.push()
            love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
            love.graphics.scale(cam.sizeX, cam.sizeY)
            BG:draw()

            if curChar == 1 then
                if not theFunny[1] then
                    HypnoSelect1:draw()
                else
                    HypnoSelect2:draw()
                end
                LordXNotSelect:draw()
                MXNotSelect:draw()
            elseif curChar == 2 then
                HypnoNotSelect:draw()
                if not theFunny[2] then
                    LordXSelect1:draw()
                else
                    LordXSelect2:draw()
                end
                MXNotSelect:draw()
            elseif curChar == 3 then
                HypnoNotSelect:draw()
                LordXNotSelect:draw()
                if not theFunny[3] then
                    MXSelect1:draw()
                else
                    MXSelect2:draw()
                end
            end
            selectArrow:draw()
        love.graphics.pop()
    end,

    leave = function(self)
        bgMusic:stop()
        curCharacter = charnames[curChar]
    end
}