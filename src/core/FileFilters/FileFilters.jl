function find_repos(working_dir)
    filter_fun = (path) -> isdir(path) && is_valid_res_repo_tree(path);
    return filter(filter_fun , joinpath.(working_dir, readdir(working_dir)));
end

function filter_over_all_repos(working_dir, filter_fun)
    repos = find_repos(working_dir);
    res = Vector{AbstractString}();
    for repo in repos
        filter_all_subpaths!(repo, filter_fun, res);
    end
    return res;
end
