local audio_manager = {}

local sources = {}

function audio_manager.register(file_name, loop)
    sources[file_name] = love.audio.newSource(file_name, "static")
    sources[file_name]:setLooping(loop or false)

    return sources[file_name]
end

function audio_manager.get(file_name)
    return sources[file_name]
end

function audio_manager.play(file_name)
    sources[file_name]:seek(0)
    sources[file_name]:play()
end

function audio_manager.stop(file_name)
    sources[file_name]:stop()
end

return audio_manager
