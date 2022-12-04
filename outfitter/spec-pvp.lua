-- $EVENTS PLAYER_ENTERING_WORLD ACTIVE_TALENT_GROUP_CHANGED PLAYER_FLAGS_CHANGED
-- $DESC Equips the outfit when a certain spec in an arena or battleground.
local function IsInstancePvp()
	local inInstance, instanceType = IsInInstance()
    if inInstance and (instanceType == "pvp" or instanceType == "arena") then
        return true
    else
        return false
    end
end

local specialization = GetSpecialization()
local isPvp = IsInstancePvp()

if specialization == outfit.previousSpecialization and isPvp == outfit.wasPvp then
    return
end

outfit.specialization = specialization
outfit.wasPvp = isPvp


if specialization == 1 and isPvp then
    equip = true
else
    equip = false
end