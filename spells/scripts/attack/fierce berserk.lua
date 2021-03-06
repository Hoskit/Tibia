local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)

local area = createCombatArea(AREA_SQUARE1X1)
combat:setArea(area)

function onGetFormulaValues(player, skill, attack, factor)
	local skillTotal, levelTotal = skill * attack, player:getLevel()
	return -(((skillTotal * 0.10) + 130) + (levelTotal*2)), -(((skillTotal * 0.15) + 270) + (levelTotal*2))
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
