function find_res_repo_versions_dir_paths(working_dir, res_name)
    filter = (path) -> isdir(path) &&
        extract_res_name(path) == extract_res_name(res_name);
    return filter_all_subpaths!(working_dir, filter, Vector{AbstractString}());
end
find_res_repo_versions_dir_paths(res_name) =
find_res_repo_versions_dir_paths(get_working_dir(), res_name);
