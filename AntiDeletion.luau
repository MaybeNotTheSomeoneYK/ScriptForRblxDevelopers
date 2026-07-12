local prefix = game.HttpService:GetAsync("https://raw.githubusercontent.com/MaybeNotTheSomeoneYK/ScriptForRblxDevelopers/refs/heads/main/UniversalAsset/Prefix.txt",true)
return function(p)
  print("\n\n\n"..(prefix and prefix or "[MNTSYKScripts]").." Thanks for using our script, AntiDeletion.luau!\nWith this everytime your character gets :Destroy() or .Parent=nil you'll always come back\n\n\n")
  local pos=CFrame.new(Vector3.new(0,0,0),Vector3.new(0,0,0))
  print("\n\n\n"..(prefix and prefix or "[MNTSYKScripts]").." Applying AntiDeletion to "..p.Name.."...\n\n\n")
  while true do 
    local a,b=pcall(function() 
    p.Character.Parent = workspace 
      pos=p.Character:GetPivot()
    end) 
    if not a then 
      p:LoadCharacterAsync() 
      p.Character:PivotTo(pos)
    end 
    task.wait() 
  end 
end
