-- lol
return setmetatable({}, {
    __index = function()
        return function(...)
            return "CrackedByPew";
        end;
    end
})
