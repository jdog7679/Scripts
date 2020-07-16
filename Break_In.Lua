local library = loadstring(game:HttpGet("https://pastebin.com/raw/b0BKAXFM"))();

local Window1 = library:CreateWindow("Spawn Items");
local Window2 = library:CreateWindow("Other");
local Window3 = library:CreateWindow("Teleports");
Window1:Button("Spawn Apple",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Apple")
end);

Window1:Button("Spawn Cookie",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Cookie")
end);

Window1:Button("Spawn Pizza Slice",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Pizza2")
end);

Window1:Button("Spawn Chips",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Chips")
end);

Window1:Button("Spawn BloxyCola",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("BloxyCola")
end);

Window1:Button("Spawn MedKit",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("MedKit")
end);

Window1:Button("Spawn Planks",function()
local RefreshPlanks = game:GetService("ReplicatedStorage").RemoteEvents.RefreshPlanks
RefreshPlanks:FireServer()
end);

Window1:Button("Give Bat",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Bat")
end);

Window1:Button("Spawn Pie",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Pie")
end);

Window1:Button("Spawn Key",function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Key")
end);

Window2:Button("God Mode",function()
while wait() do
local Energy = game:GetService("ReplicatedStorage").RemoteEvents.Energy
Energy:FireServer(
	15,
	"Apple"
)
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Apple")
end
end);

Window2:Button("Heal Others",function()
game:GetService("ReplicatedStorage").RemoteEvents.GiveTool:FireServer("Cure")
wait(1)
if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Cure") then 
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Cure") then 
            game:GetService("ReplicatedStorage").RemoteEvents.BackpackEvent:FireServer("Equip", game:GetService("Players").LocalPlayer.Backpack.Cure)
        else
            game:GetService("ReplicatedStorage").RemoteEvents.GiveTool:FireServer("Cure")
            wait(0.1)
        end
    end
wait(1)
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
game:GetService("ReplicatedStorage").RemoteEvents.CurePlayer:FireServer(v)
end
end);

Window2:Button("Delete Items",function()
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
     if v:IsA("Tool") then
          v:Destroy()
     end
end
end);

Window2:Button("Kill Bad Guys",function()
while wait() do 
     for i,v in pairs(game.Workspace.BadGuys:GetChildren()) do
          game:GetService("ReplicatedStorage").RemoteEvents.HitBadguy:FireServer(v, 8)
     end
end
end);

Window2:Button("Unlock Basement",function()
local UnlockDoor = game:GetService("ReplicatedStorage").RemoteEvents.UnlockDoor
UnlockDoor:FireServer()
end);

Window3:Button("Attic",function()
local plr = game:service"Players".LocalPlayer;
local tween_s = game:service"TweenService";
local info = TweenInfo.new(3,Enum.EasingStyle.Quad);
function tp(...)
   local tic_k = tick();
   local params = {...};
   local cframe = CFrame.new(params[1],params[2],params[3]);
   local tween,err = pcall(function()
       local tween = tween_s:Create(plr.Character["HumanoidRootPart"],info,{CFrame=cframe});
       tween:Play();
   end)
   if not tween then return err end
end
tp(-16, 35, -220);
end);

Window3:Button("Basement",function()
local plr = game:service"Players".LocalPlayer;
local tween_s = game:service"TweenService";
local info = TweenInfo.new(3,Enum.EasingStyle.Quad);
function tp(...)
   local tic_k = tick();
   local params = {...};
   local cframe = CFrame.new(params[1],params[2],params[3]);
   local tween,err = pcall(function()
       local tween = tween_s:Create(plr.Character["HumanoidRootPart"],info,{CFrame=cframe});
       tween:Play();
   end)
   if not tween then return err end
end
tp(71, -15, -163);
end);

Window3:Button("Boss Room",function()
local plr = game:service"Players".LocalPlayer;
local tween_s = game:service"TweenService";
local info = TweenInfo.new(3,Enum.EasingStyle.Quad);
function tp(...)
   local tic_k = tick();
   local params = {...};
   local cframe = CFrame.new(params[1],params[2],params[3]);
   local tween,err = pcall(function()
       local tween = tween_s:Create(plr.Character["HumanoidRootPart"],info,{CFrame=cframe});
       tween:Play();
   end)
   if not tween then return err end
end
tp(-39, -287, -1480);
end);

Window3:Button("House",function()
local plr = game:service"Players".LocalPlayer;
local tween_s = game:service"TweenService";
local info = TweenInfo.new(3,Enum.EasingStyle.Quad);
function tp(...)
   local tic_k = tick();
   local params = {...};
   local cframe = CFrame.new(params[1],params[2],params[3]);
   local tween,err = pcall(function()
       local tween = tween_s:Create(plr.Character["HumanoidRootPart"],info,{CFrame=cframe});
       tween:Play();
   end)
   if not tween then return err end
end
tp(-36, 3, -200);
end);

Window3:Button("Sewer",function()
local plr = game:service"Players".LocalPlayer;
local tween_s = game:service"TweenService";
local info = TweenInfo.new(3,Enum.EasingStyle.Quad);
function tp(...)
   local tic_k = tick();
   local params = {...};
   local cframe = CFrame.new(params[1],params[2],params[3]);
   local tween,err = pcall(function()
       local tween = tween_s:Create(plr.Character["HumanoidRootPart"],info,{CFrame=cframe});
       tween:Play();
   end)
   if not tween then return err end
end
tp(129, 3, -125);
end);

Window3:Button("Store",function()
local plr = game:service"Players".LocalPlayer;
local tween_s = game:service"TweenService";
local info = TweenInfo.new(3,Enum.EasingStyle.Quad);
function tp(...)
   local tic_k = tick();
   local params = {...};
   local cframe = CFrame.new(params[1],params[2],params[3]);
   local tween,err = pcall(function()
       local tween = tween_s:Create(plr.Character["HumanoidRootPart"],info,{CFrame=cframe});
       tween:Play();
   end)
   if not tween then return err end
end
tp(-422, 3, -121);
end);

Window3:Button("Secret Place",function()
local plr = game:service"Players".LocalPlayer;
local tween_s = game:service"TweenService";
local info = TweenInfo.new(3,Enum.EasingStyle.Quad);
function tp(...)
   local tic_k = tick();
   local params = {...};
   local cframe = CFrame.new(params[1],params[2],params[3]);
   local tween,err = pcall(function()
       local tween = tween_s:Create(plr.Character["HumanoidRootPart"],info,{CFrame=cframe});
       tween:Play();
   end)
   if not tween then return err end
end
tp(-2440.78882, 1404.80518, -1918.61902);
end);