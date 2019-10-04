function find_res_repo_versions(working_dir, res_name)
    repos = find_repos(working_dir);
    filter_fun =
        (path) -> extract_res_name(basename(path)) == extract_res_name(basename(res_name));
    return filter(filter_fun, repos);
end
