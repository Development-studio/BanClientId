Cconfig = data.openConfig('.\\plugins\\BanClientId\\config.json', 'json', '{}')

if Cconfig:get('banname') == nil then
    Cconfig:set('banname', {["Alex"] = "5D0EC22B2E1D4A54865A2D9461A89E20"})
end

Banname = Cconfig:get('banname')

function Reload()
    Cconfig:reload()
    Banname = Cconfig:get('banname')
end

mc.listen("onPreJoin", function(pl)
    local A = pl:getDevice()
    local E = A.clientId

    if Banname[pl.name] == E then
        colorLog('red', 'Ban "' .. pl.name .. '"')
        pl:kick(
            "\n\n§l§cВаше устройство забанено на сервере")
    end
end)

mc.regConsoleCmd("banreload", "banreload", function(pl)
    Reload()
    colorLog("green", "Banreload")
end)

print('[\27[92mCRON\27[0m] \27[93mBanClientId loaded\27[0m')
