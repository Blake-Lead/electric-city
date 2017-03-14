-- color.lua
-- pico8 colors.

local color = {}

color.BLACK      = {   0,   0,   0, 255 }
color.BLUE       = {  41, 173, 255, 255 }
color.BROWN      = { 171,  82,  54, 255 }
color.DARKBLUE   = {  29,  43,  83, 255 }
color.DARKGRAY   = {  95,  87,  79, 255 }
color.DARKGREEN  = {   0, 135,  81, 255 }
color.DARKPURPLE = { 126,  37,  83, 255 }
color.GREEN      = {   0, 228,  54, 255 }
color.INDIGO     = { 131, 118, 156, 255 }
color.LIGHTGRAY  = { 194, 195, 199, 255 }
color.ORANGE     = { 255, 163,   0, 255 }
color.PEACH      = { 255, 204, 170, 255 }
color.PINK       = { 255, 119, 168, 255 }
color.RED        = { 255,   0,  77, 255 }
color.WHITE      = { 255, 241, 232, 255 }
color.YELLOW     = { 255, 236,  39, 255 }

function color.black(alpha)      local a = alpha or 255; return {   0,   0,   0, a } end
function color.blue(alpha)       local a = alpha or 255; return {  41, 173, 255, a } end
function color.brown(alpha)      local a = alpha or 255; return { 171,  82,  54, a } end
function color.darkblue(alpha)   local a = alpha or 255; return {  29,  43,  83, a } end
function color.darkgray(alpha)   local a = alpha or 255; return {  95,  87,  79, a } end
function color.darkgreen(alpha)  local a = alpha or 255; return {   0, 135,  81, a } end
function color.darkpurple(alpha) local a = alpha or 255; return { 126,  37,  83, a } end
function color.green(alpha)      local a = alpha or 255; return {   0, 228,  54, a } end
function color.indigo(alpha)     local a = alpha or 255; return { 131, 118, 156, a } end
function color.lightgray(alpha)  local a = alpha or 255; return { 194, 195, 199, a } end
function color.orange(alpha)     local a = alpha or 255; return { 255, 163,   0, a } end
function color.peach(alpha)      local a = alpha or 255; return { 255, 204, 170, a } end
function color.pink(alpha)       local a = alpha or 255; return { 255, 119, 168, a } end
function color.red(alpha)        local a = alpha or 255; return { 255,   0,  77, a } end
function color.white(alpha)      local a = alpha or 255; return { 255, 241, 232, a } end
function color.yellow(alpha)     local a = alpha or 255; return { 255, 236,  39, a } end

function color.blackd(dark)      local d = dark or 0; return {   0 + d,   0 + d,   0 + d, 255 } end
function color.blued(dark)       local d = dark or 0; return {  41 + d, 173 + d, 255 + d, 255 } end
function color.brownd(dark)      local d = dark or 0; return { 171 + d,  82 + d,  54 + d, 255 } end
function color.darkblued(dark)   local d = dark or 0; return {  29 + d,  43 + d,  83 + d, 255 } end
function color.darkgrayd(dark)   local d = dark or 0; return {  95 + d,  87 + d,  79 + d, 255 } end
function color.darkgreend(dark)  local d = dark or 0; return {   0 + d, 135 + d,  81 + d, 255 } end
function color.darkpurpled(dark) local d = dark or 0; return { 126 + d,  37 + d,  83 + d, 255 } end
function color.greend(dark)      local d = dark or 0; return {   0 + d, 228 + d,  54 + d, 255 } end
function color.indigod(dark)     local d = dark or 0; return { 131 + d, 118 + d, 156 + d, 255 } end
function color.lightgrayd(dark)  local d = dark or 0; return { 194 + d, 195 + d, 199 + d, 255 } end
function color.oranged(dark)     local d = dark or 0; return { 255 + d, 163 + d,   0 + d, 255 } end
function color.peachd(dark)      local d = dark or 0; return { 255 + d, 204 + d, 170 + d, 255 } end
function color.pinkd(dark)       local d = dark or 0; return { 255 + d, 119 + d, 168 + d, 255 } end
function color.redd(dark)        local d = dark or 0; return { 255 + d,   0 + d,  77 + d, 255 } end
function color.whited(dark)      local d = dark or 0; return { 255 + d, 241 + d, 232 + d, 255 } end
function color.yellowd(dark)     local d = dark or 0; return { 255 + d, 236 + d,  39 + d, 255 } end

return color
