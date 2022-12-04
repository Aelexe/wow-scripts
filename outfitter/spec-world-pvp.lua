-- $EVENTS PLAYER_ENTERING_WORLD ACTIVE_TALENT_GROUP_CHANGED PLAYER_FLAGS_CHANGED
-- $DESC Equips the outfit when a certain spec with warmode enabled.
local function IsWorldPvp()
    local inInstance, instanceType = IsInInstance()
    if inInstance then
		return false
    else
        local talents = C_SpecializationInfo.GetAllSelectedPvpTalentIDs()
        for _, pvptalent in pairs(talents) do
            local spellID = select(6, GetPvpTalentInfoByID(pvptalent))
            if IsPlayerSpell(spellID) then
                return true
            end
        end
    end
end

local specialization = GetSpecialization()
local isPvp = IsWorldPvp()

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