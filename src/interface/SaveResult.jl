function save_result!(res::AbstractString;
        data = nothing,
        comment::Union{Void,AbstractString} = nothing,
        sources::Union{Void,Vector} = nothing,
        new_version::Bool = false,
        overwrite::Bool = false,
        version_num::Union{Void,Int} = nothing)

    # Repo
    repo = parse_repo(res);

    # Chekig keywords
    if overwrite && new_version error("'overwrite' and 'new_version' can't be both true!!!") end
    if new_version && version_num != nothing
        error("'new_version' can't be true if you specify a 'version_num'!!!") end

    # Creating or updating
    if Core.repo_exist(repo) # repo_exist (true)
        if overwrite # overwrite (true)
            update_res_repo!(repo, data, comment, sources);
            println("Repo $(repo.res_dir) updated!!!");
            return repo;
        else # overwrite (false)
            error("Repo $(repo.res_dir) already exist, "*
                "Use 'overwrite' keyword for update it!!!");
        end # end overwrite
    else # repo_exist (false)
        if Core.has_versions(repo) # has_versions (true)
            if new_version # new_version (true)
                create_res_repo!(repo, data, comment, sources);
                println("New version of '$(repo.res_name)' created: $(repo.res_dir)!!!")
                return repo;
            else # new_version (false)
                if version_num != nothing # given version_num (true)
                    version = get_version(repo.res_name, version_num);
                    update_res_repo!(version, data, comment, sources);
                    println("Update repo version $(version_num): $(version.res_dir)")
                    return version;
                else # given version_num (false)
                    if overwrite # overwrite (true)
                        last_version = get_last_version(repo.res_name);
                        update_res_repo!(last_version, data, comment, sources);
                        println("Updated last version: $(last_version.res_dir)");
                        return last_version;
                    else # overwrite (false)
                        error("Res name '$(repo.res_name)' has many versions, "*
                                "Use 'overwrite' keyword for update the last one, or "*
                                "the 'version_num' keyword to specify the version number you "*
                                "wants to update!!!.")
                    end # end overwrite
                end # end given version_num
            end # end new version
        else # has_versions (false)
            create_res_repo!(repo, data, comment, sources);
            println("New version of '$(repo.res_name)' created: $(repo.res_dir)!!!")
            return repo;
        end # end has_versions
    end # end repo_exist
end

function update_res_repo!(res_repo, data, comment, sources)

    # desc
    res_desc = Core.load_res_desc(res_repo);
    Core.add_desc_log_line!(res_desc, "-----------------------");
    Core.add_desc_log_line!(res_desc, "Updating Repo!!!");
    change = false;

    # data
    if data != nothing
        Core.save_res_data!(res_repo, data);
        Core.add_desc_log_line!(res_desc, "Data size, after update: $(sizeof(data)) byte(s)");
        change = true;
    end

    # desc_comment
    if comment != nothing
        if comment != Core.get_desc_comment(res_desc)
            Core.set_desc_comment!(res_desc, comment);
            Core.add_desc_log_line!(res_desc, "New comment: $(comment)");
            change = true;
        end
    end

    # sources
    if sources != nothing
        Core.set_res_source!(res_repo, sources);
        Core.add_desc_log_line!(res_desc, "Sources updated, links: $(sources)");
        change = true;
    end

    !change && Core.add_desc_log_line!(res_desc, "Nothing updated!!!");
    Core.save_res_desc!(res_repo, res_desc);
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
