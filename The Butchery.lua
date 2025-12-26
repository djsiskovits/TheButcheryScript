--[[--------------------------------------------------------------
			       Variables
]]----------------------------------------------------------------

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Singularity5490/rbimgui-2/main/rbimgui-2.lua"))()
local MainWindow = Library.new({ text = "The Butchery - @o_8uzi",size = UDim2.new(400, 200),}) MainWindow.open()

local Main = MainWindow.new({ text = "Main",})
local Visual = MainWindow.new({text = "Visuals",})
local Items = MainWindow.new({text = "Items",})
local GameKiller = MainWindow.new({text = "Game Killer",})

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character

local ItemFolder = game:GetService("ReplicatedStorage"):FindFirstChild("Items")
local PickUpItemEvent = game:GetService("ReplicatedStorage"):FindFirstChild("InventoryEvents"):FindFirstChild("PickUpItemEvent")
local UseItemEvent_upvr = game:GetService("ReplicatedStorage").InventoryEvents:WaitForChild("UseItemEvent")
local ToolCloningEvent = game:GetService("ReplicatedStorage"):FindFirstChild("InventoryEvents"):FindFirstChild("ToolCloningEvent")

local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")

local Characters = workspace._Characters
local Doors = workspace._Doors
local Barriers = workspace._Barriers
local PathfindingZones = workspace._PathfindingZones

--[[--------------------------------------------------------------
			       Reset
]]----------------------------------------------------------------

for _,Character in pairs(Characters:GetChildren()) do if Character:FindFirstChild("HighlightESP") and Character:FindFirstChild("NameESP") then Character:FindFirstChild("HighlightESP"):Destroy() Character:FindFirstChild("NameESP"):Destroy() end  end
Character.Humanoid.JumpPower = 0;Character.Humanoid.UseJumpPower = false;Character.Humanoid.WalkSpeed = 6
for _,Model in pairs(PathfindingZones:GetChildren()) do for _,v in pairs(Model:GetChildren()) do v.Transparency = 1 end end 
Lighting.Ambient = Color3.fromRGB(0,0,0)


--[[--------------------------------------------------------------
			       UI
]]----------------------------------------------------------------

local Warning = GameKiller.new("label", {text = "Warning! Some Features aren't 100% Working.",color = Color3.new(1, 0, 0),})

local Speed = Main.new("slider", { text = "Walkspeed", color = Color3.new(0.8, 0.5, 0), min = 6, max = 150, value = 6, rounding = 1,})

local EnableJump = Main.new("switch", { text = "Toggle Jump";}) EnableJump.set(false)
local Fullbright = Visual.new("switch", {text = "Toggle Fullbright";}) Fullbright.set(false)
local Esp = Visual.new("switch", {text = "Toggle ESP";}) Esp.set(false)
local Pathfinding = Visual.new("switch", {text = "Toggle Pathfinding";}) Pathfinding.set(false)

local GiveAllItems = Items.new("button", {text = "Give All Items",})
local InstaWin = GameKiller.new("button", {text = "Instant Win",})
local DestroyDoors = GameKiller.new("button", {text = "Destroy Doors",})
local KillAll = GameKiller.new("button", {text = "Kill All Enemies",})

local dropdown1 = Main.new("dropdown", { text = "Teleports",})
dropdown1.new("Attic");dropdown1.new("Drawing Room");dropdown1.new("Living Room")

local Automation = Main.new("label", {text = "Automations are Server Sided, May be buggy!",color = Color3.new(1, 0, 0),})
local AutoOpenDoors = Main.new("button", {text = "Auto Open all Doors",})

--[[--------------------------------------------------------------
			       Functions
]]----------------------------------------------------------------

local function CreateESP(Child)
    for _, v in ipairs(Child) do
        if v:FindFirstChild("NameESP") == nil and v:FindFirstChild("HighlightESP") == nil then
            
            local NameESP = Instance.new("BillboardGui", v)
            local TextBox = Instance.new("TextLabel", NameESP)
            NameESP.Name = "NameESP"
            NameESP.Adornee = v
            NameESP.Size = UDim2.new(0, 75, 0, 150)
            NameESP.StudsOffset = Vector3.new(0, 2, 0)
            NameESP.AlwaysOnTop = true

            TextBox.Size = UDim2.new(1, 0, 1, 0)
            TextBox.Text = v.Name
            TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.BackgroundTransparency = 1
            TextBox.TextStrokeTransparency = 0.75
            TextBox.Font = Enum.Font.Code
            TextBox.TextScaled = true

            local HighlightESP = Instance.new("Highlight", v)
            HighlightESP.Name = "HighlightESP"
            HighlightESP.Adornee = v
            HighlightESP.OutlineTransparency = 1
        end
    end
end

local function OpenAllDoors()

   local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

   local BedroomDoor = Doors:FindFirstChild("BedroomDoor")
   local BeetleDoor = Doors:FindFirstChild("BeetleDoor")
   local SpiderDoor = Doors:FindFirstChild("SpiderDoor")
   local LaundryDoor = Doors:FindFirstChild("LaundryDoor")
   local CentipedeDoor = Doors:FindFirstChild("CentipedeDoor")
   local CentipedeDoor2 = Doors:FindFirstChild("CentipedeDoor2")
   local MetalDoor = Doors:FindFirstChild("MetalDoor")
   local GardenDoor = Doors:FindFirstChild("GardenDoor")
   

   local SavedPos = Character:FindFirstChild("HumanoidRootPart").CFrame

   local args = {true,"BedroomKey"}
   ToolCloningEvent:FireServer(unpack(args))

   local BedroomTween = TweenService:Create(Character:FindFirstChild("HumanoidRootPart"), tweenInfo, {CFrame = CFrame.new(-101.093079, 125.459755, 148.972717, 0, 0, -1, 0, 1, 0, 1, 0, 0)})
   BedroomTween:Play()
   Wait(0.9)
   Character:FindFirstChild("HumanoidRootPart").Anchored = false
   repeat task.wait() until BedroomDoor:FindFirstChild("Door").CFrame == CFrame.new(-104, 125.744034, 151.478195, 1, 0, 0, 0, 1, 0, 0, 0, 1) or BedroomDoor:FindFirstChild("Door").CFrame == CFrame.new(-100.309532, 125.744034, 151.478165, -1, 0, 0, 0, 1, 0, 0, 0, -1)


   local args = {true,"BeetleKey"}
   ToolCloningEvent:FireServer(unpack(args))

   local BeetleTween = TweenService:Create(Character:FindFirstChild("HumanoidRootPart"), tweenInfo, {CFrame = CFrame.new(-86.6004715, 125.434731, 113.161224, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
   BeetleTween:Play()
   Wait(0.9)
   repeat task.wait() until BeetleDoor:FindFirstChild("Door").CFrame == CFrame.new(-83.9229431, 125.754021, 114.691589, -1, 0, 0, 0, 1, 0, 0, 0, -1) or BeetleDoor:FindFirstChild("Door").CFrame == CFrame.new(-83.9045105, 125.754021, 110.07164, 1, 0, 0, 0, 1, 0, 0, 0, 1)


   local args = {true,"SpiderKey"}
   ToolCloningEvent:FireServer(unpack(args))

   local SpiderTween = TweenService:Create(Character:FindFirstChild("HumanoidRootPart"), tweenInfo, {CFrame = CFrame.new(-33.447403, 112.061371, 87.7300339, 0, 0, -1, 0, 1, 0, 1, 0, 0)})
   SpiderTween:Play()
   Wait(0.9)
   repeat task.wait() until SpiderDoor:FindFirstChild("Door").CFrame == CFrame.new(-29.7098694, 112.380661, 85.8060455, 0, 0, -1, 0, 1, 0, 1, 0, 0) or SpiderDoor:FindFirstChild("Door").CFrame == CFrame.new(-34.3298187, 112.380661, 85.7876053, 0, 0, 1, 0, 1, -0, -1, 0, 0)


   local args = {true,"LaundryKey"}
   ToolCloningEvent:FireServer(unpack(args))

   local LaundryTween = TweenService:Create(Character:FindFirstChild("HumanoidRootPart"), tweenInfo, {CFrame = CFrame.new(6.62529373, 112.157852, 124.647667, 0, 0, -1, 0, 1, 0, 1, 0, 0)})
   LaundryTween:Play()
   Wait(0.9)
   repeat task.wait() until LaundryDoor:FindFirstChild("Door").CFrame == CFrame.new(9.63662338, 112.405037, 122.276482, -1, 0, 0, 0, 1, 0, 0, 0, -1) or LaundryDoor:FindFirstChild("Door").CFrame == CFrame.new(5.54664183, 112.405037, 122.348061, 1, 0, 0, 0, 1, 0, 0, 0, 1)


   local args = {true,"CentipedeKey"}
   ToolCloningEvent:FireServer(unpack(args))

   local CentipedeTween = TweenService:Create(Character:FindFirstChild("HumanoidRootPart"), tweenInfo, {CFrame = CFrame.new(48.0655632, 112.13279, 80.207962, -1, 0, 0, 0, 1, 0, 0, 0, -1)})
   CentipedeTween:Play()
   Wait(0.9)
   repeat task.wait() until CentipedeDoor:FindFirstChild("Door").CFrame == CFrame.new(45.3696022, 112.45208, 83.610466, -1, 0, 0, 0, 1, 0, 0, 0, -1) or CentipedeDoor:FindFirstChild("Door").CFrame == CFrame.new(45.3880348, 112.45208, 78.9905167, 1, 0, 0, 0, 1, 0, 0, 0, 1)


   local CentipedeTwoTween = TweenService:Create(Character:FindFirstChild("HumanoidRootPart"), tweenInfo, {CFrame = CFrame.new(53.4340019, 112.117043, 48.3050423, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
   CentipedeTwoTween:Play()
   Wait(0.9)
   repeat task.wait() until CentipedeDoor2:FindFirstChild("Door").CFrame == CFrame.new(55.9394836, 112.401321, 51.4809418, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07) or CentipedeDoor2:FindFirstChild("Door").CFrame == CFrame.new(55.9394455, 112.401321, 47.7593842, -1.1920929e-07, -0, -1.00000012, 0, 1, -0, 1.00000012, 0, -1.1920929e-07)

   local args = {true,"GardenKey"}
   ToolCloningEvent:FireServer(unpack(args))
   local GardenTween = TweenService:Create(Character:FindFirstChild("HumanoidRootPart"), tweenInfo, {CFrame = CFrame.new(39.0897255, 112.15667, 130.379623, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
   GardenTween:Play()
   Wait(0.9)
   repeat task.wait() until GardenDoor:FindFirstChild("Door").CFrame == CFrame.new(36.7389755, 112.475952, 133.61235, -1, 0, 0, 0, 1, 0, 0, 0, -1)

   Character:FindFirstChild("HumanoidRootPart").CFrame = SavedPos

end


--[[--------------------------------------------------------------
			       Scripting
]]----------------------------------------------------------------


--[[ Main Tab ]]--


Speed.event:Connect(function(x) Character.Humanoid.WalkSpeed = x end)

EnableJump.event:Connect(function(bool)
    if bool == true then
      Character.Humanoid.JumpPower = 40;Character.Humanoid.UseJumpPower = true
   elseif bool == false then
      Character.Humanoid.JumpPower = 0;Character.Humanoid.UseJumpPower = false
   end
end)

dropdown1.event:Connect(function(name)
    if name ==  "Attic" then
      Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(-19.8385563, 122.467293, 114.966042, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif name == "Drawing Room" then
      Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(54.9464226, 108.656296, 37.1520348, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif name == "Living Room" then
      Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(-54.4674301, 108.656296, 95.8500366, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    end
end)

AutoOpenDoors.event:Connect(function()
   OpenAllDoors()
end)


--[[ Visuals Tab ]]--


Fullbright.event:Connect(function(bool)
    if bool == true then
      Lighting.Ambient = Color3.fromRGB(255,255,255)
   elseif bool == false then
      Lighting.Ambient = Color3.fromRGB(0,0,0)
   end
end)


Esp.event:Connect(function(bool)
    if bool == true then
         CreateESP(Characters:GetChildren())
   elseif bool == false then
      for _,Character in pairs(Characters:GetChildren()) do
         if Character:FindFirstChild("HighlightESP") and Character:FindFirstChild("NameESP") then
            Character:FindFirstChild("HighlightESP"):Destroy()
            Character:FindFirstChild("NameESP"):Destroy()
         end
	   end
   end
end)

Pathfinding.event:Connect(function(bool)
    if bool == true then
      for _,Model in pairs(PathfindingZones:GetChildren()) do
         for _,v in pairs(Model:GetChildren()) do
            v.Transparency = 0.5
         end
      end
   elseif bool == false then
      for _,Model in pairs(PathfindingZones:GetChildren()) do
         for _,v in pairs(Model:GetChildren()) do
            v.Transparency = 1
         end
      end
   end
end)


--[[ Item Tab ]]--


GiveAllItems.event:Connect(function()
   for _,Item in pairs(ItemFolder:GetChildren()) do
		local args = {ItemFolder:FindFirstChild(Item.Name)}
    	PickUpItemEvent:FireServer(unpack(args))
	end
end)


--[[ Game Killer Tab ]] --


InstaWin.event:Connect(function()
   Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(39.1779861, 109.136986, 143.993408, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

DestroyDoors.event:Connect(function()
   for _,Door in pairs(Doors:GetChildren()) do
		Door:Destroy()
	end
end)

KillAll.event:Connect(function()
   for _,CharacterO in pairs(Characters:GetChildren()) do
		CharacterO:Destroy()
	end
end)


