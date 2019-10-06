function filter_all_subpaths!(root_dir, filter_fun::Function,
        container::Vector{AbstractString})
    subs = joinpath.(root_dir, readdir(root_dir));
    for sub in subs
        # filter
        if filter_fun(sub)
            push!(container, sub)
        end
        # recursive call
        if isdir(sub)
            filter_all_subpaths!(sub, filter_fun, container);
        end
    end
    return container;
end

function find_repos(working_dir)
    filter_fun = (path) -> isdir(path) && is_valid_res_repo_tree(path);
    return Vector{ResRepoTree}(ResRepoTree.(filter(filter_fun , joinpath.(working_dir, readdir(working_dir)))));
end

find_by_time_tag(working_dir, tt::Int) =
    find_by_time_tag(working_dir, TimeTag(tt));

function filter_over_all_repos(working_dir, filter_fun)
    repos = find_repos(working_dir);
    res = Vector{AbstractString}();
    for repo in repos
        filter_all_subpaths!(repo.res_dir, filter_fun, res);
    end
    return res;
end

function find_used_time_tags(working_dir)
    return sort!([repo.time_tag for repo in find_repos(working_dir)]);
end

function find_used_max_time_tag(working_dir)
    used_time_tags = find_used_time_tags(working_dir);
    if isempty(used_time_tags)
        return -1;
    else
        return last(used_time_tags)
    end
end

find_versions(working_dir, res_name) =
    sort_by_time_tag(filter((_repo) -> _repo.res_name == res_name,
        find_repos(working_dir)));
