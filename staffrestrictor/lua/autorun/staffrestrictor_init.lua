// Root Table
StaffRestrictor = {}

// Console Printing.
function StaffRestrictor:Print(message)
  local PrefixColor = Color(200, 0, 255)
  if SERVER then
    PrefixColor = Color(200, 150, 255)
  end
  MsgC(Color(255, 255, 255), "[")
  MsgC(PrefixColor, "Staff Restrictor")
  MsgC(Color(255, 255, 255), "] " .. message)
  MsgC(Color(255, 255, 255), "\n")
end
// Sub-Tables
StaffRestrictor.Config = {}
AddCSLuaFile("staffrestrictor/config/config.lua")
include("staffrestrictor/config/config.lua")

if SERVER then
  StaffRestrictor:Print("Loading Serverside.")
  StaffRestrictor:Print("")

  include("staffrestrictor/core/sv_main.lua") StaffRestrictor:Print("sv_main.lua")
  AddCSLuaFile("staffrestrictor/core/cl_main.lua")

  StaffRestrictor:Print("")
  StaffRestrictor:Print("Loaded.")
else
  StaffRestrictor:Print("Loading Clientside.")
  StaffRestrictor:Print("")

  include("staffrestrictor/core/cl_main.lua") StaffRestrictor:Print("cl_main.lua")

  StaffRestrictor:Print("")
  StaffRestrictor:Print("Loaded.")
end