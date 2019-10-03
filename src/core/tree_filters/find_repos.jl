function find_repos(working_dir)
    filter_fun = (path) -> isdir(path) && has_valid_ider(basename(path));
    return filter(filter_fun , joinpath.(working_dir, readdir(working_dir)));
end
