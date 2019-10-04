function filter_over_all_repos(working_dir, filter_fun)
    repos = find_repos(working_dir);
    res = Vector{AbstractString}();
    for repo in repos
        filter_all_subpaths!(repo, filter_fun, res);
    end
    return res;
end
