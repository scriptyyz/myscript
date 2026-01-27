local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "GPO", -- Game name used as requested
   LoadingTitle = "GPO | Loader",
   LoadingSubtitle = "by Gemini",
   ConfigurationSaving = {
      Enabled = false
   },
   KeySystem = false 
})

-- KEY TAB (Standard Scriptyyz Layout)
local KeyTab = Window:CreateTab("Key System", 4483362458)

local enteredKey = ""

KeyTab:CreateInput({
   Name = "Enter Key",
   PlaceholderText = "Paste Key Here",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      enteredKey = Text
   end,
})

KeyTab:CreateButton({
   Name = "Check Key",
   Callback = function()
      -- Key check for: gpo2026
      if string.lower(enteredKey) == "gpo2026" then
         Rayfield:Notify({Title = "Correct!", Content = "Access Granted. Loading Script...", Duration = 3})
         
         -- RUNS YOUR NEW SCRIPT
         loadstring(game:HttpGet("https://raw.githubusercontent.com/AliCode14/scripts/refs/heads/main/GpoKaitun.lua"))()
      else
         Rayfield:Notify({Title = "Wrong Key", Content = "Please get the key from the link below.", Duration = 3})
      end
   end,
})

KeyTab:CreateButton({
   Name = "Copy Key Link",
   Callback = function()
      setclipboard("https://link-hub.net/1377384/r95MdeUXWn0w")
      Rayfield:Notify({Title = "Success", Content = "Link copied to clipboard!", Duration = 3})
   end,
})
