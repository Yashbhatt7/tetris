package game

import "core:fmt"

import rl"vendor:raylib"
// import la"core:math/linalg"

window_Width : i32 = 1080
window_Height : i32 = 720

Shapes :: enum {
    I,
    L,
    O,
    Z,
    T,
}

RectGrid : rl.Rectangle
customRect : rl.Rectangle

initGame :: proc () {
    RectGrid = {
        width = 30,
        height = 30,
    }

    customRect = {
        x = 500,
        y = 100,
        width = 50,
        height = 50,
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
    if rl.IsKeyPressed(.S) {
        customRect.y += customRect.height
    }

    if rl.IsKeyPressed(.W) {
        customRect.y -= customRect.height
    }

    if rl.IsKeyPressed(.D) {
        customRect.x += customRect.width
    }

    if rl.IsKeyPressed(.A) {
        customRect.x -= customRect.width
    }
}

drawUpdateFrame :: proc() {
    rl.BeginDrawing()
    rl.ClearBackground(rl.RAYWHITE)

    drawRectangleGrid()
    moveMyShape();

    rl.DrawRectangleRec(customRect, rl.SKYBLUE)
    rl.DrawRectangleLinesEx(customRect, 2,  rl.RED)

    rl.EndDrawing()
}

main :: proc() {
    rl.InitWindow(window_Width, window_Height, "tetris");
    defer rl.CloseWindow()

    initGame();

    for !rl.WindowShouldClose() {
        drawUpdateFrame()
        // drawUI()
    }
}

