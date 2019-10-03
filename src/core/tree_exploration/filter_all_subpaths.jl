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
            filter_all_paths!(sub, filter_fun, container);
        end
    end

    return container;
end
