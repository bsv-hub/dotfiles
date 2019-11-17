local config = import("micro/config")

function init()
    -- linter.makeLinter("php", "php", "php", {"-l", "%f"}, "%m in %f on line %l")
    config.MakeCommand("format-php", function(bp, args)
        bp:Save()
        -- runLinter(bp.Buf)
    end, config.NoComplete)
end
