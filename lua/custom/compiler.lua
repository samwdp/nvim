local M = {}
local extension_to_compile_command = {
    c = "gcc ",
    cpp = "g++ ",
    csproj = "dotnet build ",
    cs = "dotnet build ",
    sln = "dotnet build ",
    zig = "zig build run",
    odin = "odin run ",
    rs = "cargo run",
    go = "go run ",
    py = "python3 ",
}

local types = {"cs", "sln", "csproj", "rs", "go", "odin", "zig" }
function M.compile_command()
    -- get all files in current working directory and put into a variable called files
    -- local files = vim.fn.globpath(vim.fn.getcwd(), "**/*.{lua}", false, true)
    local files = vim.fn.glob("**/*.{" .. table.concat(types, ",") .. "}", false, true)
    -- sort files by length where shortest is first
    table.sort(files, function(a, b)
        return #a < #b
    end)

    local command = "make -k "
    for _, file in ipairs(files) do
        local extension = file:match("^.+(%..+)$")
        if extension then
            local c = extension_to_compile_command[string.sub(extension, 2)]
            command = extension_to_compile_command[string.sub(extension, 2)]
            break
        end
    end
    return command
end

return M
