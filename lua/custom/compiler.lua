local M = {}
function M.compile_command()
    local extension_to_compile_command = {
        c = "gcc ",
        cpp = "g++ ",
        h = "gcc ",
        csproj = "dotnet build ",
        sln = "dotnet build ",
        zig = "zig build run",
        zon = "zig build run",
        odin = "odin run ",
        lua = "lua ",
    }
    -- get all files in current working directory and put into a variable called files
    local files = vim.fn.glob("**/*", false, true)
    -- sort files by length where shortest is first
    table.sort(files, function(a, b)
        return #a < #b
    end)

    for _, file in ipairs(files) do
        local extension = file:match("^.+(%..+)$")
        if extension then
            local command = extension_to_compile_command[string.sub(extension, 2)]
            if command then
                return command 
            end
        end
    end
    return "make -k "
end

return M
