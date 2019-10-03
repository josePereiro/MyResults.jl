function set_working_dir(dir::AbstractString)
    if !isdir(dir)
        error("$(dir) not found!!!")
    end
    global working_dir = dir;
end
