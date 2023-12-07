---@meta nonrs.screen

-- ----------------------------------------------------------------------------

---@alias nonrs.screen.AAState
---| 1 # on
---| 0 # off

---@alias norns.Screen.CapStyle
---| "butt" # default cap style
---| "round"
---| "square"

---@alias norns.Screen.JoinStyle
---| "miter" # default join style
---| "round"
---| "bevel"

---@alias norns.Screen.FontIndex
---| 1 # 04B_03 (norns default)
---| 2 # ALEPH
---| 3 # Roboto Thin
---| 4 # Roboto Light
---| 5 # Roboto Regular
---| 6 # Roboto Medium
---| 7 # Roboto Bold
---| 8 # Roboto Black
---| 9 # Roboto Thin Italic
---| 10 # Roboto Light Italic
---| 11 # Roboto Italic
---| 12 # Roboto Medium Italic
---| 13 # Roboto Bold Italic
---| 14 # Roboto Black Italic
---| 15 # VeraBd
---| 16 # VeraBI
---| 17 # VeraIt
---| 18 # VeraMoBd
---| 19 # VeraMoBI
---| 20 # VeraMoIt
---| 21 # VeraMono
---| 22 # VeraSeBd
---| 23 # VeraSe
---| 24 # Vera
---| 25 # bmp/tom-thumb
---| 26 # creep
---| 27 # ctrld-fixed-10b
---| 28 # ctrld-fixed-10r
---| 29 # ctrld-fixed-13b
---| 30 # ctrld-fixed-13b-i
---| 31 # ctrld-fixed-13r
---| 32 # ctrld-fixed-13r-i
---| 33 # ctrld-fixed-16b
---| 34 # ctrld-fixed-16b-i
---| 35 # ctrld-fixed-16r
---| 36 # ctrld-fixed-16r-i
---| 37 # scientifica-11
---| 38 # scientificaBold-11
---| 39 # scientificaItalic-11
---| 40 # ter-u12b
---| 41 # ter-u12n
---| 42 # ter-u14b
---| 43 # ter-u14n
---| 44 # ter-u14v
---| 45 # ter-u16b
---| 46 # ter-u16n
---| 47 # ter-u16v
---| 48 # ter-u18b
---| 49 # ter-u18n
---| 50 # ter-u20b
---| 51 # ter-u20n
---| 52 # ter-u22b
---| 53 # ter-u22n
---| 54 # ter-u24b
---| 55 # ter-u24n
---| 56 # ter-u28b
---| 57 # ter-u28n
---| 58 # ter-u32b
---| 59 # ter-u32n
---| 60 # unscii-16-full.pcf
---| 61 # unscii-16.pcf
---| 62 # unscii-8-alt.pcf
---| 63 # unscii-8-fantasy.pcf
---| 64 # unscii-8-mcr.pcf
---| 65 # unscii-8.pcf
---| 66 # unscii-8-tall.pcf
---| 67 # unscii-8-thin.pcf

---@alias norns.Screen.BlendMode
---| 0 # Over (default)
---| "over" # (default)
---| 1 # XOR: clears any overlapping pixels.
---| "xor" # clears any overlapping pixels.
---| 2 # Add: adds together the alpha (brightness) of overlapping pixels.
---| "add" # adds together the alpha (brightness) of overlapping pixels.
---| 3 # Multiply: multiplies the colors of overlapping pixels, the result is always darker than the two inputs.
---| "multiply" # multiplies the colors of overlapping pixels, the result is always darker than the two inputs.
---| 4 # Screen: the colors of overlapping pixels are complemented, multiplied, then their product is complimented. the result is always lighter than the two inputs.
---| "screen" # the colors of overlapping pixels are complemented, multiplied, then their product is complimented. the result is always lighter than the two inputs.
---| 5 # Overlay: multiplies colors if destination pixel level is >= 8, screens colors if destination pixel level is < 8.
---| "overlay" # multiplies colors if destination pixel level is >= 8, screens colors if destination pixel level is < 8.
---| 6 # Darken: keeps the darker value of overlapping pixels.
---| "darken" # keeps the darker value of overlapping pixels.
---| 7 # Lighten: keeps the lighter value of overlapping pixels.
---| "lighten" # keeps the lighter value of overlapping pixels.
---| 8 # Color_Dodge: brightens pixels being drawn over.
---| "color_dodge" # brightens pixels being drawn over.
---| 9 # Color_Burn: darkens pixels being drawn over.
---| "color_burn" # darkens pixels being drawn over.
---| 10 # Hard_Light: multiplies colors if source pixel level is >= 8, screens colors if source pixel level is < 8.
---| "hard_light" # multiplies colors if source pixel level is >= 8, screens colors if source pixel level is < 8.
---| 11 # Soft_Light: uses Darken or Lighten depending on the color of the source pixel.
---| "soft_light" # uses Darken or Lighten depending on the color of the source pixel.
---| 12 # Difference: the result is the absolute value of the difference of the destination and source pixels.
---| "difference" # the result is the absolute value of the difference of the destination and source pixels.
---| 13 # Exclusion: similar to Difference, but has lower contrast.
---| "exclusion" # similar to Difference, but has lower contrast.

-- ----------------------------------------------------------------------------

-- Screen class provides API to draw on screen with path or image. It's possible
-- to update only portion of the screen.
---@class norns.Screen
screen = {}

-- ----------------------------------------------------------------------------
-- screen operation

-- ping restarts screen savet timer.
function screen.ping()
end

-- clear clears the screen.
function screen.clear() end

-- update_default copies  buffer to screen.
function screen.update_default() end

-- update_low_battery is used to update screen in low batter mode.
function screen.update_low_battery() end

-- aa enables or disables anti-aliasing.
---@param state nonrs.screen.AAState  # 1 means on, 0 means off
function screen.aa(state) end

-- rotate rotates the screen.
---@param radian number
function screen.rotate(radian) end

-- peek gets specified region of screen in a buffer.
---@param x number
---@param y number
---@param w number
---@param h number
---@return userdata screen_buffer
function screen.peek(x, y, w, h) end

-- poke set a specifiec region of screen with a buffer.
---@param x number
---@param y number
---@param w number
---@param h number
---@param s userdata
function screen.poke(x, y, w, h, s) end

-- ----------------------------------------------------------------------------
-- image operation

-- export_screenshot saves screen shot with given name.
---@param filename string
function screen.export_screenshot(filename) end

-- display_png displays image at absolute coordinate.
---@param filename string
---@param x number
---@param y number
function screen.display_png(filename, x, y) end

-- load_png loads an image into image buffer.
---@param filename string
function screen.load_png(filename) end

-- create_image creates an image buffer.
---@param width number
---@param height number
---@return lightuserdata img_buffer
function screen.create_image(width, height) end

-- display_image displays an image buffer at given absolute coordinate.
---@param image lightuserdata
---@param x number
---@param y number
function screen.display_image(image, x, y) end

-- display_image_region displays a portion of image.
---@param image lightuserdata
---@param left number
---@param top number
---@param width number
---@param height number
---@param x number
---@param y number
function screen.display_image_region(image, left, top, width, height, x, y) end

-- draw_to draws to an image buffer instead of screen with a closure.
---@param image lightuserdata
---@param func fun()
function screen.draw_to(image, func) end

-- ----------------------------------------------------------------------------
-- cursor setup

-- save push current state of cursor onto an internal stack, this state gets
-- recovered when restore gets called.
function screen.save() end

-- restore pop a cursor state from internal stack. Recovered to a state that was
-- saved before.
function screen.restore() end

-- level sets current gray scale level for drawing.
---@param value integer # gray scale value in [0, 15]
function screen.level(value) end

-- line_width sets line width used when stroking a path.
---@param w integer
function screen.line_width(w) end

-- line_cap sets path line cap style.
---@param style integer
function screen.line_cap(style) end

-- line_join sets path line join style.
---@param style integer
function screen.line_join(style) end

-- miter_limit sets miter limit
---@param limit integer
function screen.miter_limit(limit) end

-- font_face sets font face for cursor.
---@param index norns.Screen.FontIndex
function screen.font_face(index) end

-- font_size sets font size for cursor.
---@param size integer
function screen.font_size(size) end

-- blend_mode sets blen mode of cursor.
---@param index norns.Screen.BlendMode
function screen.blend_mode(index) end

-- translate moves origin of cursor.
---@param x number
---@param y number
function screen.translate(x, y) end

-- ----------------------------------------------------------------------------
-- path drawing

-- move moves to give absolute coordinate.
---@param x number
---@param y number
function screen.move(x, y) end

-- move_rel move to a relative coordinate.
---@param x number
---@param y number
function screen.move_rel(x, y) end

-- pixel draws a single pixel, requires fill call on cursor afterwards.
---@param x integer
---@param y integer
function screen.pixel(x, y) end

-- line draws a line path from current position to given absolute coordinate.
-- Cursor stays at end position after drawing.
---@param x number
---@param y number
function screen.line(x, y) end

-- line_rel draws a line path from current position to given relative coordinate.
-- Cursor stays at end position after drawing.
---@param x number
---@param y number
function screen.line_rel(x, y) end

-- arc draws a portion of circle with given absolute coordinate as center.
---@param x number
---@param y number
---@param r number
---@param angle1 number
---@param angle2 number
function screen.arc(x, y, r, angle1, angle2) end

-- circle draw a circle path centered as give absolute coordinate.
---@param x number
---@param y number
---@param r number
function screen.circle(x, y, r) end

-- rect draws a rectangle path at given absolute coordinate.
---@param x number
---@param y number
---@param w number
---@param h number
function screen.rect(x, y, w, h) end

-- curve draws a cubic Bezier spline starts from current point, ends at a absolute
-- coordinate, with two control point.
---@param x1 number # x of 1st control point
---@param y1 number # y of 1st control point
---@param x2 number # x of 2nd control point
---@param y2 number # y of 2nd control point
---@param x3 number # x of end point
---@param y3 number # y of end point
function screen.curve(x1, y1, x2, y2, x3, y3) end

-- curve_rel draws a cubic Bezier spline with two control point. All points'
-- coordinates are given relative to current position.
---@param x1 number # x of 1st control point
---@param y1 number # y of 1st control point
---@param x2 number # x of 2nd control point
---@param y2 number # y of 2nd control point
---@param x3 number # x of end point
---@param y3 number # y of end point
function screen.curve_rel(x1, y1, x2, y2, x3, y3) end

-- close closes current path, drawing a straight path from current positon to
-- the beginning of current path.
function screen.close() end

-- stroke draws outline of  current path on screen.
-- After stroke, current path is cleared, all 'relative' operation won't work.
function screen.stroke() end

-- fill fills internal part of current path.
-- After fill, current  path is cleared, all 'relative' operation won't work.
function screen.fill() end

-- ----------------------------------------------------------------------------
-- text operation

-- text draws left aligned text on screen.
---@param str string
function screen.text(str) end

-- text_trim draws left aligned text and trim it to given width.
---@param str string
---@param w number
function screen.text_trim(str, w) end

-- text_rotate draws rotated left aligned text.
---@param x number
---@param y number
---@param str string
---@param degrees number
function screen.text_rotate(x, y, str, degrees) end

-- text_right draws right aligned text.
---@param str string
function screen.text_right(str) end

-- text_center draws center aligned text
---@param str string
function screen.text_center(str) end

-- text_center_rotate draws rorated center aligned text
---@param str string
function screen.text_center_rotate(str) end

-- text_extnets calculates text's width and height on screen with current font
-- and cursor setup.
---@param str string
function screen.text_extnets(str) end
