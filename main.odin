package game

import "core:fmt"

import rl"vendor:raylib"
// import la"core:math/linalg"

window_Width : i32 = 1080
window_Height : i32 = 720

Shapes :: enum {
    I = 0,
    L,
    O,
    Z,
    T,
}
shapes : Shapes

customRectI : struct {
    rect1 : rl.Rectangle,
    rect2 : rl.Rectangle,
    rect3 : rl.Rectangle,
    rect4 : rl.Rectangle,
}

customRectL : struct {
    rect1 : rl.Rectangle,
    rect2 : rl.Rectangle,
    rect3 : rl.Rectangle,
    rect4 : rl.Rectangle,
}

customRectO : struct {
    rect1 : rl.Rectangle,
    rect2 : rl.Rectangle,
    rect3 : rl.Rectangle,
    rect4 : rl.Rectangle,
}

customRectZ : struct {
    rect1 : rl.Rectangle,
    rect2 : rl.Rectangle,
    rect3 : rl.Rectangle,
    rect4 : rl.Rectangle,
}

customRectT : struct {
    rect1 : rl.Rectangle,
    rect2 : rl.Rectangle,
    rect3 : rl.Rectangle,
    rect4 : rl.Rectangle,
}

RectGrid : rl.Rectangle
// customRect : rl.Rectangle

rnd_num : i32
frame_counter := 0

initGame :: proc () {
    rnd_num = rl.GetRandomValue(0, 4)

    RectGrid = {
        width = 30,
        height = 30,
    }

    customRectI = {
        rect1 = {
            x = 500,
            y = 100,
            width = 30,
            height = 30,
        },

        rect2 = {
            x = 500,
            y = 100 + 30,
            width = 30,
            height = 30,
        },

        rect3 = {
            x = 500,
            y = 100 + (2 * 30),
            width = 30,
            height = 30,
        },

        rect4 = {
            x = 500,
            y = 100 + (3 * 30),
            width = 30,
            height = 30,
        },
    }

    customRectL = {
        rect1 = {
            x = 500,
            y = 100,
            width = 30,
            height = 30,
        },

        rect2 = {
            x = 500,
            y = 100 + 30,
            width = 30,
            height = 30,
        },

        rect3 = {
            x = 500,
            y = 100 + (2 * 30),
            width = 30,
            height = 30,
        },

        rect4 = {
            x = 500 + 30,
            y = 100 + (2 * 30),
            width = 30,
            height = 30,
        },
    }

    customRectO = {
        rect1 = {
            x = 500,
            y = 100,
            width = 30,
            height = 30,
        },

        rect2 = {
            x = 500,
            y = 100 + 30,
            width = 30,
            height = 30,
        },

        rect3 = {
            x = 500 + 30,
            y = 100,
            width = 30,
            height = 30,
        },

        rect4 = {
            x = 500 + 30,
            y = 100 + 30,
            width = 30,
            height = 30,
        },
    }

    customRectZ = {
        rect1 = {
            x = 500,
            y = 100,
            width = 30,
            height = 30,
        },

        rect2 = {
            x = 500 + 30,
            y = 100,
            width = 30,
            height = 30,
        },

        rect3 = {
            x = 500 + 30,
            y = 100 + 30,
            width = 30,
            height = 30,
        },

        rect4 = {
            x = 500 + (30 * 2),
            y = 100 + 30,
            width = 30,
            height = 30,
        },
    }

    customRectT = {
        rect1 = {
            x = 500,
            y = 100,
            width = 30,
            height = 30,
        },

        rect2 = {
            x = 500 + 30,
            y = 100,
            width = 30,
            height = 30,
        },

        rect3 = {
            x = 500 + (2 * 30),
            y = 100,
            width = 30,
            height = 30,
        },

        rect4 = {
            x = 500 + 30,
            y = 100 + 30,
            width = 30,
            height = 30,
        },
    }
}

drawRectangleGrid :: proc() {
    startX : f32 = 100
    startY : f32 = 100

    grid_width := 10
    grid_height := 20

    RectGrid.y = startY
    for i := 0; i < grid_height; i += 1 {
        RectGrid.x = startX
        for j := 0; j < grid_width; j += 1 {
            rl.DrawRectangleLinesEx(RectGrid, 1, rl.RED)
            RectGrid.x += RectGrid.width
            // fmt.printf("\nrect.x: %d\n", rect.x)
        }
        RectGrid.y += RectGrid.height
        // fmt.printf("\nrect.y: %d\n", rect.y)
    }
}

moveMyShape :: proc() {
    if frame_counter % 600 == 0 {
        customRectL.rect1.y += customRectL.rect1.height
        customRectL.rect2.y += customRectL.rect2.height
        customRectL.rect3.y += customRectL.rect3.height
        customRectL.rect4.y += customRectL.rect4.height
    }

    if frame_counter % 600 == 0 {
        customRectI.rect1.y += customRectI.rect1.height
        customRectI.rect2.y += customRectI.rect2.height
        customRectI.rect3.y += customRectI.rect3.height
        customRectI.rect4.y += customRectI.rect4.height
    }

    if frame_counter % 600 == 0 {
        customRectO.rect1.y += customRectO.rect1.height
        customRectO.rect2.y += customRectO.rect2.height
        customRectO.rect3.y += customRectO.rect3.height
        customRectO.rect4.y += customRectO.rect4.height
    }

    if frame_counter % 600 == 0 {
        customRectZ.rect1.y += customRectZ.rect1.height
        customRectZ.rect2.y += customRectZ.rect2.height
        customRectZ.rect3.y += customRectZ.rect3.height
        customRectZ.rect4.y += customRectZ.rect4.height
    }

    if frame_counter % 600 == 0 {
        customRectT.rect1.y += customRectT.rect1.height
        customRectT.rect2.y += customRectT.rect2.height
        customRectT.rect3.y += customRectT.rect3.height
        customRectT.rect4.y += customRectT.rect4.height
    }
}

drawRandomShape :: proc() {
    fmt.println("\n%d\n", rnd_num)
    switch(rnd_num) {
        case 0 : {
            rl.DrawRectangleRec(customRectI.rect1, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectI.rect1, 2,  rl.RED)

            rl.DrawRectangleRec(customRectI.rect2, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectI.rect2, 2,  rl.RED)

            rl.DrawRectangleRec(customRectI.rect3, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectI.rect3, 2,  rl.RED)

            rl.DrawRectangleRec(customRectI.rect4, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectI.rect4, 2,  rl.RED)
        }

        case 1 : {
            rl.DrawRectangleRec(customRectL.rect1, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectL.rect1, 2,  rl.RED)

            rl.DrawRectangleRec(customRectL.rect2, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectL.rect2, 2,  rl.RED)

            rl.DrawRectangleRec(customRectL.rect3, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectL.rect3, 2,  rl.RED)

            rl.DrawRectangleRec(customRectL.rect4, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectL.rect4, 2,  rl.RED)
        }

        case 2 : {
            rl.DrawRectangleRec(customRectO.rect1, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectO.rect1, 2,  rl.RED)

            rl.DrawRectangleRec(customRectO.rect2, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectO.rect2, 2,  rl.RED)

            rl.DrawRectangleRec(customRectO.rect3, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectO.rect3, 2,  rl.RED)

            rl.DrawRectangleRec(customRectO.rect4, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectO.rect4, 2,  rl.RED)
        }

        case 3 : {
            rl.DrawRectangleRec(customRectZ.rect1, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectZ.rect1, 2,  rl.RED)

            rl.DrawRectangleRec(customRectZ.rect2, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectZ.rect2, 2,  rl.RED)

            rl.DrawRectangleRec(customRectZ.rect3, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectZ.rect3, 2,  rl.RED)

            rl.DrawRectangleRec(customRectZ.rect4, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectZ.rect4, 2,  rl.RED)
        }

        case 4 : {
            rl.DrawRectangleRec(customRectT.rect1, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectT.rect1, 2,  rl.RED)

            rl.DrawRectangleRec(customRectT.rect2, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectT.rect2, 2,  rl.RED)

            rl.DrawRectangleRec(customRectT.rect3, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectT.rect3, 2,  rl.RED)

            rl.DrawRectangleRec(customRectT.rect4, rl.SKYBLUE)
            rl.DrawRectangleLinesEx(customRectT.rect4, 2,  rl.RED)
        }
    }
}

drawUpdateFrame :: proc() {
    rl.BeginDrawing()
    rl.ClearBackground(rl.RAYWHITE)

    drawRectangleGrid()
    moveMyShape()

    drawRandomShape()

    rl.EndDrawing()
}

main :: proc() {
    rl.InitWindow(window_Width, window_Height, "tetris");
    defer rl.CloseWindow()

    initGame();

    for !rl.WindowShouldClose() {
        frame_counter += 1
        drawUpdateFrame()
        // drawUI()
    }
}

