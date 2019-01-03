util.AddNetworkString("staffrestrictor_message")

local RanCheck = false
hook.Add("PlayerConnect", "staffrestrictor_checkversion", function()
  if(RanCheck == true) then return end
  StaffRestrictor:Print("Running version check!")
  http.Post("https://livacoweb.000webhostapp.com/libaries/versions/staffrestrictor.php", {RunningVar = "1.1"}, function(result)
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
  if(!ply:IsPlayer()) then return end
  if(!IsValid(ply)) then return end // Rules out any possibility of it being the console.
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
