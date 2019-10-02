function set_working_dir(dir::AbstractString)
    validate_results_dir(dir);
    validate_results_data(dir);
    global working_dir = dir;
end
