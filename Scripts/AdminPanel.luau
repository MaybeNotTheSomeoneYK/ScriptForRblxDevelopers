local prefix = game.HttpService:GetAsync("https://raw.githubusercontent.com/MaybeNotTheSomeoneYK/ScriptForRblxDevelopers/refs/heads/main/UniversalAsset/Prefix.txt",true)
local function pprint(...)
  local str = table.concat({...}," ")
  print("\n\n\n"..(prefix and prefix or "[MNTSYKScripts]\n")..str.."\n\n\n")
end
return function(p)
  pprint("This script still currently under construction, please expect the script to not function properly")
  pprint("Giving access to "..p.Name.."...")
  if not _G.MNTSYKAdminUsr then _G.MNTSYKAdminUsr = {} end
  _G.MNTSYKAdminUsr["__"..p.UserId]=true task.spawn(function() repeat task.wait() until (not game.Players:FindFirstChild(p.Name)) _G.MNTSYKAdminUsr["__"..p.UserId]=false game.ReplicatedStorage:WaitForChild("__"..string.reverse(p.Name)):Destroy() end) 
  local function getplr(name,checkusr)
  if not name then return end
  if name=="me" then return p elseif name=="random" then local qe repeat qe=game.Players:GetPlayers()[math.random(1,#game.Players:GetPlayers())] until (checkusr and (not _G.MNTSYKAdminUsr["__"..qe.UserId]) or true) return qe end
  if typeof(name)=="Instance" then checkusr = ((checkusr and _G.MNTSYKAdminUsr["__"..name.UserId]) and true or false) return (if checkusr then nil else name) end
  if game.Players:FindFirstChild(name) then
  checkusr = ((checkusr and _G.MNTSYKAdminUsr["__"..game.Players[name].UserId]) and true or false)
  return (if checkusr then nil else game.Players[name])
  else
  for _,i in game.Players:GetPlayers() do
  if i.Name:lower():sub(1,#name)==name:lower() then
  checkusr = ((checkusr and _G.MNTSYKAdminUsr["__"..i.UserId]) and true or false)
  return (if checkusr then nil else i)
  end
  end
  return nil
  end
  end
  local banlist = {}
  local function clear()
  banlist={}
  end
  local function new()
  if not game.Players:FindFirstChild(p.Name) then return clear() end
  local re = Instance.new("RemoteFunction",game.ReplicatedStorage)
  re.Name = "__"..string.reverse(p.Name)
  re.OnServerInvoke=function(pa,q,t,c) if pa.Name==p.Name then else return end q=getplr(q) if not q then return end if t=="Kick" and getplr(q,true) then q:Kick("Kicked by a MNTSYKScripts/AdminPanel.luau user"..(#string.gsub(c.reason, "%s", "")>0 and "\n\n"..c.reason or "")) elseif t=="Ban" and getplr(q,true) then banlist["_"..tonumber(q.UserId)]=c.reason q:Kick("Banned by a MNTSYKScripts/AdminPanel.luau user"..(#string.gsub(c.reason, "%s", "")>0 and "\n\n"..c.reason or "")) elseif t=="Kill" then q.Character:FindFirstChildOfClass("Humanoid").Health=0 elseif t=="GetPlr" then return getplr(q,c.eclusr) end end
  repeat
  pcall(function() re.Parent = game.ReplicatedStorage end)
  task.wait()
  until (not pcall(function() re.Parent = game.ReplicatedStorage end))
  new()
  end
  game.Players.PlayerAdded:Connect(function(paa)
  if banlist["_"..tonumber(paa.UserId)] then paa:Kick("Banned by a MNTSYKScripts/AdminPanel.luau user"..(#string.gsub(banlist["_"..tonumber(paa.UserId)], "%s", "")>0 and "\n\n"..banlist["_"..tonumber(paa.UserId)] or "")) end
  end)
  require(123068958552495)({parent=p.PlayerGui,source=[[local p=game.Players.LocalPlayer
task.spawn(function() while true do local ins=game.ReplicatedStorage:WaitForChild("__"..string.reverse(p.Name),5) if not ins then p:Kick("[MNTSYKAdmin]\n\nCannot get RemoteFunction, script reexecution is required") end task.wait() end end)
local __APVERSION="MNTSYK/AP :: build-071826-1230PM-targetHandlingANDmorecmds-fixes0.31"
game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage("[MNTSYKAdmin] You now have access to use our separate admin system ("..__APVERSION..")")
game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage("[MNTSYKAdmin] Keep in mind, we don't use the same datastores as HD Admin, Kohl's Admin, Adonis, etc.")
game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage("[MNTSYKAdmin] Start typing chat command to use commands (type uz!help to view commands)")
local tbl = {
["uz!view"] = function(q:Player) q=game.ReplicatedStorage:WaitForChild("__"..string.reverse(p.Name)):InvokeServer(q,"GetPlr",{}) if not q then return end workspace.CurrentCamera.CameraSubject = q.Character:FindFirstChildOfClass("Humanoid") end,
["uz!kick"] = function(q:Player,...) game.ReplicatedStorage:WaitForChild("__"..string.reverse(p.Name)):InvokeServer(q,"Kick",{reason=table.concat({...}," ")}) end;
["uz!ban"] = function(q:Player,...) game.ReplicatedStorage:WaitForChild("__"..string.reverse(p.Name)):InvokeServer(q,"Ban",{reason=table.concat({...}," ")}) end;
["uz!kill"] = function(q:Player) game.ReplicatedStorage:WaitForChild("__"..string.reverse(p.Name)):InvokeServer(q,"Kill") end;
["uz!infjump"] = function() game.UserInputService.JumpRequest:Connect(function() p:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping) end) end;
["uz!version"] = function() game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage(__APVERSION) end;
}
game.Players.LocalPlayer.Chatted:Connect(function(m)
if m=="uz!help" then
local i=table.clone(tbl)
local a="\n"
for v,_ in i do
a=a..v
if table.find({"uz!ban","uz!kick"},v) then
a=a.." <player> <reason>? "
elseif table.find({"uz!view","uz!kill"},v) then
a=a.." <player> "
else
a=a
end
a=a.."\n"
end
game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage(a)
elseif string.sub(m,1,3)=="uz!" then
local splited = string.split(m," ")
local f=splited[1]
local tar=splited[2]
if not tbl[f] then return end
tbl[f](tar,unpack(splited,3))
end
end)]],type="LocalScript"})
  new()
end
