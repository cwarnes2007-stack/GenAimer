-- GenAimer GitHub launcher.
-- Review the repository source before running a remote loadstring.

local sourceUrl = "https://raw.githubusercontent.com/cwarnes2007-stack/GenAimer/main/GenAimer.lua"
local source = game:HttpGet(sourceUrl)
local compiler = loadstring

assert(type(compiler) == "function", "GenAimer requires loadstring support")

local chunk, compileError = compiler(source)
assert(type(chunk) == "function", "GenAimer compile failed: " .. tostring(compileError))

return chunk()
