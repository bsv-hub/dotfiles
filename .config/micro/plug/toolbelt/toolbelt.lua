VERSION = "1.0.0"

local micro = import("micro")
local shell = import("micro/shell")
local config = import("micro/config")
local strings = import("strings")

function commandPalette(bp)
    command = "bash -c \"cat "
        .. config.ConfigDir
        .."/palette.txt | fzf | grep -Po \\\"(?<=^\\[)[^]]*\\\"\""
    local output, err = shell.RunInteractiveShell(command, false, true)
    if err ~= nil then
        micro.InfoBar():Error(err)
        return
    end

    bp:HandleCommand(
        strings.TrimSpace(output)
    )
end

function ranger(bp)
    local currentDir, err = shell.RunCommand("cat /tmp/r-chosen-dir")
    if err ~= nil then
        currentDir = ''
    end

    command = "ranger ".. currentDir .." --choosefile=/tmp/r-chosen-file --choosedir=/tmp/r-chosen-dir"
    local output, err = shell.RunInteractiveShell(command, false, true)
    local filePathToOpen, err = shell.RunCommand("cat /tmp/r-chosen-file")
    local dirPath, err = shell.RunCommand("cat /tmp/r-chosen-dir")

    bp:HandleCommand("open \"" .. filePathToOpen .. "\"")
    bp:HandleCommand("cd \"" .. dirPath .. "\"")
end

function init()
    config.MakeCommand("command-palette", commandPalette, config.NoComplete)
    config.MakeCommand("ranger", ranger, config.NoComplete)

    -- linter.makeLinter("php", "php", "php", {"-l", "%f"}, "%f:%l:%c:.+: %m")
end
