function find_res_repo_versions_dir_paths(working_dir, res_name)
    filter = (path) -> isdir(path) &&
        extract_res_name(basename(path)) == extract_res_name(basename(res_name));
    return filter_all_subpaths!(working_dir, filter, Vector{AbstractString}());
end
