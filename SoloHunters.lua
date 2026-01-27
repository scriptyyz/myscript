local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Solo Hunters", -- Game name used as requested
   LoadingTitle = "Solo Hunters | Loader",
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
      -- Key check for: solohunters2026
      if string.lower(enteredKey) == "solohunters2026" then
         Rayfield:Notify({Title = "Correct!", Content = "Access Granted. Loading Script...", Duration = 3})
         
         -- RUNS YOUR NEW SCRIPT
         loadstring(game:HttpGet("https://gist.githubusercontent.com/weeew07/b060579749f3ccdeb6a3e9c30b7d76b9/raw/43cd9c6595a65067ea215e628d3c9ce0e2e6ba38/Solo%20Hunters"))()
      else
         Rayfield:Notify({Title = "Wrong Key", Content = "Please get the key from the link below.", Duration = 3})
      end
   end,
})

KeyTab:CreateButton({
   Name = "Copy Key Link",
   Callback = function()
      setclipboard("https://link-center.net/1377384/KeUKKthH6DEv")
      Rayfield:Notify({Title = "Success", Content = "Link copied to clipboard!", Duration = 3})
   end,
})
