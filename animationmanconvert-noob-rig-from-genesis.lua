--[[
functions:
fling(humanoid)
refit()
--]]
getgenv().rightarm = "Accessory (RArmNoob)"
getgenv().leftarm = "Accessory (LArmNoob)"
getgenv().rightleg = "Accessory (RLegNoob)"
getgenv().leftleg = "Accessory(LLegNoob)"
getgenv().torso = "Accessory (TorsoNoob)"
getgenv().limbsoffset = CFrame.Angles(0,0,math.rad(-90))
getgenv().rigsize = 1
loadstring(game:HttpGet("https://raw.githubusercontent.com/ImaMeow/Meow-Animations-/refs/heads/main/mainscript.lua"))()
game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(kai)
	key = kai:lower()
	if key == "e" then
		refit()
	end
end)
game.Players.LocalPlayer:GetMouse().Button1Down:Connect(function()
    fling(game.Players.LocalPlayer:GetMouse().Target.Parent.Humanoid)
end)
local cmt = {
	Angles = function(x,y,z,useRad)
		if not useRad then
			return CFrame.Angles(x,y,z)
		else
			return CFrame.Angles(math.rad(x),math.rad(y),math.rad(z))
		end
	end
}
local imt = {
	CreateWeld = function(p1,p2,c0,c1)
		c0,c1 = c0 or CFrame.new(0,0,0),c1 or CFrame.new(0,0,0)
		local weld = Instance.new("Motor6D",p1)
		weld.Part0,weld.Part1 = p1,p2
		weld.C0,weld.C1 = c0,c1
		return weld
	end,
	New = function(type,args)
		local instance = Instance.new(type)
		for i,v in pairs(args) do
			pcall(function()
				instance[i] = v
			end)
		end
		return instance
	end,
	Remove = function(instance,time)
		time = time or 0
		game:GetService("Debris"):AddItem(instance,time)
	end
}
local math     = setmetatable({random = function(minNum,maxNum,div) div = div or 1 return math.random(minNum * div,maxNum * div)/div end},{__index = math})
local CFrame   = setmetatable(cmt,{__index = CFrame})
local Instance = setmetatable(imt,{__index = Instance})

local stepped = game:GetService("RunService").Stepped

--BasicFunctions
local ins    = Instance.new
local v3     = Vector3.new
local cf     = CFrame.new
local angles = CFrame.Angles
local rad    = math.rad
local huge   = math.huge
local cos    = math.cos
local sin    = math.sin
local tan    = math.tan
local ray    = Ray.new
local random = math.random
local ud     = UDim.new
local ud2    = UDim2.new
local c3     = Color3.new
local rgb    = Color3.fromRGB
local bc     = BrickColor.new

--Variables
local uis = game:GetService("UserInputService")
local plr	 = game.Players.LocalPlayer
local plrg   = plr.PlayerGui
local char   = plr.Character
local h      = char.Head
local t      = char.Torso
local ra     = char["Right Arm"]
local la     = char["Left Arm"]
local rl     = char["Right Leg"]
local ll     = char["Left Leg"]
local rut    = char.HumanoidRootPart
local hum    = char:FindFirstChildOfClass("Humanoid")
local necno  = t.Neck
local rutjno = rut.RootJoint
local rsno   = t["Right Shoulder"]
local lsno   = t["Left Shoulder"]
local rhno   = t["Right Hip"]
local lhno   = t["Left Hip"]
--
local change  = 1
local sine    = 0
local ws      = 8
local jp      = 35
local songPos = 1
local jok     = false
local sprint  = false
local sitting = false
local laying  = false
local crying  = false
local wsGrow  = false
local muted   = false
local anim    = "Idle"
local asset   = "rbxassetid://"
local songs = {
	2734040079,
	1179830130,
	152675132,
	1467405749,
	411386717,
	3517565766,
	509308446
}
--
necc0,necc1=cf(0,t.Size.Y/2,0),cf(0,-h.Size.Y/2,0)
rutjc0,rutjc1=cf(0,0,0),cf(0,0,0)
rsc0,rsc1=cf(t.Size.X/2,t.Size.Y/4,0),cf(-ra.Size.X/2,ra.Size.Y/4,0)
lsc0,lsc1=cf(-t.Size.X/2,t.Size.Y/4,0),cf(la.Size.X/2,la.Size.Y/4,0)
rhc0,rhc1=cf(t.Size.X/4,-t.Size.Y/2,0),cf(0,rl.Size.Y/2,0)
lhc0,lhc1=cf(-t.Size.X/4,-t.Size.Y/2,0),cf(0,ll.Size.Y/2,0)
if char:FindFirstChild("Animate") then
char.Animate:Destroy()
end
if hum:FindFirstChildOfClass("Animator") then
hum.Animator:Destroy()
end
--Creating new joints
local nec = ins("Motor6D",t) nec.Name = "Neck" nec.Part0 = t nec.Part1 = h
local rutj = ins("Motor6D",rut) rutj.Name = "RootJoint" rutj.Part0 = t rutj.Part1 = rut
local rs = ins("Motor6D",t) rs.Name = "Right Shoulder" rs.Part0 = t rs.Part1 = ra
local ls = ins("Motor6D",t) ls.Name = "Left Shoulder" ls.Part0 = t ls.Part1 = la
local rh = ins("Motor6D",t) rh.Name = "Right Hip" rh.Part0 = t rh.Part1 = rl
local lh = ins("Motor6D",t) lh.Name = "Left Hip" lh.Part0 = t lh.Part1 = ll
--Removing old joints
necno.Parent = nil
rutjno.Parent = nil
rsno.Parent = nil
lsno.Parent = nil
rhno.Parent = nil
lhno.Parent = nil
--Setting CFrames
nec.C1 = necc1
nec.C0 = necc0
rs.C1 = rsc1
rs.C0 = rsc0
ls.C1 = lsc1
ls.C0 = lsc0
rh.C1 = rhc1
rh.C0 = rhc0
lh.C1 = lhc1
lh.C0 = lhc0
rutj.C1 = rutjc1
rutj.C0 = rutjc0

local mus = Instance.New("Sound",{Looped = true,Volume = .5,SoundId = asset..songs[songPos],Parent = t})
local vroOm = Instance.New("Sound",{Looped = true,Volume = 7.5,SoundId = asset..2658538628,Parent = t})
if jok then
	mus:Play()
end

function swait()
	stepped:Wait()
end
function rayc(spos,direc,ignore,dist)
    return workspace:FindPartOnRayWithIgnoreList(ray(spos,direc.Unit * dist),ignore,false,false)
end
function tween(instance,args,info,playOnCreate)
	if instance and args then
		playOnCreate = playOnCreate or true
		info = info or TweenInfo.new(
			1,
			Enum.EasingStyle.Linear,
			Enum.EasingDirection.In,
			0,
			false,
			0
		)
		if typeof(info) == "table" then
			info = TweenInfo.new(unpack(info))
		end
		local tween = game:GetService("TweenService"):Create(instance,info,args)
		if playOnCreate then
			tween:Play()
		end
		return tween
	end
end

local function bindslol(input)
	if input == "leftcontrol" then
		sprint = not sprint
	elseif input == "n" then
		jok = not jok
	elseif input == "z" then
		sitting = not sitting
		laying = false
		crying = false
	elseif input == "x" then
		sitting = false
		laying = not laying
		crying = false
	elseif input == "c" then
		sitting = false
		laying = false
		crying = not crying
	elseif input == "l" then
		songPos = songPos + 1
		if songPos > #songs then
			songPos = 1
		end
		end
end

uis.InputBegan:Connect(function(io,ip)
	if ip then return end
	pcall(function()
		bindslol(io.KeyCode.Name:lower())
	end)
end)
uis.InputChanged:Connect(function(io,ip)
	if ip then return end
	pcall(function()
		bindslol(io.KeyCode.Name:lower())
	end)
end)

stepped:Connect(function()
	sine = sine + change
	
	local dir = hum.MoveDirection
	if dir.Magnitude == 0 then dir = rut.Velocity/10 end
	
    local Ccf		  = rut.CFrame
    local Walktest1   = dir*Ccf.LookVector
    local Walktest2   = dir*Ccf.RightVector
    local rotfb		  = Walktest1.X+Walktest1.Z
    local rotrl		  = Walktest2.X+Walktest2.Z
	
	local hit,pos,rot = rayc(rut.Position,-rut.CFrame.UpVector,{char},4.5)
	
	local verVel	  = rut.Velocity.y
    local horVel	  = (rut.Velocity * v3(1,0,1)).Magnitude
	
	if mus.Parent ~= t then
		Instance.Remove(mus)
		mus = Instance.New("Sound",{Looped = true,Volume = .5,SoundId = asset..songs[songPos],Parent = t})
		mus:Play()
	end
	if vroOm.Parent ~= t then
		Instance.Remove(vroOm)
		vroOm = Instance.New("Sound",{Looped = true,Volume = 7.5,SoundId = asset..2658538628,Parent = t})
	end
	if rotfb > 1 then
		rotfb = 1
	elseif rotfb < -1 then
		rotfb = -1
	end
	if rotrl > 1 then
		rotrl = 1
	elseif rotrl < -1 then
		rotrl = -1
	end
	
	if jok then
		if not sprint then
			ws = 16
		else
			if not wsGrow then
				ws = 6
			end
		end
		jp = 65
		if not muted then
			mus:Resume()
		else
			mus:Stop()
		end
	else
		if not sprint then
			ws = 8
		else
			ws = 38
		end
		jp = 35
		mus:Stop()
	end
	
	hum.WalkSpeed = ws
	hum.JumpPower = jp
	
	local sn = 0 if plr.Name == "vlad20020" and random(0,1,50) == .6 then sn = random(5,10) end
	
	if anim == "walk" and hit then
		if not jok then
			nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(cos(sine/3) * 5,0,0,true) * angles(-rotfb/15,rotrl/2,0),.2)
			rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(0,.2 * cos(sine/3),0) * angles(sin(sine/3) * 2.5,sin(sine/6) * 2.5,0,true) * angles(-rotfb/12.5,0,-rotrl/8.5),.2)
			rs.C1 = rs.C1:Lerp(rsc1 * cf(.05 - .05 *  cos(sine/3),0,.1 * cos(sine/6) * rotfb) * angles(-10 - sin(sine/6) * 40 * rotfb,-sin(sine/6) * 25 * rotfb,0,true),.2)
			ls.C1 = ls.C1:Lerp(lsc1 * cf(-.05 + .05 *  cos(sine/3),0,-.1 * cos(sine/6) * rotfb) * angles(-10 + sin(sine/6) * 40 * rotfb,-sin(sine/6) * 25 * rotfb,0,true),.2)
			rh.C1 = rh.C1:Lerp(rhc1 * cf(0,.2 * cos(sine/6),.3 * -cos(sine/6)) * angles((7.5 * math.abs(rotfb)) + sin(sine/6) * 40 * rotfb,sin(sine/6) * 5,sin(sine/6) * 40 * rotrl,true),.2)
			lh.C1 = lh.C1:Lerp(lhc1 * cf(0,-.2 * cos(sine/6),.3 * cos(sine/6)) * angles((7.5 * math.abs(rotfb)) - sin(sine/6) * 40 * rotfb,sin(sine/6) * 5,-sin(sine/6) * 40 * rotrl,true),.2)
			wsGrow = false
			vroOm:Stop()
		else
			nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(sin(sine/5) * 15,sin(sine/10) * 20,0,true) * angles(-rotfb/10,rotrl/2,0),.2)
			rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(0,cos(sine/5) * 2.5,0) * angles(0,sin(sine/10) * 20,0,true) * angles(-rotfb/5,0,-rotrl/5),.2)
			rs.C1 = rs.C1:Lerp(rsc1 * cf(0,0,sin(sine/10) * 2.5 * rotfb) * angles(-15 + (sin(-sine/10) * 60 * rotfb),(-sin(sine/10) * 20) * rotfb,0,true),.2)
			ls.C1 = ls.C1:Lerp(lsc1 * cf(0,0,-sin(sine/10) * 2.5 * rotfb) * angles(-15 + (sin(sine/10) * 60 * rotfb),(-sin(sine/10) * 20) * rotfb,0,true),.2)
			rh.C1 = rh.C1:Lerp(rhc1 * cf((sin(sine/10) * 2.5) * rotrl,cos(sine/10) * 2.5,(-sin(sine/10) * 2.5) * rotfb) * angles(6.5 - (-sin(sine/10) * 35) * rotfb,sin(sine/10) * 10,(sin(sine/10) * 35) * rotrl,true),.2)
			lh.C1 = lh.C1:Lerp(lhc1 * cf((-sin(sine/10) * 2.5) * rotrl,-cos(sine/10) * 2.5,(sin(sine/10) * 2.5) * rotfb) * angles(6.5 - (sin(sine/10) * 35) * rotfb,sin(sine/10) * 10,(-sin(sine/10) * 35) * rotrl,true),.2)
			wsGrow = false
			vroOm:Stop()
		end
	elseif anim == "run" and hit then
		if not jok then
			nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(cos(sine/3) * 7.5,sin(sine/6) * 5,0,true) * angles(-rotfb/10,rotrl/2,0),.2)
			rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(0,.4 * cos(sine/3),0) * angles(sin(sine/3) * 4,sin(sine/6) * 7.5,0,true) * angles(-rotfb/5,0,-rotrl/5),.2)
			rs.C1 = rs.C1:Lerp(rsc1 * cf(.1 - .1 *  cos(sine/3),0,-.15 - .2 * cos(sine/6) * rotfb) * angles(-15 - sin(sine/6) * 110 * rotfb,-sin(sine/6) * 25 * rotfb,-10,true),.2)
			ls.C1 = ls.C1:Lerp(lsc1 * cf(-.1 + .1 *  cos(sine/3),0,-.15 +.2 * cos(sine/6) * rotfb) * angles(-15 + sin(sine/6) * 110 * rotfb,-sin(sine/6) * 25 * rotfb,10,true),.2)
			rh.C1 = rh.C1:Lerp(rhc1 * cf(0,.5 * cos(sine/6),.75 * -cos(sine/6)) * angles((7.5 * math.abs(rotfb)) + (sin(sine/6) * 80 * rotfb),sin(sine/6) * 15,sin(sine/6) * 60 * rotrl,true),.2)
			lh.C1 = lh.C1:Lerp(lhc1 * cf(0,.5 * -cos(sine/6),.75 * cos(sine/6)) * angles((7.5 * math.abs(rotfb)) + (-sin(sine/6) * 80 * rotfb),sin(sine/6) * 15,-sin(sine/6) * 60 * rotrl,true),.2)
			wsGrow = false
			vroOm:Stop()
		else
			nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(0,0,0,true) * angles(-rotfb * 1.5,0,0),.2)
			rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(0,-math.abs(rotfb * 1.5) + 1 * sin(sine),0) * angles(sin(sine) * 25,0,cos(sine) * 15,true) * angles(-rotfb * 1.5,0,-rotrl * 1.5),.2)
			rs.C1 = rs.C1:Lerp(rsc1 * cf(0,0,0) * angles(-sine * 50 * (ws/750) * rotfb,sin(sine) * 200,sine * 50 * (ws/750) * rotrl,true),.2)
			ls.C1 = ls.C1:Lerp(lsc1 * cf(0,0,0) * angles(-sine * 50 * (ws/750) * rotfb,sin(sine) * 200,sine * 50 * (ws/750) * rotrl,true),.2)
			rh.C1 = rh.C1:Lerp(rhc1 * cf(0,0,1 * sin(sine/5) * 5 * (ws/750)) * angles(sine * 50 * (ws/750) * rotfb,0,sine * 50 * (ws/750) * rotrl,true),.2)
			lh.C1 = lh.C1:Lerp(lhc1 * cf(0,0,-1 * sin(sine/5) * 5 * (ws/750)) * angles(sine * 50 * (ws/750) * rotfb,0,sine * 50 * (ws/750) * rotrl,true),.2)
			vroOm:Resume()
			if vroOm.TimePosition > vroOm.TimeLength -.1 then
				vroOm.TimePosition = 8.5
			end
			if vroOm.TimePosition < .1 then
				ws = 6
			end
			if vroOm.TimePosition < 8.5 then
				ws = ws + .01
			else
				ws = 750
				wsGrow = true
			end
		end
	elseif anim == "jump" and not hit then
		nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(0,0,0,true),.2)
		rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(0,0,0) * angles(0,0,0,true) * angles(-rotfb/5,0,-rotrl/5),.2)
		rs.C1 = rs.C1:Lerp(rsc1 * cf(0,0,0) * angles(0,0,0,true),.2)
		ls.C1 = ls.C1:Lerp(lsc1 * cf(0,0,0) * angles(0,0,0,true),.2)
		rh.C1 = rh.C1:Lerp(rhc1 * cf(0,0,0) * angles(0,0,0,true),.2)
		lh.C1 = lh.C1:Lerp(lhc1 * cf(0,0,0) * angles(0,0,0,true),.2)
	elseif anim == "fall" and not hit then
		nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(0,0,0,true),.2)
		rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(0,0,0) * angles(0,0,0,true) * angles(-rotfb/5,0,-rotrl/5),.2)
		rs.C1 = rs.C1:Lerp(rsc1 * cf(0,0,0) * angles(sin(sine/10) * 5,cos(sine/10) * 5,0,true),.2)
		ls.C1 = ls.C1:Lerp(lsc1 * cf(0,0,0) * angles(-sin(sine/10) * 5,-cos(sine/10) * 5,0,true),.2)
		rh.C1 = rh.C1:Lerp(rhc1 * cf(0,0,0) * angles(0,0,0,true),.2)
		lh.C1 = lh.C1:Lerp(lhc1 * cf(0,0,0) * angles(0,0,0,true),.2)
	elseif anim == "idle" and hit then
		if not jok or sitting or laying or crying then
			nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(cos(sine/20) * 4,sin(sine/80) * 10,0,true) * angles(random(-sn,sn),random(-sn,sn),random(-sn,sn),true),.2)
			rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(sin(sine/80)/20,sin(sine/20)/15,sin(sine/30)/17.5) * angles(sin(sine/20) * .9,sin(sine/60) * 2.25,sin(sine/80) * 2.25,true),.2)
			rs.C1 = rs.C1:Lerp(rsc1 * cf(0,sin(sine/20)/15,0) * angles((cos(sine/20) * 4),sin(sine/20) * 1.8,(sin(sine/80) * 2.25) + (cos(sine/20) * 2.25),true),.2)
			ls.C1 = ls.C1:Lerp(lsc1 * cf(0,sin(sine/20)/15,0) * angles((cos(sine/20) * 4),-sin(sine/20) * 1.8,(sin(sine/80) * 2.25) + (-cos(sine/20) * 2.25),true),.2)
			rh.C1 = rh.C1:Lerp(rhc1 * cf(0,(sin(sine/20)/15) + (sin(sine/80)/25),0) * angles((sin(sine/20) * 1.8) - (sin(sine/30) * 2.25) + (sin(sine/60) * 1.35),sin(sine/60) * 2.25,(sin(sine/80) * 3.25),true),.2)
			lh.C1 = lh.C1:Lerp(lhc1 * cf(0,(sin(sine/20)/15) - (sin(sine/80)/25),0) * angles((sin(sine/20) * 1.8) - (sin(sine/30) * 2.25) - (sin(sine/60) * 1.35),sin(sine/60) * 2.25,(sin(sine/80) * 3.25),true),.2)
			wsGrow = false
			vroOm:Stop()
		elseif jok and not sitting and not laying and not crying then
			nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(-cos(sine/10) * sin(sine/20) * 45,sin(sine/20) * cos(sine/40) * 30,sin(sine/30) * cos(sine/60) * 20,true),.2)
			rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(.25 * sin(sine/30) * cos(sine/60),-.65 + 1 * sin(sine/10) * cos(sine/20),0) * angles(sin(sine/10) * cos(sine/20) * 35,0,sin(sine/30) * cos(sine/60) * 10,true),.2)
			rs.C1 = rs.C1:Lerp(rsc1 * cf(0,.25 - .25 * sin(sine/20) * cos(sine/10),.25 * sin(sine/10) * cos(sine/20)) * angles(-105 + sin(sine/20) * cos(sine/10) * 65,sin(sine/20) * cos(sine/60) * 5,sin(sine/10) * cos(sine/20) * 70,true),.2)
			ls.C1 = ls.C1:Lerp(lsc1 * cf(0,.25 - .25 * sin(sine/20) * cos(sine/10),.25 * sin(sine/10) * cos(sine/20)) * angles(-105 + sin(sine/20) * cos(sine/10) * 65,sin(sine/20) * cos(sine/60) * 5,sin(sine/10) * cos(sine/20) * -70,true),.2)
			rh.C1 = rh.C1:Lerp(rhc1 * cf(0,-.625 + 1 * sin(sine/10) * cos(sine/20),.25 - .5 * sin(sine/10) * cos(sine/20)) * angles(10 + sin(sine/10) * cos(sine/20) * 40,0,sin(sine/30) * cos(sine/60) * 17.5,true),.2)
			lh.C1 = lh.C1:Lerp(lhc1 * cf(0,-.625 + 1 * sin(sine/10) * cos(sine/20),.25 - .5 * sin(sine/10) * cos(sine/20)) * angles(10 + sin(sine/10) * cos(sine/20) * 40,0,sin(sine/30) * cos(sine/60) * 17.5,true),.2)
			wsGrow = false
			vroOm:Stop()
		end
	end
	
	if verVel > 20 then
		anim = "jump"
		change = 1
		nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(5,0,0,true),.2)
		rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(-5,0,0,true),.2)
		rs.C0 = rs.C0:Lerp(rsc0 * cf(0,-.15,-.25) * angles(150,10,12.5,true),.2)
		ls.C0 = ls.C0:Lerp(lsc0 * cf(0,-.15,-.25) * angles(155,-10,-12.5,true),.2)
		rh.C0 = rh.C0:Lerp(rhc0 * cf(0,.5,-.35) * angles(-12.5,0,5,true),.2)
		lh.C0 = lh.C0:Lerp(lhc0 * cf(0,.2,-.15) * angles(-2.5,0,-5,true),.2)
	elseif verVel < -20 then
		anim = "fall"
		change = 1
		nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(-7.5,0,0,true),.2)
		rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(5,0,0,true),.2)
		rs.C0 = rs.C0:Lerp(rsc0 * cf(.25,-.25,0) * angles(0,10,110,true),.2)
		ls.C0 = ls.C0:Lerp(lsc0 * cf(-.25,-.25,0) * angles(0,-10,-110,true),.2)
		rh.C0 = rh.C0:Lerp(rhc0 * cf(0,.2,-.15) * angles(-2.5,0,5,true),.2)
		lh.C0 = lh.C0:Lerp(lhc0 * cf(0,.5,-.35) * angles(-12.5,0,-5,true),.2)
	elseif horVel > 5 and verVel > -20 and verVel < 20 then
		if not sprint then
			anim = "walk"
			if not jok then
				change = .6
			else
				change = 1
			end
			nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(0,0,0,true),.2)
			rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(0,0,0,true),.2)
			rs.C0 = rs.C0:Lerp(rsc0 * cf(0,0,0) * angles(0,0,0,true),.2)
			ls.C0 = ls.C0:Lerp(lsc0 * cf(0,0,0) * angles(0,0,0,true),.2)
			rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,0) * angles(0,0,0,true),.2)
			lh.C0 = lh.C0:Lerp(lhc0 * cf(0,0,0) * angles(0,0,0,true),.2)
		else
			anim = "run"
			if not jok then
				change = .9
			else
				change = 1
			end
			nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(0,0,0,true),.2)
			rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(0,0,0,true),.2)
			rs.C0 = rs.C0:Lerp(rsc0 * cf(0,0,0) * angles(0,0,0,true),.2)
			ls.C0 = ls.C0:Lerp(lsc0 * cf(0,0,0) * angles(0,0,0,true),.2)
			rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,0) * angles(0,0,0,true),.2)
			lh.C0 = lh.C0:Lerp(lhc0 * cf(0,0,0) * angles(0,0,0,true),.2)
		end
	elseif horVel < 5 and verVel > -20 and verVel < 20 then
		anim = "idle"
		change = 1
		if not sitting and not laying and not crying then
			if not jok then
				nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(0,0,0,true),.2)
				rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(0,0,0,true),.2)
				rs.C0 = rs.C0:Lerp(rsc0 * cf(0,0,0) * angles(.5,0,-.5,true),.2)
				ls.C0 = ls.C0:Lerp(lsc0 * cf(0,0,0) * angles(.5,0,.5,true),.2)
				rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,0) * angles(0,-2.5,2,true),.2)
				lh.C0 = lh.C0:Lerp(lhc0 * cf(0,0,0) * angles(0,2.5,-2,true),.2)
			else
				nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(0,0,0,true),.2)
				rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(0,0,0,true),.2)
				rs.C0 = rs.C0:Lerp(rsc0 * cf(0,0,0) * angles(0,0,0,true),.2)
				ls.C0 = ls.C0:Lerp(lsc0 * cf(0,0,0) * angles(0,0,0,true),.2)
				rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,0) * angles(0,0,5,true),.2)
				lh.C0 = lh.C0:Lerp(lhc0 * cf(0,0,0) * angles(0,0,-5,true),.2)
			end
		elseif sitting and not laying and not crying then
			nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(-20,0,0,true),.2)
			rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,1.75,0) * angles(-15,0,0,true),.2)
			rs.C0 = rs.C0:Lerp(rsc0 * cf(-.1,-.5,.15) * angles(-20,-60,10,true),.2)
			ls.C0 = ls.C0:Lerp(lsc0 * cf(0,-.25,-.2) * angles(70,-60,60,true) * angles(40,0,0,true),.2)
			rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,0) * angles(70,7.5,5,true),.2)
			lh.C0 = lh.C0:Lerp(lhc0 * cf(0,1.25,-.5) * angles(10,-10,-5,true),.2)
		elseif not sitting and laying and not crying then
			nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(-35,0,0,true),.2)
			rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,-2.4) * angles(-87.5,0,0,true),.2)
			rs.C0 = rs.C0:Lerp(rsc0 * cf(-.1,.75,-.25) * angles(195,0,-65,true) * angles(0,90,0,true),.2)
			ls.C0 = ls.C0:Lerp(lsc0 * cf(.125,-.3,-.05) * angles(90,20,85,true) * angles(-30,20,0,true),.2)
			rh.C0 = rh.C0:Lerp(rhc0 * cf(0,.25,-1) * angles(-55,20,7.5,true),.2)
			lh.C0 = lh.C0:Lerp(lhc0 * cf(0,0,0) * angles(2,-7.5,5,true),.2)
		elseif not sitting and not laying and crying then
			nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(-80,0,0,true),.2)
			rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,1.9,0) * angles(10,0,0,true),.2)
			rs.C0 = rs.C0:Lerp(rsc0 * cf(-.25,-.475,-.8) * angles(85,0,-80,true) * angles(0,100,0,true),.2)
			ls.C0 = ls.C0:Lerp(lsc0 * cf(.25,-.4,-.75) * angles(80,0,85,true) * angles(0,-87.5,0,true),.2)
			rh.C0 = rh.C0:Lerp(rhc0 * cf(0,1.85,-.75) * angles(5,-5,-5,true),.2)
			lh.C0 = lh.C0:Lerp(lhc0 * cf(0,1.85,-.7) * angles(3.5,5,5,true),.2)
		end
		end
end)
