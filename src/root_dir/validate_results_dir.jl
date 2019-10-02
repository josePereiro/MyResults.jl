function validate_results_dir(working_dir)
    if working_dir == nothing
        error("You must first defined the working_dir!!!")
    elseif !isdir(working_dir)
        error("$(working_dir) does not exist or it is not a directory!!!")
    end
    return working_dir;
end
