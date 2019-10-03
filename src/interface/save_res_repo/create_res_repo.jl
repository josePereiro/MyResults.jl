function create_res_repo(working_dir, res_name, data, desc_comment,
        source_paths = [])

    # time_tag
    max_tag = Core.find_used_max_time_tag(working_dir);
    time_tag = Core.generate_time_tag();
    if time_tag <= max_tag
        error("Something was wrong with the time_tag!!! "*
        "The currect system time is not compatible with the time_tags of "*
        " the stored res repos!!!");
    end

    # res_dir_path
    res_dir_path = Core.build_res_dir_path(working_dir, res_name, time_tag);
    rm(res_dir_path, force = true, recursive = true); # Clear if exist!!!
    mkpath(res_dir_path);

    # res_data_file_path
    res_data_file_path = Core.build_res_data_file_path(working_dir, res_name, time_tag);
    Core.save_res_data(res_data_file_path, data)

    # res_desc_file_path
    res_desc_file_path = Core.build_res_desc_file_path(working_dir, res_name, time_tag);
    Core.save_res_desc(res_desc_file_path, Core.build_description(desc_comment, time_tag));

    # res_source_dir_path
    res_source_dir_path = Core.build_res_source_dir_path(working_dir, res_name, time_tag);
    mkpath(res_source_dir_path);
    Core.copy_res_source(res_source_dir_path, source_paths);

    return res_dir_path;
end
