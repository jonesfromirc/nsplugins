ITEM.name = "Jerrycan"
ITEM.model = Model("models/props_junk/gascan001a.mdl")
ITEM.desc = "A fuel for vehicles. It will fill vehicle's fuel tank when it used."
ITEM.weight = 5
ITEM.functions = {}
ITEM.functions.Use = {
	menuOnly = true,
	alias = "Fill Vehicle",
	icon = "icon16/asterisk_yellow.png",
	onRun = function(item)
		if (SERVER) then
			local client = item.player
			local dat = {
				start = client:GetShootPos(),
				endpos = client:GetShootPos() + client:GetAimVector() * 72,
				filter = client
			}
			local trace = util.TraceLine(dat)
			if trace.Entity:IsValid() then
				if trace.Entity:IsVehicle() then
					local snd = CreateSound(  trace.Entity, "ambient/water/water_flow_loop1.wav" )
					snd:Play()
					client:Freeze( true )
					timer.Simple( 5, function()
						snd:Stop()
						client:Freeze( false )
					end)
					trace.Entity.fuel = 100
				else
					return false
				end
			else
				return false
			end		
		end
	end
}