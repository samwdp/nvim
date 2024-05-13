return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
        "leoluz/nvim-dap-go"
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup({
            layouts = {
                {
                    elements = {
                        {
                            id = 'scopes',
                            size = 0.25,
                        },
                        {
                            id = 'watches',
                            size = 0.25,
                        },
                        {
                            id = 'breakpoints',
                            size = 0.25,
                        },
                        {
                            id = 'stacks',
                            size = 0.25,
                        },
                    },
                    position = 'left',
                    size = 0.28,
                },
                {
                    elements = {
                        {
                            id = 'repl',
                            size = 0.5,
                        },
                        {
                            id = 'console',
                            size = 0.5,
                        },
                    },
                    position = 'bottom',
                    size = 0.3,
                },
            },
        })
        vim.keymap.set("n", "<leader>tb", dap.toggle_breakpoint, { desc = "[T]oggle [B]reakpoint" })
        vim.keymap.set("n", "<F5>", dap.continue, { desc = "continue" })
        vim.keymap.set("n", "<F9>", dap.step_back, { desc = "step back" })
        vim.keymap.set("n", "<F10>", dap.step_over, { desc = "step over" })
        vim.keymap.set("n", "<F11>", dap.step_into, { desc = "step into" })
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            vim.g.focus_disable = true
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            vim.g.focus_disable = false
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            vim.g.focus_disable = false
            dapui.close()
        end

        require("neodev").setup()
        require('dap-go').setup {
            -- Additional dap configurations can be added.
            -- dap_configurations accepts a list of tables where each entry
            -- represents a dap configuration. For more details do:
            -- :help dap-configuration
            dap_configurations = {
                {
                    -- Must be "go" or it will be ignored by the plugin
                    type = "go",
                    name = "Attach remote",
                    mode = "remote",
                    request = "attach",
                },
            },
            -- delve configurations
            delve = {
                -- the path to the executable dlv which will be used for debugging.
                -- by default, this is the "dlv" executable on your PATH.
                path = "dlv",
                -- time to wait for delve to initialize the debug session.
                -- default to 20 seconds
                initialize_timeout_sec = 20,
                -- a string that defines the port to start delve debugger.
                -- default to string "${port}" which instructs nvim-dap
                -- to start the process in a random available port
                port = "${port}",
                -- additional args to pass to dlv
                args = {},
                -- the build flags that are passed to delve.
                -- defaults to empty string, but can be used to provide flags
                -- such as "-tags=unit" to make sure the test suite is
                -- compiled during debugging, for example.
                -- passing build flags using args is ineffective, as those are
                -- ignored by delve in dap mode.
                build_flags = "",
                -- whether the dlv process to be created detached or not. there is
                -- an issue on Windows where this needs to be set to false
                -- otherwise the dlv server creation will fail.
                detached = true,
                -- the current working directory to run dlv from, if other than
                -- the current working directory.
                cwd = nil,
            },
        }
        dap.adapters.coreclr = {
            type = 'executable',
            command = os.getenv("UserAppData") ..
                "/Local/nvim-data/mason/packages/netcoredbg/netcoredbg/netcoredbg.exe",
            args = { '--interpreter=vscode' }
        }
        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "launch - netcoredbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
                end,
            },
        }
        dap.adapters.chrome = {
            type = "executable",
            command = "node",
            args = { os.getenv("UserAppData") .. "/Local/nvim-data/mason/packages/vscode-chrome-debug/out/src/chromeDebug.js" },
        }

        dap.configurations.javascript = {         -- change this to javascript if needed
            {
                name = "Debug",
                type = "chrome",
                request = "attach",
                program = "${file}",
                cwd = vim.fn.getcwd(),
                sourceMaps = true,
                protocol = "inspector",
                port = 9222,
                webRoot = "${workspaceFolder}"
            }
        }

        dap.configurations.typescript = {         -- change to typescript if needed
            {
                name = "Debug",
                type = "chrome",
                request = "attach",
                program = "${file}",
                cwd = vim.fn.getcwd(),
                sourceMaps = true,
                protocol = "inspector",
                port = 4666,
                webRoot = "${workspaceFolder}"
            }
        }

        dap.adapters.delve = {
            type = 'server',
            port = '${port}',
            executable = {
                command = 'dlv',
                args = { 'dap', '-l', '127.0.0.1:${port}' },
            }
        }

        -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
    end
}
