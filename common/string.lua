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