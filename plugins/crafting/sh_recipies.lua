local PLUGIN = PLUGIN

local RECIPE = {}
RECIPE.uid = "example"
RECIPE.name = "A Skull"
RECIPE.category = "Materials"
RECIPE.blueprint = "example"
RECIPE.model = "models/Gibs/HGIBS.mdl"
RECIPE.desc = "A Skull."
--RECIPE.noBlueprint = true
RECIPE.items = {
	["bone"] = 1,
}
RECIPE.result = {
	["skull"] = 2,
}
RECIPES:Register( RECIPE ) 