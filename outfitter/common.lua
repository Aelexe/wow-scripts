local function IsPvp()
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

local function IsInstancePvp()
	local inInstance, instanceType = IsInInstance()
    if inInstance and (instanceType == "pvp" or instanceType == "arena") then
        return true
    else
        return false
    end
end