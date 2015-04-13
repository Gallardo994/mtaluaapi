local category = "string"
local category = registerCategory(category)

-- Removes special symbols from strings
function category.removeUTF(str)
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
function category.generate(len)
  local allowed = {{48,57},{65,90},{97,22}}
  local str = ""
  for i = 1,len do
    local charlist = allowed[math.random(1,3)]
    str = str..string.char(math.random(charlist[1],charlist[2]))
  end
  return str
end

-- Compares 2 strings and returns similarity ratio (0 to 1, float)
function category.similarity(fx, fy)
  local n = string.len(fx)
  local m = string.len(fy)
  local ssnc = 0
  if n > m then
    fx, fy = fy, fx
    n, m = m, n
  end
  for i = n,1,-1 do
    if i <= string.len(fx) then
      for j = 1,n-i+1,1 do
	local pattern = string.sub(fx,j,j+i-1)
	if string.len(pattern) == 0 then break end
	local found_at = string.find(fy,pattern)
	if not (found_at == nil) then
	  ssnc = ssnc + (2*i)^2
	  fx = string.sub(fx,0,j-1)..string.sub(fx, j+i)
	  fy = string.sub(fy,0,found_at-1)..string.sub(fy,found_at+i)
	  break
	end
      end
    end
  end
  return (ssnc/((n+m)^2))^(1/2)
end

-- Shrinks text like "sssssssssdddddddffff" to "sdf"
function category.norepeat(text)
  local vals = { }
  local prevl = nil
  for v in text:gmatch "." do
    if not (v == prevl) then
      table.insert(vals,v)
    end
    prevl = v
  end
  return table.concat(vals,"")
end

-- Returns a table of unique symbols in a string
function category.uniqueSymbols(text)
  local vals = { }
  local used = { }
  for v in text:gmatch "." do
    local v = string.lower(v)
    if not used[v] and not (v == " ") then
      table.insert(vals,v)
      used[v] = true
    end
  end
  return vals
end

-- Gets caps lock percentage from a string
function category.capsPercentage(text)
  local up = 0
  local down = 0
  local text = string.gsub(text," ","")
  for v in text:gmatch "." do
    local d = string.lower(v)
    if v == string.lower(v) then
      down = down + 1
    elseif v == string.upper(v) then
      up = up + 1
    end
  end
  return up/(down+up)
end