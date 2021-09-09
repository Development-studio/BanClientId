local name = {["5D0EC22B2E1D4A54865A2D9461A89E20"] = true}

mc.listen("onPreJoin", function(pl)
    local A = pl:getDevice()
    local E = A.clientId
    if name[E] then
        print('Ban "' .. pl.name .. '"')
        pl:disconnect("§l§cВаше устройство забанено на сервере")
        pl:kick("§l§cВаше устройство забанено на сервере")
    end
end)

print('[\27[92mCRON\27[0m] \27[93mBanClientId loaded\27[0m')
