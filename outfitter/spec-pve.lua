-- $EVENTS PLAYER_ENTERING_WORLD ACTIVE_TALENT_GROUP_CHANGED PLAYER_FLAGS_CHANGED
-- $DESC Equips the outfit when a certain spec with warmode disabled..
local function isPvp()
    local inInstance, instanceType = IsInInstance()
    if inInstance and (instanceType == "pvp" or instanceType == "arena") then
        return true
    elseif inInstance and (instanceType == "party" or instanceType == "raid" or instanceType == "scenario") then
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
local isPvp = isPvp()

if specialization == outfit.previousSpecialization and isPvp == outfit.wasPvp then
    return
end

outfit.specialization = specialization
outfit.wasPvp = isPvp


if specialization == 1 and not isPvp then
    equip = true
else
    equip = false
end