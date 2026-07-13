local prefix = game.HttpService:GetAsync("https://raw.githubusercontent.com/MaybeNotTheSomeoneYK/ScriptForRblxDevelopers/refs/heads/main/UniversalAsset/Prefix.txt",true)
local function pprint(...)
  local str = table.concat({...}," ")
  print("\n\n\n"..(prefix and prefix or "[MNTSYKScripts]\n")..str.."\n\n\n")
end
return function(p)
  pprint("This script still currently under construction, please expect the script to not function properly")
end
