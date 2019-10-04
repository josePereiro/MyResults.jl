function get_working_dir()
    if working_dir == nothing
        error("You must first defined the working_dir!!!")
    elseif !isdir(working_dir)
        error("$(working_dir) not found!!!")
    end
    return working_dir;
end
