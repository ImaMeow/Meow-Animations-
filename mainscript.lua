getgenv().flinging = false
getgenv().lastflinghumanoid = nil
fakechar = game.Players:CreateHumanoidModelFromDescription(game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription,Enum.HumanoidRigType.R6)
fakechar.Parent = game.Workspace
fakechar.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
spawn(function()
	while true do
		for i,v in pairs(fakechar:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
		task.wait()
	end
end)
for i,v in pairs(fakechar:GetDescendants()) do
	if v:IsA("BasePart") then
		v.Transparency = 1
	end
end
fakechar.Head.face:Destroy()
game.Players.LocalPlayer.Character.Parent = fakechar
realchar = fakechar[game.Players.LocalPlayer.Name]
game.Workspace.CurrentCamera.CameraSubject = fakechar
game.Players.LocalPlayer.Character = fakechar
replicatesignal(game.Players.LocalPlayer.ConnectDiedSignalBackend)
task.wait(game.Players.RespawnTime+.65)
replicatesignal(game.Players.LocalPlayer.Kill)
game:GetService("RunService").Heartbeat:Connect(function()
	if getgenv().flinging == false then
		realchar.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
		game.Players.LocalPlayer.SimulationRadius = 9999
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
					warn("nah")
				else
					v.Handle.CFrame = fakechar[v.Name].Handle.CFrame
                    v.Handle.Velocity = Vector3.new(0,6400,0)
				end
			end
		end
	end
end)
game:GetService("RunService").Heartbeat:Connect(function()
	if getgenv().flinging == true then
		realchar.HumanoidRootPart.CFrame = getgenv().lastflinghumanoid.Parent.HumanoidRootPart.CFrame
		realchar.HumanoidRootPart.Velocity = Vector3.new(6400,6400,6400)
	end
end)
fling = function(humanoid)
	if humanoid:IsA("Humanoid") then
	highlight = Instance.new("Highlight")
	highlight.FillColor = Color3.fromRGB(222,111,222)
	highlight.Parent = humanoid.Parent
	replicatesignal(game.Players.LocalPlayer.ConnectDiedSignalBackend)
	task.wait(game.Players.RespawnTime+.65)
	getgenv().lastflinghumanoid = humanoid
	getgenv().flinging = true
	game.Players.LocalPlayer.Character.Parent = fakechar
	realchar = fakechar[game.Players.LocalPlayer.Name]
	game.Workspace.CurrentCamera.CameraSubject = fakechar
	game.Players.LocalPlayer.Character = fakechar
	task.wait(.65)
	replicatesignal(game.Players.LocalPlayer.ConnectDiedSignalBackend)
	task.wait(game.Players.RespawnTime+.65)
	replicatesignal(game.Players.LocalPlayer.Kill)
	getgenv().flinging = false
	highlight:Destroy()
	end
end
game.StarterGui:SetCore("SendNotification",{
	Title = "Meow Animations";
	Text = "Sucessfully Loaded! Made By ImaMeow"
})
