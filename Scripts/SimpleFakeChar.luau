local function _n(i:Instance)
	local __c="abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUWXYZ!@#$%^&*()_+=-\\|}{[]\"'/?.,><;:"
	local t={}
	for _=1,20 do
		table.insert(t,__c[math.random(1,#__c)])
	end
	i.Name=table.concat(t,"")
end
local __limbs = {
	h_=(function()local p=Instance.new("Part")p.Size=Vector3.new(2,1,1)_n(p)return p end)();
	t_=(function()local p=Instance.new("Part")p.Size=Vector3.new(2,2,1)_n(p)return p end)();
	la=(function()local p=Instance.new("Part")p.Size=Vector3.new(1,2,1)p.PivotOffset=CFrame.new(Vector3.new(0,-1,0))_n(p)return p end)();
	ra=(function()local p=Instance.new("Part")p.Size=Vector3.new(1,2,1)p.PivotOffset=CFrame.new(Vector3.new(0,-1,0))_n(p)return p end)();
	ll=(function()local p=Instance.new("Part")p.Size=Vector3.new(1,2,1)p.PivotOffset=CFrame.new(Vector3.new(0,-1,0))_n(p)return p end)();
	rl=(function()local p=Instance.new("Part")p.Size=Vector3.new(1,2,1)p.PivotOffset=CFrame.new(Vector3.new(0,-1,0))_n(p)return p end)();
}

local prefix = game.HttpService:GetAsync("https://raw.githubusercontent.com/MaybeNotTheSomeoneYK/ScriptForRblxDevelopers/refs/heads/main/UniversalAsset/Prefix.txt",true)
local function pprint(...)
	local str = table.concat({...}," ")
	print("\n\n\n"..(prefix and prefix or "[MNTSYKScripts]\n")..str.."\n\n\n")
end
return function(p)
	pprint("This script still currently under construction, please expect the script to not function properly")
	p.CharacterAdded:Connect(function(c)c:WaitForChild("Humanoid").RequiresNeck=false for _,i in c:GetChildren() do if not i:IsA("Humanoid") or i.Name~="HumanoidRootPart" then i:Destroy() end end end)
	local pos=CFrame.new(Vector3.new(0,0,0),Vector3.new(0,0,0))
	task.spawn(function()while true do local a,b=pcall(function()p.Character.Parent = workspace pos=p.Character:GetPivot()end)if not a then p:LoadCharacterAsync()p.Character:PivotTo(pos)end task.wait()end end)
	p.Character=nil
	local __i=table.clone(__limbs)
	local _____limbs={}
	for i,v in __i do
		local index=i
		i=v:Clone()
		_____limbs[index]=i
		i.Parent=workspace:FindFirstChildOfClass("Terrain")
		i.Anchored=true
		i.CanCollide=false
		_n(i)
		i:SetNetworkOwner(p)
		local function __z(_i)
			_i:GetPropertyChangedSignal("Parent"):Connect(function()
				local ___q=pcall(function()_i.Parent=workspace end)
				if not ___q then _i=v:Clone() _i.Parent=workspace _i.Anchored=false _n(_i)i:SetNetworkOwner(p)_____limbs[index]=_i __z(_i)end
			end)
			__z(i)
		end
	end
	task.spawn(function()while true do if _____limbs.t_ then _____limbs.t_:PivotTo(pos) end end end)
	while true do
		local _plafron=_____limbs.t_:GetPivot()*CFrame.new(Vector3.new(-1,1,0))*CFrame.Angles(math.rad(20),0,0)
		local _praback=_____limbs.t_:GetPivot()*CFrame.new(Vector3.new(1,1,0))*CFrame.Angles(math.rad(-20),0,0)
		local _pllfron=_____limbs.t_:GetPivot()*CFrame.new(Vector3.new(-.5,-1,0))*CFrame.Angles(math.rad(20),0,0)
		local _praback=_____limbs.t_:GetPivot()*CFrame.new(Vector3.new(.5,-1,0))*CFrame.Angles(math.rad(-20),0,0)
		local _plaback=_____limbs.t_:GetPivot()*CFrame.new(Vector3.new(-1,1,0))*CFrame.Angles(math.rad(-20),0,0)
		local _prafron=_____limbs.t_:GetPivot()*CFrame.new(Vector3.new(1,1,0))*CFrame.Angles(math.rad(20),0,0)
		local _pllback=_____limbs.t_:GetPivot()*CFrame.new(Vector3.new(-.5,-1,0))*CFrame.Angles(math.rad(-20),0,0)
		local _prafron=_____limbs.t_:GetPivot()*CFrame.new(Vector3.new(.5,-1,0))*CFrame.Angles(math.rad(20),0,0)
		local _plaup=_____limbs.t_:GetPivot()*CFrame.new(Vector3.new(-1,1,0))*CFrame.Angles(math.rad(180),0,0)
		local _praup=_____limbs.t_:GetPivot()*CFrame.new(Vector3.new(1,1,0))*CFrame.Angles(math.rad(180),0,0)
		local _pla=_____limbs.t_:GetPivot()*CFrame.new(Vector3.new(-1,1,0))*CFrame.Angles(math.rad(0),0,0)
		local _pra=_____limbs.t_:GetPivot()*CFrame.new(Vector3.new(1,1,0))*CFrame.Angles(math.rad(0),0,0)
		local _pll=_____limbs.t_:GetPivot()*CFrame.new(Vector3.new(-.5,-1,0))*CFrame.Angles(math.rad(0),0,0)
		local _pra=_____limbs.t_:GetPivot()*CFrame.new(Vector3.new(.5,-1,0))*CFrame.Angles(math.rad(0),0,0)
		if (p.Character or p.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid").MoveDirection.Magnitude > 0 and (p.Character or p.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid"):GetState() ~= Enum.HumanoidStateType.Jumping then
			local __tempa=task.spawn(function() local a=0 while true do if math.floor(a/2)==a/2 then for qa=1,1000 do _____limbs.la:PivotTo(_plafron)_____limbs.rl:PivotTo(_prlfron)_____limbs.ra:PivotTo(_praback)_____limbs.ll:PivotTo(_pllback) wait(0.001) end else for qa=1,1000 do _____limbs.la:PivotTo(_plaback)_____limbs.rl:PivotTo(_prlback)_____limbs.ra:PivotTo(_prafron)_____limbs.ll:PivotTo(_pllfron) wait(0.001) end end end end)
			repeat
				task.wait()
			until (p.Character or p.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid").MoveDirection.Magnitude == 0 or (p.Character or p.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid"):GetState() ~= Enum.HumanoidStateType.Jumping 
			task.cancel(__tempa)
		elseif (p.Character or p.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid"):GetState() ~= Enum.HumanoidStateType.Jumping then
			repeat
				_____limbs.la:PivotTo(_plaup)_____limbs.rl:PivotTo(_prlup)_____limbs.ra:PivotTo(_pra)_____limbs.ll:PivotTo(_pll)
				task.wait()
			until (p.Character or p.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid").FloorMaterial ~= Enum.Material.Air
		else
			_____limbs.la:PivotTo(_pla)_____limbs.rl:PivotTo(_prl)_____limbs.ra:PivotTo(_pra)_____limbs.ll:PivotTo(_pll)
			task.wait()
		end
	end
end

