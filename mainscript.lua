game.Players.LocalPlayer.Character.Archivable = true
local fakechar = game.Players.LocalPlayer.Character:Clone()
fakechar.Parent = game.Workspace
for i,v in pairs(fakechar:GetDescendants()) do
	if v:IsA("BasePart") then
		v.Transparency = 1
	end
end
fakechar.Head.face:Destroy()
game.Players.LocalPlayer.Character.Parent = fakechar
local realchar = fakechar[game.Players.LocalPlayer.Name]
game.Workspace.CurrentCamera.CameraSubject = fakechar
game.Players.LocalPlayer.Character = fakechar
if getgenv().permdeath == true then
	replicatesignal(game.Players.LocalPlayer.ConnectDiedSignalBackend)
end
fakechar.Animate.Disabled = true
fakechar.Animate.Enabled = true
task.wait(game.Players.RespawnTime+.65)
if getgenv().permdeath == true then
	replicatesignal(game.Players.LocalPlayer.Kill)
else
	realchar.Humanoid:ChangeState(15)
end
spawn(function()
	while true do
		realchar[getgenv().rightarm].Handle.CFrame = fakechar["Right Arm"].CFrame * getgenv().limbsoffset
        realchar[getgenv().rightarm].Handle.Velocity = Vector3.new(0,6400,0)
		realchar[getgenv().leftarm].Handle.CFrame = fakechar["Left Arm"].CFrame * getgenv().limbsoffset
        realchar[getgenv().leftarm].Handle.Velocity = Vector3.new(0,6400,0)
		realchar[getgenv().rightleg].Handle.CFrame = fakechar["Right Leg"].CFrame * getgenv().limbsoffset
        realchar[getgenv().rightleg].Handle.Velocity = Vector3.new(0,6400,0)
		realchar[getgenv().leftleg].Handle.CFrame = fakechar["Left Leg"].CFrame * getgenv().limbsoffset
        realchar[getgenv().leftleg].Handle.Velocity = Vector3.new(0,6400,0)
		realchar[getgenv().torso].Handle.CFrame = fakechar["Torso"].CFrame
        realchar[getgenv().torso].Handle.Velocity = Vector3.new(0,6400,0)
		for i,v in pairs(realchar:GetDescendants()) do
			if v:IsA("Accessory") then
				if v.Name == getgenv().rightarm or v.Name == getgenv().leftarm or v.Name == getgenv().rightleg or v.Name == getgenv().leftleg or v.Name == getgenv().torso then
					continue
				else
					v.Handle.CFrame = fakechar[v.Name].Handle.CFrame
                    v.Handle.Velocity = Vector3.new(0,6400,0)
				end
			end
		end
		task.wait()
	end
end)
game.Players.LocalPlayer.CharacterAdded:Connect(function()
	task.wait(.1)
	game.Players.LocalPlayer.Character.Parent = fakechar
	realchar = fakechar[game.Players.LocalPlayer.Name]
	game.Workspace.CurrentCamera.CameraSubject = fakechar
	game.Players.LocalPlayer.Character = fakechar
	if getgenv().permdeath == true then
		replicatesignal(game.Players.LocalPlayer.ConnectDiedSignalBackend)
	end
	task.wait(game.Players.RespawnTime+.65)
	if getgenv().permdeath == true then
		replicatesignal(game.Players.LocalPlayer.Kill)
	else
		realchar.Humanoid:ChangeState(15)
	end
	spawn(function()
	    while true do
		    realchar[getgenv().rightarm].Handle.CFrame = fakechar["Right Arm"].CFrame * getgenv().limbsoffset
           realchar[getgenv().rightarm].Handle.Velocity = Vector3.new(0,6400,0)
	    	realchar[getgenv().leftarm].Handle.CFrame = fakechar["Left Arm"].CFrame * getgenv().limbsoffset
            realchar[getgenv().leftarm].Handle.Velocity = Vector3.new(0,6400,0)
	    	realchar[getgenv().rightleg].Handle.CFrame = fakechar["Right Leg"].CFrame * getgenv().limbsoffset
            realchar[getgenv().rightleg].Handle.Velocity = Vector3.new(0,6400,0)
	    	realchar[getgenv().leftleg].Handle.CFrame = fakechar["Left Leg"].CFrame * getgenv().limbsoffset
            realchar[getgenv().leftleg].Handle.Velocity = Vector3.new(0,6400,0)
	    	realchar[getgenv().torso].Handle.CFrame = fakechar["Torso"].CFrame
            realchar[getgenv().torso].Handle.Velocity = Vector3.new(0,6400,0)
	    	for i,v in pairs(realchar:GetDescendants()) do
	    		if v:IsA("Accessory") then
	    			if v.Name == getgenv().rightarm or v.Name == getgenv().leftarm or v.Name == getgenv().rightleg or v.Name == getgenv().leftleg or v.Name == getgenv().torso then
	    				continue
	    			else
		    			v.Handle.CFrame = fakechar[v.Name].Handle.CFrame
                     v.Handle.Velocity = Vector3.new(0,6400,0)
		    		end
		    	end
	    	end
	    	task.wait()
    	end
    end)
end)
game.Players.LocalPlayer.SimulationRadius = 9999
game.StarterGui:SetCore("SendNotification",{
	Title = "Meow Animations";
	Text = "Sucessfully Loaded! Made By ImaMeow"
})
