class "TempDec"

function SetTemplate(args)
	local splittedText = args.text:split ( " " )	
        if ( splittedText [ 1 ] == "/tmp" ) then
			if args.player:GetState() ~= PlayerState.InVehicle then return end
				v = args.player:GetVehicle()	
				vtm = tostring(splittedText [ 2 ])
				vcl = tostring(v:GetColors())		
				local vc1 , vc2 = v:GetColors()
				
				if splittedText [ 2 ] == nil then
					vtm = " "
				end
			
				local spawnArgs = {}
				spawnArgs.position = args.player:GetPosition()
				spawnArgs.angle = args.player:GetAngle()
				spawnArgs.model_id = v:GetModelId()
				spawnArgs.world = args.player:GetWorld()
				spawnArgs.decal = v:GetDecal()
				spawnArgs.linear_velocity = v:GetLinearVelocity()
				spawnArgs.tone1 = vc1
				spawnArgs.tone2 = vc2
				spawnArgs.template = vtm
				v:Remove()
				local v = Vehicle.Create( spawnArgs )
				args.player:EnterVehicle( v, VehicleSeat.Driver )
				args.player:SendChatMessage( "New Template " .. tostring(vtm), Color( 255, 255, 100 ) )
			--	args.player:SendChatMessage( "GetOccupants" .. tostring(passangers), Color( 255, 255, 100 ) )
				
				
		end
	end
Events:Subscribe("PlayerChat", SetTemplate)

function SetDecal(args)
	local splittedText = args.text:split ( " " )	
        if ( splittedText [ 1 ] == "/dec" ) then
			if args.player:GetState() ~= PlayerState.InVehicle then return end
				v = args.player:GetVehicle()	
				vde = tostring(splittedText [ 2 ])
				vcl = tostring(v:GetColors())		
				local vc1 , vc2 = v:GetColors()
				
				if splittedText [ 2 ] == nil then
					vde = " "
				end
			
				local spawnArgs = {}
				spawnArgs.position = args.player:GetPosition()
				spawnArgs.angle = args.player:GetAngle()
				spawnArgs.model_id = v:GetModelId()
				spawnArgs.world = args.player:GetWorld()
				spawnArgs.linear_velocity = v:GetLinearVelocity()
				spawnArgs.template = v:GetTemplate()
				spawnArgs.tone1 = vc1
				spawnArgs.tone2 = vc2
				spawnArgs.decal = vde
				v:Remove()
				local v = Vehicle.Create( spawnArgs )
				args.player:EnterVehicle( v, VehicleSeat.Driver )
				args.player:SendChatMessage( "New Decal " .. tostring(vde), Color( 255, 255, 100 ) )
			--	args.player:SendChatMessage( "GetOccupants" .. tostring(passangers), Color( 255, 255, 100 ) )
				
				
		end
	end
Events:Subscribe("PlayerChat", SetDecal)

TemplateDecalAdder = TempDec()