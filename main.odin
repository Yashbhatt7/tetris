package game

import "core:fmt"

import rl"vendor:raylib"
// import la"core:math/linalg"

window_Width : i32 = 1080
window_Height : i32 = 900

// Shapes :: enum {
//     I = 0,
//     L,
//     O,
//     Z,
//     T,
// }
// shapes : Shapes

// custom shapes
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

// active shapes
ActiveShape : struct {
    rect1 : ^rl.Rectangle,
    rect2 : ^rl.Rectangle,
    rect3 : ^rl.Rectangle,
    rect4 : ^rl.Rectangle,
}

// collision rects
CollisionRects : struct {
    rect1 : rl.Rectangle,
    // rect2 : rl.Rectangle,
    // rect3 : rl.Rectangle,
}


RectGrid : rl.Rectangle
// customRect : rl.Rectangle

rnd_num : i32
frame_counter := 0

initGame :: proc () {
    RectGrid = {
        width = 30,
        height = 30,
    }

    CollisionRects = {
        rect1 = {
            x = 300,
            y = 700,
            width = 350,
            height = 20,
        }
    }
}

initShape :: proc() {
    rnd_num = rl.GetRandomValue(0, 4)

    switch(rnd_num) {
        case 0 : {
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
        }

        case 1 : {
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
        }

        case 2 : {
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
        }

        case 3 : {
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
        }
        case 4 : {
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
    }
}

drawRectangleGrid :: proc() {
    startX : f32 = 320
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
    // fall
    collision := rl.CheckCollisionRecs(ActiveShape.rect4^, CollisionRects.rect1)
    if !collision {
        if frame_counter % 300 == 0 {
            ActiveShape.rect1^.y += ActiveShape.rect1^.height
            ActiveShape.rect2^.y += ActiveShape.rect2^.height
            ActiveShape.rect3^.y += ActiveShape.rect3^.height
            ActiveShape.rect4^.y += ActiveShape.rect4^.height
        }
        // movement with A & D
        if rl.IsKeyPressed(.D) {
            ActiveShape.rect1.x += ActiveShape.rect1.width
            ActiveShape.rect2.x += ActiveShape.rect2.width
            ActiveShape.rect3.x += ActiveShape.rect3.width
            ActiveShape.rect4.x += ActiveShape.rect4.width
        }

        if rl.IsKeyPressed(.A) {
            ActiveShape.rect1.x -= ActiveShape.rect1.width
            ActiveShape.rect2.x -= ActiveShape.rect2.width
            ActiveShape.rect3.x -= ActiveShape.rect3.width
            ActiveShape.rect4.x -= ActiveShape.rect4.width
        }
    } else {
        initShape();
    }

}

drawActiveShape :: proc() {
    rl.DrawRectangleRec(ActiveShape.rect1^, rl.SKYBLUE)
    rl.DrawRectangleLinesEx(ActiveShape.rect1^, 2,  rl.RED)

    rl.DrawRectangleRec(ActiveShape.rect2^, rl.SKYBLUE)
    rl.DrawRectangleLinesEx(ActiveShape.rect2^, 2,  rl.RED)

    rl.DrawRectangleRec(ActiveShape.rect3^, rl.SKYBLUE)
    rl.DrawRectangleLinesEx(ActiveShape.rect3^, 2,  rl.RED)

    rl.DrawRectangleRec(ActiveShape.rect4^, rl.SKYBLUE)
    rl.DrawRectangleLinesEx(ActiveShape.rect4^, 2,  rl.RED)
}

setActiveShape :: proc() {
    switch(rnd_num) {
        case 0 : {
            ActiveShape.rect1 = &customRectI.rect1
            ActiveShape.rect2 = &customRectI.rect2
            ActiveShape.rect3 = &customRectI.rect3
            ActiveShape.rect4 = &customRectI.rect4
        }

        case 1 : {
            ActiveShape.rect1 = &customRectL.rect1
            ActiveShape.rect2 = &customRectL.rect2
            ActiveShape.rect3 = &customRectL.rect3
            ActiveShape.rect4 = &customRectL.rect4
        }

        case 2 : {
            ActiveShape.rect1 = &customRectO.rect1
            ActiveShape.rect2 = &customRectO.rect2
            ActiveShape.rect3 = &customRectO.rect3
            ActiveShape.rect4 = &customRectO.rect4
        }

        case 3 : {
            ActiveShape.rect1 = &customRectZ.rect1
            ActiveShape.rect2 = &customRectZ.rect2
            ActiveShape.rect3 = &customRectZ.rect3
            ActiveShape.rect4 = &customRectZ.rect4
        }

        case 4 : {
            ActiveShape.rect1 = &customRectT.rect1
            ActiveShape.rect2 = &customRectT.rect2
            ActiveShape.rect3 = &customRectT.rect3
            ActiveShape.rect4 = &customRectT.rect4
        }
    }
}

drawUpdateFrame :: proc() {
    rl.BeginDrawing()
    rl.ClearBackground(rl.RAYWHITE)

    drawRectangleGrid()

    setActiveShape()
    drawActiveShape()

    moveMyShape()

    rl.DrawRectangleRec(CollisionRects.rect1, rl.BLACK);

    rl.EndDrawing()
}

main :: proc() {
    rl.InitWindow(window_Width, window_Height, "tetris");
    defer rl.CloseWindow()

    initGame();
    initShape();

    for !rl.WindowShouldClose() {
        frame_counter += 1
        drawUpdateFrame()
        // drawUI()
    }
}

