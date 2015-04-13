local category = "audio"
local category = registerCategory(category)

category.filepath = "client/sfx"
category.audiofiles = {
  error = "error.ogg",
  notification = "notification.ogg",
  ring = "ring.ogg",
  success = "success.ogg",
  warning = "warning.ogg",
}
category.currentaudio = false

function category.playAmbience(mode,overlay)
  local file = category.filepath.."/"..tostring(category.audiofiles[mode])
  if not fileExists(file) then return end
  if not overlay then
    stopAmbience()
  end
  category.currentaudio = playSound(file)
end

function category.stopAmbience()
  if isElement(category.currentaudio) then
    destroyElement(category.currentaudio)
  end
end
