function parse_repo(res::AbstractString)
    res_name = extract_basename(res);
    working_dir = get_working_dir();
    res_dir = joinpath(working_dir, res_name);
    if Core.is_valid_res_dir(res_dir)
        return Core.ResRepoTree(res_dir)
    elseif Core.is_valid_res_repo_name(res_name)
        return Core.ResRepoTree(working_dir, res_name);
    else
        Core.validate_res_dir(res_dir);
    end
end

function extract_basename(res::AbstractString)
    res_name = basename(res);
    res != res_name && warn("Only the file name $(res_name) is taken, the rest is ignored!!! "*
        "The current working_dir is $(working_dir)");
    return res_name;
end
