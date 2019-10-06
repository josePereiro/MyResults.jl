# res_name
function validate_res_name(res_name::AbstractString)
    for (i,c) in enumerate(res_name)
        if !isalnum(c) && all(c .!= allowed_res_name_non_alphanumeric_chars)
            error("res_name not valid!!!, '$(res_name)' must contain only alphanumeric or this "*
                "$(allowed_res_name_non_alphanumeric_chars) characters!!! The problem was found in the "*
                "$(i)th char '$(c)'!!!");
        end
    end
    return res_name;
end

# time_tag
function validate_time_tag(time_tag)
    template = string(generate_time_tag_int());
    time_tag = string(time_tag);
    if length(template) != length(time_tag)
        error("time_tag '$(time_tag)' has not the desired length!!!")
    elseif !all(isnumber, time_tag)
        error("time_tag '$(time_tag)' must have only numeric chars!!!")
    end
    return time_tag;
end

# res directory
function validate_res_dir(res_dir)
    spt = split(basename(res_dir), tt_rn_sep);
    if length(spt) > 0
        validate_res_name(spt[1]);
        if length(spt) > 1
            validate_time_tag(spt[2]);
            return res_dir;
        end
    end
    error("'$(basename(res_dir))' is not a valid dir "*
        "name for a result repocitory")
    return (spt[1], spt[2]);
end

# repo_tree
function validate_res_repo_tree(rr::ResRepoTree)
    if !isdir(rr.res_dir) error("$(rr.res_dir) not found or unreachable!!!"); end
    if !isdir(rr.source_dir) error("$(rr.source_dir) not found or unreachable!!!"); end
    if !isfile(rr.desc_file) error("$(rr.desc_file) not found or unreachable!!!"); end
    if !isfile(rr.data_file) error("$(rr.desc_file) not found or unreachable!!!"); end
end
