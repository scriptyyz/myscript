local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Jail a Brainrot", -- Game name used as requested
   LoadingTitle = "Jail a Brainrot | Loader",
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
      -- Key check for: jailabrainrot2026
      if string.lower(enteredKey) == "jailabrainrot2026" then
         Rayfield:Notify({Title = "Correct!", Content = "Access Granted. Loading Script...", Duration = 3})
         
         -- RUNS YOUR NEW SCRIPT
         loadstring(game:HttpGet("https://pastefy.app/5zOA1puG/raw"))()
      else
         Rayfield:Notify({Title = "Wrong Key", Content = "Please get the key from the link below.", Duration = 3})
      end
   end,
})

KeyTab:CreateButton({
   Name = "Copy Key Link",
   Callback = function()
      setclipboard("https://link-hub.net/1377384/f69ms1zTrZW4")
      Rayfield:Notify({Title = "Success", Content = "Link copied to clipboard!", Duration = 3})
   end,
})
