local category = "string"
registerCategory(category)

-- Removes special symbols from strings
function GLOBAL[category].removeUTF(str)
  local asciiStr = ""
  for i=1,utfLen (str) do
    local c = utfSub(str,i,i)
    if not bitTest(0x80,string.byte(c)) then
      asciiStr = asciiStr..c
    end
  end
  return asciiStr
end

-- Generates random string of a specified length
function GLOBAL[category].generate(len)
  local allowed = {{48,57},{65,90},{97, 22 }}
  local str = ""
  for i = 1, len do
    local charlist = allowed[math.random(1,3)]
    str = str..string.char(math.random(charlist[1],charlist[2]))
  end
  return str
end