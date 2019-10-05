function save_result!(res::AbstractString;
        data = nothing,
        comment::Union{Void,AbstractString} = nothing,
        sources::Union{Void,Vector} = nothing,
        new_version::Bool = false,
        overwrite::Bool = false,
        version::Union{Void,Int} = nothing)

    # Repo
    repo = parse_repo(res);

    # versions
    res_versions = Core.find_res_repo_versions(working_dir, repo.res_name);

    if new_version || length(res_versions) < 1 # New version control point
         # println("A new version must be created!!!");
         create_res_repo!(repo, data, comment, sources);
    elseif overwrite # overwrite control point
        if version == nothing
            println("The last version must be updated!!!");
        else
            println("An old version must be updated!!!");
        end
    else
        error("A result repo already exist with this name $(res). "*
        "Use the 'overwrite' keyword to indicate you wanna update an old version. "*
        "Additionally, you can use the 'version' keyword to indicate the exact "*
        "version you want to modified. If not specified, the last one will be selected. "*
        "The keyword 'new_version' will do what the name suggest :)")
    end

end

function update_res_repo(res_repo, data, comment, sources)

    # data
    if data != nothing
        Core.save_res_data!(new_repo, data);
        Core.add_desc_log_line!(res_desc, "Data size, afer update: $(sizeof(data)) byte(s)");
    end

    # dec_comment
    if comment != nothing
        res_desc = load_res_desc(res_repo);
        if comment != get_desc_comment(res_desc)
            set_desc_comment!(res_desc, comment);
            Core.save_res_desc!(new_repo, res_desc);
            Core.add_desc_log_line!(res_desc, "New comment: $(comment)");
        end
    end

    # sources
    if sources != nothing
        set_res_source!(res_repo, sources);
        Core.add_desc_log_line!(res_desc, "Sources updated, links: $(sources)");
    end

end

function create_res_repo!(new_repo, data, comment, sources)

    # Cheking
    if new_repo.time_tag <= Core.find_used_max_time_tag(working_dir);
        error("Something was wrong with the time_tag!!! "*
        "The currect system time is not compatible with the time_tags of "*
        " the stored res repos!!!"); end
    if data == nothing error("nothing to save!!!, use the 'data' "*
        "keyword to save somthing different to nothing") end


    # Description
    res_desc = Core.ResDesc();
    if comment == nothing comment = "Nothing to comment!!!" end
    Core.set_desc_comment!(res_desc, comment);
    Core.add_desc_log_line!(res_desc, "REPO CREATED!!!");
    Core.add_desc_log_line!(res_desc, "First Comment: $(comment)");
    Core.add_desc_log_line!(res_desc, "Data size: $(sizeof(data)) byte(s)");
    Core.add_desc_log_line!(res_desc, "Sources linked: $(sources)");

    # Creating
    mkpath(new_repo.res_dir);
    mkpath(new_repo.source_dir);
    Core.save_res_desc!(new_repo, res_desc);
    Core.save_res_data!(new_repo, data);
    sources != nothing && Core.set_res_source!(new_repo, sources);
    return new_repo;
end
