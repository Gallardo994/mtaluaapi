local category = "logic"
local category = registerCategory(category)

function category.ifelse(c,t,f)
  if c then return t else return f
end