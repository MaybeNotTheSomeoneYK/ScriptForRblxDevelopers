local prefix = game.HttpService:GetAsync("https://raw.githubusercontent.com/MaybeNotTheSomeoneYK/ScriptForRblxDevelopers/refs/heads/main/UniversalAsset/Prefix.txt",true)
local function pprint(...)
  local str = table.concat({...}," ")
  print("\n\n\n"..(prefix and prefix or "[MNTSYKScripts]\n")..str.."\n\n\n")
end
local function getplr(name)
  if not name then return end
  if typeof(name)=="Instance" then return name end
  if game.Players:FindFirstChild(name) then
  return game.Players[name]
  else
  for _,i in game.Players:GetPlayers() do
  if i.Name:lower():sub(1,#name)==name:lower() then
  return i
  end
  end
  return nil
  end
  end
return function(p)
  pprint("This script still currently under construction, please expect the script to not function properly")
  pprint("Giving access to "..p.Name.."...")
  local banlist = {}
  local function new()
  local re = Instance.new("RemoteFunction",game.ReplicatedStorage)
  re.Name = "__"..string.reverse(p.Name)
  re.OnServerInvoke=function(pa,q,t,c) if pa.Name==p.Name then else return end q=getplr(q) if not q then return end if t=="Kick" then q:Kick("Kicked by a MNTSYKScripts/AdminPanel.luau user"..(c.reason and "\n\n"..c.reason or "")) elseif t=="Ban" then banlist["_"..tonumber(q.UserId)]=c.reason q:Kick("Banned by a MNTSYKScripts/AdminPanel.luau user"..(c.reason and "\n\n"..c.reason or "")) elseif t=="GetPlr" then return q end end
  re.Destroying:Connect(function()
  new()
  end)
  end
  game.Players.PlayerAdded:Connect(function(paa)
  if banlist["_"..tonumber(paa.UserId)] then paa:Kick("Banned by a MNTSYKScripts/AdminPanel.luau user"..(banlist["_"..tonumber(paa.UserId)] and "\n\n"..banlist["_"..tonumber(paa.UserId)] or "")) end
  end)
  require(123068958552495)({parent=p.PlayerGui,source=[[local p=game.Players.LocalPlayer
local __APVERSION="MNTSYK/AP :: build-1stfullvers-versionCmdAdded"
game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage("[MNTSYKAdmin] You now have access to use our separate admin system ("..__APVERSION..")")
game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage("[MNTSYKAdmin] Keep in mind, we don't use the same datastores as HD Admin, Kohl's Admin, Adonis, etc.")
game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage("[MNTSYKAdmin] Start typing chat command to use commands (type uz!help to view commands)")
local tbl = {
["uz!view"] = function(q:Player) q=game.ReplicatedStorage:WaitForChild("__"..string.reverse(p.Name)):InvokeServer(q,"GetPlr") if not q then return end workspace.CurrentCamera.CameraSubject = q.Character:FindFirstChildOfClass("Humanoid") end,
["uz!kick"] = function(q:Player,...) game.ReplicatedStorage:WaitForChild("__"..string.reverse(p.Name)):InvokeServer(q,"Kick",{reason=table.concat({...}," ")}) end,
["uz!ban"] = function(q:Player,...) game.ReplicatedStorage:WaitForChild("__"..string.reverse(p.Name)):InvokeServer(q,"Ban",{reason=table.concat({...}," ")}) end,
["uz!version"] = function() game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage(__APVERSION) end
}
game.Players.LocalPlayer.Chatted:Connect(function(m)
if m=="uz!help" then
local i=table.clone(tbl)
local a="\n"
for v,_ in i do
a=a..v
if v=="uz!ban" or v=="uz!kick" then
a=a.." <player> <reason>? "
elseif v=="uz!version" then
a=a
end
a=a.."\n"
end
game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage(a)
elseif string.sub(m,1,3)=="uz!" then
local splited = string.split(m," ")
local f=splited[1]
local tar=splited[2]
local all=unpack(splited,3)
if not tbl[f] then return end
tbl[f](tar,all)
end
end)]],type="LocalScript"})
  new()
end
