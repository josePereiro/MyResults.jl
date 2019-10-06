load_result_comment(res, ver::Union{Void, Int, String} = nothing) =
    return Core.get_desc_comment(Core.load_res_desc(get_loadable_repo(res, ver)));

load_result_log(res, ver::Union{Void, Int, String} = nothing) =
    return Core.get_desc_log(Core.load_res_desc(get_loadable_repo(res, ver)));

load_result_data(res, ver::Union{Void, Int, String} = nothing) =
    return Core.load_res_data(get_loadable_repo(res, ver));



function get_loadable_repo(res, ver::Union{Void, Int, String} = nothing)
    if Core.is_valid_res_repo_name(res) # is_valid_res_repo_name (true)
        if ver != nothing # ver (true)
            if Core.is_valid_time_tag(ver) # is_valid_time_tag (true)
                repo = parse_repo(res, ver);
                if Core.repo_exist(repo)
                    return repo;
                else
                    error("Repo $(repo.res_dir) not found!!!")
                end
            else # is_valid_time_tag (false)
                if has_versions(res)
                    if isa(ver, Int)
                        return get_version(res, ver)
                    else
                        error("'$(ver)' must be an Int for be a ver_num")
                    end
                else
                    error("There are any version repo called '$(res)'!!!")
                end
            end # end is_valid_time_tag
        else # ver (false)
            error("You most specify a 'ver_num' or a valid 'time_tag'!!!")
        end # end ver
    else # is_valid_res_repo_name (false)
        if ver != nothing Core.validate_res_name(res) end;
        res = extract_basename(res);
        if Core.is_valid_res_dir(res) # is_valid_res_dir (true)
            repo = parse_repo(res);
            if Core.repo_exist(repo)
                return repo;
            else
                error("Repo $(repo.res_dir) not found!!!")
            end
        else # is_valid_res_dir (false)
            Core.validate_res_dir(res);
        end # end is_valid_res_dir
    end
end
