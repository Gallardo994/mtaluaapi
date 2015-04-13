local category = "audio"
registerCategory(category)

GLOBAL[category].filepath = "client/sfx"
GLOBAL[category].audiofiles = {
  error = "error.ogg",
  notification = "notification.ogg",
  ring = "ring.ogg",
  success = "success.ogg",
  warning = "warning.ogg",
}
GLOBAL[category].currentaudio = false

function GLOBAL[category].playAmbience(mode,overlay)
  local file = GLOBAL[category].filepath.."/"..tostring(GLOBAL[category].audiofiles[mode])
  if not fileExists(file) then return end
  if not overlay then
    stopAmbience()
  end
  GLOBAL[category].currentaudio = playSound(file)
end
addEvent("playAmbience",true)
addEventHandler("playAmbience",ROOTELEMENT,playAmbience)

function GLOBAL[category].stopAmbience()
  if isElement(GLOBAL[category].currentaudio) then
    destroyElement(GLOBAL[category].currentaudio)
  end
end
