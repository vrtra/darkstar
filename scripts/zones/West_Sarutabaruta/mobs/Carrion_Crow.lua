-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Carrion Crow
-- Note: PH for Nunyenunc
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/West_Sarutabaruta/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,28,2);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local mobID = mob:getID();

    if (Nunyenunc_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Nunyenunc");
        if (ToD <= os.time() and GetMobAction(Nunyenunc) == 0) then
            if (math.random(1,10) == 5) then
                UpdateNMSpawnPoint(Nunyenunc);
                GetMobByID(Nunyenunc):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Nunyenunc", mobID);
                DisallowRespawn(mobID, true);
            end
        end
    end

end;
