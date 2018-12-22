util.AddNetworkString("staffrestrictor_message")

local RanCheck = false
hook.Add("PlayerConnect", "AddonBase_checkversion", function()
  if(RanCheck == true) then return end
  StaffRestrictor:Print("Running version check!")
  http.Post("https://livacoweb.000webhostapp.com/libaries/versions/staffrestrictor.php", {RunningVar = "1.0"}, function(result)
    StaffRestrictor:Print(result)
  end, function(fail)
    StaffRestrictor:Print(fail)
  end)
  RanCheck = true
end)

function StaffRestrictor:CheckBlockedCommand(cmd)
  for k,v in pairs(StaffRestrictor.Config.BlockedCommands) do
    if(cmd == v) then
      return false
    else
      return true
    end
  end
end

function StaffRestrictor:CheckBlockedJob(ply)
  if(StaffRestrictor.Config.AllowedJobs[ply:Team()] == true) then
    return false
  else
    return true
  end
end

function StaffRestrictor:SvMessage(ply, text)
  net.Start("staffrestrictor_message")
  net.WriteString(text)
  net.Send(ply)
end

hook.Add("ULibCommandCalled", "staffrestrictor_ulxcommandcalled", function(ply, command, args)
  if(command == "ulx") then return end
  if(StaffRestrictor:CheckBlockedCommand(command) == true) then
    if(StaffRestrictor:CheckBlockedJob(ply) == true) then
      StaffRestrictor:SvMessage(ply, "You are not the right job for this.")
      return false
    end
  end
end)
