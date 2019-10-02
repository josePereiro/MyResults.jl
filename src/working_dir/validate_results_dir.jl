function validate_results_dir(working_dir)
    if working_dir == nothing
        error(undefined_dir_ms())
    elseif !isdir(working_dir)
        error(dir_not_found_ms(working_dir))
    end
    return working_dir;
end
