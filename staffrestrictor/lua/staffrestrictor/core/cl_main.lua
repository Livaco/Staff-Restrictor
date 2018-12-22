function StaffRestrictor:Message(text)
  chat.AddText(StaffRestrictor.Config.PrefixColor, StaffRestrictor.Config.Prefix, " ", Color(255, 255, 255), text)
end

net.Receive("staffrestrictor_message", function()
  StaffRestrictor:Message(net.ReadString())
end)