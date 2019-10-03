function set_working_dir(dir::AbstractString)
    validate_results_dir(dir);
    global working_dir = dir;
end
