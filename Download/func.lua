
function Sleep(n)
    os.execute("sleep " .. tonumber(n))
end

function table.length(tb)
    local i = 0
    for key, value in pairs(tb) do i = i + 1 end
    return i
end

function table.removeFromData(tb, conditionFunc)
    if tb ~= nil and next(tb) ~= nil then
        for key, value in pairs(tb) do
            if value == conditionFunc then table.remove(tb, key) end
        end
    end
end
