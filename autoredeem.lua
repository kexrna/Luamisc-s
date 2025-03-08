local Codes = game:GetService("HttpService"):JSONDecode(readfile("Codes.json"))
local currencyFolder = game:GetService("Players").LocalPlayer:WaitForChild("DataFolder"):WaitForChild("Currency")

local initialMoney = currencyFolder.Value
local totalMoneyGained = 0
local successfulCodes = {}

for _, code in ipairs(Codes) do
    game.ReplicatedStorage.MainEvent:FireServer("EnterPromoCode", code)
    wait(2.5)
    local moneyObtained = currencyFolder.Value - initialMoney
    if moneyObtained > 700 then
        table.insert(successfulCodes, {code = code, money = moneyObtained}) 
        totalMoneyGained = totalMoneyGained + moneyObtained
    end
    initialMoney = currencyFolder.Value
    wait(1.5)
end

table.foreach(successfulCodes, print)