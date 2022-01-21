BodyVelocity:Destroy() 
		BodyVelocity = INST("BodyVelocity") 
		BodyVelocity.MaxForce = Vec3(HUGE,0,HUGE) 
		if UserInputService:IsKeyDown("Space") and values.misc.movement["bunny hop"].Toggle then 
			local add = 0 
			if values.misc.movement.direction.Dropdown == "directional" or values.misc.movement.direction.Dropdown == "directional 2" then 
				if UserInputService:IsKeyDown("A") then add = 90 end 
				if UserInputService:IsKeyDown("S") then add = 180 end 
				if UserInputService:IsKeyDown("D") then add = 270 end 
				if UserInputService:IsKeyDown("A") and UserInputService:IsKeyDown("W") then add = 45 end 
				if UserInputService:IsKeyDown("D") and UserInputService:IsKeyDown("W") then add = 315 end 
				if UserInputService:IsKeyDown("D") and UserInputService:IsKeyDown("S") then add = 225 end 
				if UserInputService:IsKeyDown("A") and UserInputService:IsKeyDown("S") then add = 145 end 
			end 
			local rot = YROTATION(CamCFrame) * CFAngles(0,RAD(add),0) 
			BodyVelocity.Parent = LocalPlayer.Character.UpperTorso 
			LocalPlayer.Character.Humanoid.Jump = true 
			    if values.misc.movement.type.Dropdown == "gyro" and values.misc.movement["gyro type"].Dropdown == "no fling" then 
			        BodyVelocity.MaxForce = Vector3.new(99999,0,99999)
			    else
			        BodyVelocity.MaxForce = Vector3.new(HUGE,0,HUGE)
			    end
			BodyVelocity.Velocity = Vec3(rot.LookVector.X,0,rot.LookVector.Z) * (values.misc.movement["speed"].Slider * 2) 
			if add == 0 and values.misc.movement.direction.Dropdown == "directional" and not UserInputService:IsKeyDown("W") then 
				BodyVelocity:Destroy() 
			elseif values.misc.movement.type.Dropdown == "cframe" then 
			    BodyVelocity:Destroy()
				Root.CFrame = Root.CFrame + Vec3(rot.LookVector.X,0,rot.LookVector.Z) * values.misc.movement["speed"].Slider/50 
			end 
		end
		if values.misc.movement["edge jump"].Toggle and values.misc.movement["edge jump"].Active then 
			if LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall and LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then 
				coroutine.wrap(function() 
					RunService.RenderStepped:Wait() 
					if LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall and LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then 
						LocalPlayer.Character.Humanoid:ChangeState("Jumping") 
					end 
				end)() 
			end 
		end
