function save_result!(res_name;
        data = nothing,
        comment = nothing,
        sources = nothing,
        new_version = false,
        overwrite = false,
        version = nothing)


    # Cheking
    # if version != nothing && !isa(sources, Vector)
        # error("sources must be a vector of paths!!!") end
    Core.validate_res_name(res_name);

    # working_dir
    working_dir = get_working_dir();

    # versions
    res_versions = Core.find_res_repo_versions(working_dir, res_name);

    if new_version || length(res_versions) < 1 # New version control point
         # println("A new version must be created!!!");
         create_res_repo!(working_dir, res_name, data, comment, sources);
    elseif overwrite # overwrite control point
        if version == nothing
            println("The last version must be updated!!!");
        else
            println("An old version must be updated!!!");
        end
    else
        error("A result repo already exist with this name $(res_name). "*
        "Use the 'overwrite' keyword to indicate you wanna update an old version. "*
        "Additionally, you can use the 'version' keyword to indicate the exact "*
        "version you want to modified. If not specified, the last one will be selected. "*
        "The keyword 'new_version' will do what the name suggest :)")
    end

end

#TODO finish this
function update_res_repo(args)
    body
end

function create_res_repo!(working_dir, res_name, data, comment, sources)

    # Cheking data
    if data == nothing error("nothing to save!!!, use the 'date' "*
        "keyword to save somthing different to nothing") end

    # NewRepo
    new_repo = Core.ResRepoTree(working_dir, res_name);
    max_tag = Core.find_used_max_time_tag(working_dir);
    if new_repo.time_tag <= max_tag
        error("Something was wrong with the time_tag!!! "*
        "The currect system time is not compatible with the time_tags of "*
        " the stored res repos!!!");
    end

    # Description
    res_desc = Core.ResDesc();
    if comment == nothing comment = "Nothing to comment!!!" end
    Core.set_desc_comment!(res_desc, comment);
    Core.add_desc_log_line!(res_desc, "REPO CREATED!!!");
    Core.add_desc_log_line!(res_desc, "First Comment: $(comment)");

    # Saving
    mkpath(new_repo.res_dir);
    mkpath(new_repo.source_dir);
    Core.save_res_desc!(new_repo, res_desc);
    Core.save_res_data!(new_repo, data);
    if sources != nothing
        Core.set_res_source!(new_repo, sources)
    end
    return new_repo;
end
