class Canvas
    ->
        canvas = $ \canvas .get 0
        @scroll = 0
        @ctx = canvas.get-context \2d
        @ctx.moz-image-smoothing-enabled = false;
        @ctx.webkit-image-smoothing-enabled = false;

        @sprites =
            \player0r : new Sprite(0, 0, 14, 16)
            \player0l : new Sprite(1, 0, 14, 16)
            \player1r : new Sprite(2, 0, 14, 16)
            \player1l : new Sprite(3, 0, 14, 16)
            \bulletr : new Sprite(0, 1, 7, 3)
            \bulletl : new Sprite(1, 1, 7, 3)
            \* : new Sprite(0, 2)
            \P : new Sprite(1, 2)
            \R : new Sprite(2, 2)
            \D : new Sprite(3, 2)
            \B : new Sprite(0, 3)
            \G : new Sprite(1, 3)
            \= : new Sprite(2, 3)
            \+ : new Sprite(3, 3)
            \F : new Sprite(4, 3)
            \W : new Sprite(5, 3)
            \- : new Sprite(6, 3)

    set-scroll: (dx) ->
        @scroll = dx

    draw-tile: (tile, i, j) ->
        x = i * Tile.size
        y = j * Tile.size

        if @sprites[tile]
            @draw-sprite x, y, tile
            return

        @ctx.fill-style = \black
        @ctx.fill-rect x - @scroll, y, Tile.size, Tile.size

    draw-sprite: (x, y, sprite) ->
        @sprites[sprite].draw @ctx, x - @scroll, y