package game

import "core:fmt"
import rl"vendor:raylib"
// import la"core:math/linalg"

window_Width : i32 = 1080
window_Height : i32 = 900

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

ActiveShapeGridPos : struct {
    rect1_pos : [2]i32,
    rect2_pos : [2]i32,
    rect3_pos : [2]i32,
    rect4_pos : [2]i32,
}

FinalShapeGridPos : struct {
    rect1_pos : [2]i32,
    rect2_pos : [2]i32,
    rect3_pos : [2]i32,
    rect4_pos : [2]i32,
}

GRID_HEIGHT :: 20
GRID_WIDTH :: 10

Grid :: struct {
    grid_rect : rl.Rectangle,
    filled : bool,
}

GridRect : [GRID_HEIGHT][GRID_WIDTH]Grid

all_true : [10]bool = { true, true, true, true, true, true, true, true, true, true }
result_bools : [10]bool

gameIsOver := false
RectGrid : rl.Rectangle

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
            ActiveShapeGridPos.rect1_pos.x = 0
            ActiveShapeGridPos.rect1_pos.y = 6

            ActiveShapeGridPos.rect2_pos.x = 1
            ActiveShapeGridPos.rect2_pos.y = 6

            ActiveShapeGridPos.rect3_pos.x = 2
            ActiveShapeGridPos.rect3_pos.y = 6

            ActiveShapeGridPos.rect4_pos.x = 3
            ActiveShapeGridPos.rect4_pos.y = 6

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
            ActiveShapeGridPos.rect1_pos.x = 0
            ActiveShapeGridPos.rect1_pos.y = 6

            ActiveShapeGridPos.rect2_pos.x = 1
            ActiveShapeGridPos.rect2_pos.y = 6

            ActiveShapeGridPos.rect3_pos.x = 2
            ActiveShapeGridPos.rect3_pos.y = 6

            ActiveShapeGridPos.rect4_pos.x = 2
            ActiveShapeGridPos.rect4_pos.y = 7

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
            ActiveShapeGridPos.rect1_pos.x = 0
            ActiveShapeGridPos.rect1_pos.y = 6

            ActiveShapeGridPos.rect2_pos.x = 0
            ActiveShapeGridPos.rect2_pos.y = 7

            ActiveShapeGridPos.rect3_pos.x = 1
            ActiveShapeGridPos.rect3_pos.y = 6

            ActiveShapeGridPos.rect4_pos.x = 1
            ActiveShapeGridPos.rect4_pos.y = 7

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
            ActiveShapeGridPos.rect1_pos.x = 0
            ActiveShapeGridPos.rect1_pos.y = 6

            ActiveShapeGridPos.rect2_pos.x = 0
            ActiveShapeGridPos.rect2_pos.y = 7

            ActiveShapeGridPos.rect3_pos.x = 1
            ActiveShapeGridPos.rect3_pos.y = 7

            ActiveShapeGridPos.rect4_pos.x = 1
            ActiveShapeGridPos.rect4_pos.y = 8

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
            ActiveShapeGridPos.rect1_pos.x = 0
            ActiveShapeGridPos.rect1_pos.y = 6

            ActiveShapeGridPos.rect2_pos.x = 0
            ActiveShapeGridPos.rect2_pos.y = 7

            ActiveShapeGridPos.rect3_pos.x = 0
            ActiveShapeGridPos.rect3_pos.y = 8

            ActiveShapeGridPos.rect4_pos.x = 1
            ActiveShapeGridPos.rect4_pos.y = 7

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

drawGrid :: proc() {
    startX : f32 = 320
    startY : f32 = 100

    RectGrid.y = startY
    for i := 0; i < GRID_HEIGHT; i += 1 {
        RectGrid.x = startX
        for j := 0; j < GRID_WIDTH; j += 1 {
            rl.DrawRectangleLinesEx(RectGrid, 1, rl.RED)
            RectGrid.x += RectGrid.width
            rl.DrawRectangleRec(GridRect[i][j].grid_rect, rl.BLUE)
        }
        RectGrid.y += RectGrid.height
    }
}

drawGridRectLines :: proc() {
    for i := 0; i < GRID_HEIGHT; i += 1 {
        for j := 0; j < GRID_WIDTH; j += 1 {
            rl.DrawRectangleLinesEx(GridRect[i][j].grid_rect, 2, rl.BLUE)
        }
    }
}

initGrid:: proc() {
    GridRect[FinalShapeGridPos.rect1_pos.x][FinalShapeGridPos.rect1_pos.y].grid_rect = {
        x = ActiveShape.rect1.x,
        y = ActiveShape.rect1.y,
        width = ActiveShape.rect1.width,
        height = ActiveShape.rect1.height,
    }
    GridRect[FinalShapeGridPos.rect1_pos.x][FinalShapeGridPos.rect1_pos.y].filled = true

    GridRect[FinalShapeGridPos.rect2_pos.x][FinalShapeGridPos.rect2_pos.y].grid_rect = {
        x = ActiveShape.rect2.x,
        y = ActiveShape.rect2.y,
        width = ActiveShape.rect2.width,
        height = ActiveShape.rect2.height,
    }
    GridRect[FinalShapeGridPos.rect2_pos.x][FinalShapeGridPos.rect2_pos.y].filled = true

    GridRect[FinalShapeGridPos.rect3_pos.x][FinalShapeGridPos.rect3_pos.y].grid_rect = {
        x = ActiveShape.rect3.x,
        y = ActiveShape.rect3.y,
        width = ActiveShape.rect3.width,
        height = ActiveShape.rect3.height,
    }
    GridRect[FinalShapeGridPos.rect3_pos.x][FinalShapeGridPos.rect3_pos.y].filled = true

    GridRect[FinalShapeGridPos.rect4_pos.x][FinalShapeGridPos.rect4_pos.y].grid_rect = {
        x = ActiveShape.rect4.x,
        y = ActiveShape.rect4.y,
        width = ActiveShape.rect4.width,
        height = ActiveShape.rect4.height,
    }
    GridRect[FinalShapeGridPos.rect4_pos.x][FinalShapeGridPos.rect4_pos.y].filled = true
}

checkGridRectCollisions :: proc() {
    for i := 0; i < GRID_HEIGHT; i += 1 {
        for j := 0; j < GRID_WIDTH; j += 1 {
            collision1 := rl.CheckCollisionRecs(ActiveShape.rect1^, GridRect[i][j].grid_rect)
            collision2 := rl.CheckCollisionRecs(ActiveShape.rect2^, GridRect[i][j].grid_rect)
            collision3 := rl.CheckCollisionRecs(ActiveShape.rect3^, GridRect[i][j].grid_rect)
            collision4 := rl.CheckCollisionRecs(ActiveShape.rect4^, GridRect[i][j].grid_rect)

            if collision1 || collision2 || collision3 || collision4 {
                ActiveShape.rect1.y -= ActiveShape.rect1.width
                ActiveShape.rect2.y -= ActiveShape.rect2.width
                ActiveShape.rect3.y -= ActiveShape.rect3.width
                ActiveShape.rect4.y -= ActiveShape.rect4.width

                ActiveShapeGridPos.rect1_pos.x -= 1
                ActiveShapeGridPos.rect2_pos.x -= 1
                ActiveShapeGridPos.rect3_pos.x -= 1
                ActiveShapeGridPos.rect4_pos.x -= 1

                FinalShapeGridPos = ActiveShapeGridPos

                initGrid();
                ClearHzLine();

                initShape();
                setActiveShape()
            }
        }
    }
}

CheckHzLineRect1 :: proc() -> bool {
    for cell in GridRect[FinalShapeGridPos.rect1_pos.x] {
        if !cell.filled {
            return false
        }
    }
    return true
}
CheckHzLineRect2 :: proc() -> bool {
    for cell in GridRect[FinalShapeGridPos.rect2_pos.x] {
        if !cell.filled {
            return false
        }
    }
    return true
}
CheckHzLineRect3 :: proc() -> bool {
    for cell in GridRect[FinalShapeGridPos.rect3_pos.x] {
        if !cell.filled {
            return false
        }
    }
    return true
}
CheckHzLineRect4 :: proc() -> bool {
    for cell in GridRect[FinalShapeGridPos.rect4_pos.x] {
        if !cell.filled {
            return false
        }
    }
    return true
}

MoveDown :: proc(pos_x : i32) {
    for i := 0; i < cast(int)pos_x; i += 1 {
        for j := 0; j < GRID_WIDTH; j += 1 {
            if GridRect[i][j].filled {
                // GridRect[i + 1][j].grid_rect = GridRect[i][j].grid_rect
                GridRect[i][j].grid_rect.y += 30
                GridRect[i + 1][j].grid_rect = GridRect[i][j].grid_rect
                GridRect[i + 1][j].filled = true

                // GridRect[i][j].grid_rect = {}
                GridRect[i][j].grid_rect = {}
                GridRect[i][j].filled = false
            }
        }
    }
}


ClearHzLine :: proc() {
    // fmt.println
    if CheckHzLineRect1() {
        GridRect[FinalShapeGridPos.rect1_pos.x] = {}
        // number_of_hz_line_destroyed += 1
        if FinalShapeGridPos.rect1_pos.x < 19 {
            MoveDown(FinalShapeGridPos.rect1_pos.x)
        }
    }

    if CheckHzLineRect2() {
        GridRect[FinalShapeGridPos.rect2_pos.x] = {}
        if FinalShapeGridPos.rect2_pos.x < 19 {
            MoveDown(FinalShapeGridPos.rect2_pos.x)
        }
    }

    if CheckHzLineRect3() {
        GridRect[FinalShapeGridPos.rect3_pos.x] = {}
        if FinalShapeGridPos.rect3_pos.x < 19 {
            MoveDown(FinalShapeGridPos.rect3_pos.x)
        }
    }

    if CheckHzLineRect4() {
        GridRect[FinalShapeGridPos.rect4_pos.x] = {}
        if FinalShapeGridPos.rect4_pos.x < 19 {
            MoveDown(FinalShapeGridPos.rect4_pos.x)
        }
    }
}

moveAndSetShape :: proc() {
    // fall
    collision := rl.CheckCollisionRecs(ActiveShape.rect4^, CollisionRects.rect1)

    if collision {
        ActiveShape.rect1.y -= ActiveShape.rect1.width
        ActiveShape.rect2.y -= ActiveShape.rect2.width
        ActiveShape.rect3.y -= ActiveShape.rect3.width
        ActiveShape.rect4.y -= ActiveShape.rect4.width

        ActiveShapeGridPos.rect1_pos.x -= 1
        ActiveShapeGridPos.rect2_pos.x -= 1
        ActiveShapeGridPos.rect3_pos.x -= 1
        ActiveShapeGridPos.rect4_pos.x -= 1

        FinalShapeGridPos = ActiveShapeGridPos
        // fmt.println("collision?")

        initGrid();
        ClearHzLine();

        initShape();
        setActiveShape()
    } else {
        if frame_counter % 300 == 0 {
            ActiveShape.rect1^.y += ActiveShape.rect1^.height
            ActiveShape.rect2^.y += ActiveShape.rect2^.height
            ActiveShape.rect3^.y += ActiveShape.rect3^.height
            ActiveShape.rect4^.y += ActiveShape.rect4^.height

            ActiveShapeGridPos.rect1_pos.x += 1
            ActiveShapeGridPos.rect2_pos.x += 1
            ActiveShapeGridPos.rect3_pos.x += 1
            ActiveShapeGridPos.rect4_pos.x += 1
        }
        // movement with A & D
        if rl.IsKeyPressed(.D) {
            ActiveShape.rect1.x += ActiveShape.rect1.width
            ActiveShape.rect2.x += ActiveShape.rect2.width
            ActiveShape.rect3.x += ActiveShape.rect3.width
            ActiveShape.rect4.x += ActiveShape.rect4.width

            ActiveShapeGridPos.rect1_pos.y += 1
            ActiveShapeGridPos.rect2_pos.y += 1
            ActiveShapeGridPos.rect3_pos.y += 1
            ActiveShapeGridPos.rect4_pos.y += 1
        }

        if rl.IsKeyPressed(.A) {
            ActiveShape.rect1.x -= ActiveShape.rect1.width
            ActiveShape.rect2.x -= ActiveShape.rect2.width
            ActiveShape.rect3.x -= ActiveShape.rect3.width
            ActiveShape.rect4.x -= ActiveShape.rect4.width

            ActiveShapeGridPos.rect1_pos.y -= 1
            ActiveShapeGridPos.rect2_pos.y -= 1
            ActiveShapeGridPos.rect3_pos.y -= 1
            ActiveShapeGridPos.rect4_pos.y -= 1
        }
    }
    checkGridRectCollisions()
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

    if !gameIsOver {
        drawGrid()

        drawActiveShape()

        moveAndSetShape()

        rl.DrawRectangleRec(CollisionRects.rect1, rl.BLACK);
        drawGridRectLines()
    }

    rl.EndDrawing()
}

main :: proc() {
    rl.InitWindow(window_Width, window_Height, "tetris");
    defer rl.CloseWindow()

    initGame();

    // initial initialization of the shape
    initShape();
    setActiveShape()

    for !rl.WindowShouldClose() {
        frame_counter += 1
        drawUpdateFrame()
        // drawUI()
    }
}

