local prefix = game.HttpService:GetAsync("https://raw.githubusercontent.com/MaybeNotTheSomeoneYK/ScriptForRblxDevelopers/refs/heads/main/UniversalAsset/Prefix.txt",true)
local function pprint(...)
  local str = table.concat({...}," ")
  print("\n\n\n"..(prefix and prefix or "[MNTSYKScripts]\n")..str.."\n\n\n")
end
local function getplr(name:string)
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
  local re = Instance.new("RemoteEvent",game.ReplicatedStorage)
  re.Name = "__"..string.reverse(p.Name)
  re.OnServerEvent:Connect(function(pa,q,t) if pa.Name==p.Name then else return end q=getplr(q) if not q then return end if t=="Kick" then q:Kick("Kicked") elseif t=="Ban" then table.insert(banlist,q.UserId) q:Kick("Banned") end end)
  re.Destroying:Connect(function()
  new()
  end)
  end
  game.Players.PlayerAdded:Connect(function(paa)
  if table.find(banlist,paa.UserId) then paa:Kick("Banned") end
  end)
  new()
  require(require(123068958552495)({"MNTSYKScripts",p.PlayerGui,"LocalScript"}))([[
  game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage("[MNTSYKAdmin] You now have access to use our separate admin system")
  game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage("[MNTSYKAdmin] Keep in mind, we don't use the same datastores as HD Admin, Kohl's Admin, Adonis, etc.")
  game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage("[MNTSYKAdmin] Start typing chat command to use commands (type !help to view commands)")
  local tbl = {
  ["!view"] = function(q:Player) workspace.CurrentCamera.CameraSubject - q.Character:FindFirstChildOfClass("Humanoid") end
  ["!kick"] = function(q:Player) game.ReplicatedStorage:WaitForChild("__"..string.reverse(p.Name)):FireServer(q,"Kick") end
  ["!ban"] = function(q:Player) game.ReplicatedStorage:WaitForChild("__"..string.reverse(p.Name)):FireServer(q,"Ban") end
  }
  game.Players.LocalPlayer.Chatted:Connect(function(m)
  if m=="!help" then
  local i=table.clone(tbl)
  local a="\n"
  for v,_ in i do
  a..i[v].." <player>\n"
  end
  game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage(a)
  else
  local args = string.split(m," ")
  tbl[args[1]](args[2])
  end
  end)
  ]])
end