local category = "math"
local category = registerCategory(category)

-- Transforms rgb to hsv model
function category.rgb2hsv(r,g,b)
  local r,g,b = r/255, g/255, b/255
  local max,min = math.max(r,g,b),math.min(r,g,b)
  local h, s 
  local v = max
  local d = max - min
  s = max == 0 and 0 or d/max
  if max == min then 
    h = 0
  elseif max == r then 
    h = (g - b) / d + (g < b and 6 or 0)
  elseif max == g then 
    h = (b - r) / d + 2
  elseif max == b then 
    h = (r - g) / d + 4
  end
  h = h/6
  return h, s, v
end

-- Transforms hsv to rgb model
function category.hsv2rgb(h,s,v)
  local r, g, b
  local i = math.floor(h * 6)
  local f = h * 6 - i
  local p = v * (1 - s)
  local q = v * (1 - f * s)
  local t = v * (1 - (1 - f) * s)
  local switch = i % 6
  if switch == 0 then
    r = v g = t b = p
  elseif switch == 1 then
    r = q g = v b = p
  elseif switch == 2 then
    r = p g = v b = t
  elseif switch == 3 then
    r = p g = q b = v
  elseif switch == 4 then
    r = t g = p b = v
  elseif switch == 5 then
    r = v g = p b = q
  end
  return math.floor(r*255), math.floor(g*255), math.floor(b*255)
end

-- Transforms rgb to hex model
function category.rgb2hex(r,g,b,a)
  if a then
    return string.format("#%.2X%.2X%.2X%.2X",r,g,b,a)
  else
    return string.format("#%.2X%.2X%.2X",r,g,b)
  end
end

-- Transforms hex to rgb model
function category.hex2rgb(hex)
  local hex = hex:gsub("#","")
  return tonumber("0x"..hex:sub(1,2)),tonumber("0x"..hex:sub(3,4)),tonumber("0x"..hex:sub(5,6))
end

-- Does math.ceil or math.floor depending on the number
function category.round(number)
  return math.ceil(number-0.5)
end

-- Gets percent of a number
function category.percent(number,maxvalue)
  return number/maxvalue
end

-- Returns 2 values representing a part of their sum
function category.relate(number,number2)
  return number/(number+number2),number2/(number+number2)
end