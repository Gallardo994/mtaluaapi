--
--
-- Gallardo's multicode library. Licenced under GPL
-- 
-- The resource distributes "AS IS": no warranty is applied 
--
--

-- Main categories
GLOBAL = { }

-- Use from other resources as:
-- local maths = exports['api']:getExportClass('math')
-- Then you can execute functions like:
-- local val = maths.round(10.4)
function getExportClass(class)
  return GLOBAL[class] or false
end

-- Use from other resources as:
-- local global = exports['api']:getExportGlobal()
-- It will get the entire library, so you can use the functions as they are
-- local val = global['math'].round(10.4)
function getExportGlobal()
  return GLOBAL
end

-- This function should be used in order to make a category in GLOBAL class
function registerCategory(category)
  if GLOBAL[category] then return GLOBAL[category] end
  GLOBAL[category] = { }
  return GLOBAL[category]
end