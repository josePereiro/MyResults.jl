function update_res_repo(res_dir, data,
        desc_comment, source_paths)

    println("Updating!!!")

    # working_dir
    working_dir = get_working_dir();

    # res_dir
    if !isdir(res_dir) error("Repo $(res_dir) not found!!!"); end

    # res_ider
    res_ider = Core.extract_res_ider(basename(res_dir));

    # now_time_tag
    now_time_tag = Core.generate_time_tag();

    # desc_comment
    res_desc_file_path = Core.build_res_desc_file_path(working_dir, res_ider);
    if desc_comment != ""
        Core.save_res_desc_comment!(res_desc_file_path, desc_comment);
        Core.log_desc_comment!(res_desc_file_path, now_time_tag, desc_comment);
    end

    # data
    res_data_file_path = Core.build_res_data_file_path(working_dir, res_ider);
    Core.save_res_data(res_data_file_path, data);
    Core.log_data_changed!(res_desc_file_path, now_time_tag);

    # source
    res_source_dir_path = Core.build_res_source_dir_path(working_dir, res_ider);
    if !isempty(source_paths)
        Core.clear_res_source(res_source_dir_path);
        Core.copy_res_source(res_source_dir_path, source_paths);
        Core.log_source_changed!(res_desc_file_path, now_time_tag)
    end

end
