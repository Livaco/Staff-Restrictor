/*
Staff Restrictor Config
Make a ticket at livaco.tk if you need help.

There's no language file since there is only one piece of text that needs changed.
*/


/*
General Settings
*/

// Prefix for all chat messages.
StaffRestrictor.Config.Prefix = "[Staff Restrictor]"

// Prefix Color for all chat messages.
StaffRestrictor.Config.PrefixColor = Color(200, 0, 255)

// What to say if the player is not the right job. The only text needing to be changed.
StaffRestrictor.Config.NoNoText = "You are not the right job for this!"

/*
Restriction Settings
*/

// List of blocked ULX Commands.
StaffRestrictor.Config.BlockedCommands = {
  "ulx gag",
  "ulx gimp",
  "ulx mute",
  "ulx cloak",
  "ulx god",
  "ulx freeze",
  "ulx slay",
  "ulx bring",
  "ulx goto",
  "ulx return",
  "ulx send",
  "ulx teleport",
  "ulx ban",
  "ulx banid",
  "ulx kick",
  "ulx noclip",
  "ulx spectate",
  "ulx unban"
}

// Jobs allowed to use the Commands. Note that this will not auto-reload. If you edit this you will need to restart the server.
hook.Add("loadCustomDarkRPItems", "staffrestrictor_jobconfig", function() // Ignore this.
  StaffRestrictor.Config.AllowedJobs = {} // Ignore This
  StaffRestrictor.Config.AllowedJobs[TEAM_CITIZEN] = true // Citizen, just here as an example.
end) // Ignore this.