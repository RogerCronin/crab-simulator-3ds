local audio_manager = {}

local sources = {}

-- TODO pick up audio manager

function audio_manager.update()
    local to_remove = {}
    for file_name, source in pairs(sources) do
        -- if marked for deletion
        if not source[1]:isPlaying() and source[2] then
            to_remove[#to_remove + 1] = file_name
        end
    end

    for _, file_name in ipairs(to_remove) do
        sources[file_name][1]:release()
        sources[file_name] = nil
    end
end

function audio_manager.register(file_name, loop, stream_type)
    local source = love.audio.newSource(file_name, stream_type or "static")
    source:setLooping(loop or false)

    sources[source] = {source, false}

    return source
end

function audio_manager.play(source, loop, stream_type)
    if type(source) == "string" then
        source = audio_manager.register(source, loop, stream_type)
    end

    sources[file_name][1]:play()
    sources[file_name][2] = true
end

function audio_manager.stop(source)
    sources[source][1]:stop()
    sources[source][2] = true
end

return audio_manager