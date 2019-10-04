working_dir = nothing;

function set_working_dir(dir::AbstractString)
    if !isdir(dir)
        error("$(dir) not found!!!")
    end
    global working_dir = dir;
end


function get_working_dir()
    if working_dir == nothing
        error("You must first defined the working_dir!!!")
    elseif !isdir(working_dir)
        error("$(working_dir) not found!!!")
    end
    return working_dir;
end
