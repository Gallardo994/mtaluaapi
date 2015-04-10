local category = "logic"
registerCategory(category)

function GLOBAL[category].ifelse(c,t,f)
  if c then return t else return f
end