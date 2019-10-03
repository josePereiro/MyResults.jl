function update_res_repo(res_ider, data;
        desc_comment = "",
        source_paths = [])

    # working_dir
    working_dir = get_working_dir();

    # res_dir
    res_dir = joinpath(working_dir, res_ider);
    if !isdir(res_dir) error("Repo $(res_dir) not found!!!"); end

    # now_time_tag
    now_time_tag = Core.generate_time_tag();

    # data
    res_data_file_path = Core.build_res_data_file_path(working_dir, res_name, time_tag);
    Core.save_res_data(res_data_file_path, data);
    Core.log_data_changed!(res_data_file_path, now_time_tag);

    # desc_comment
    if desc_comment != ""
        res_desc_file_path = Core.build_res_desc_file_path(working_dir, res_name, time_tag);
        Core.save_res_desc_comment!(res_desc_file_path, desc_comment);
        Core.log_desc_comment!(res_desc_file_path, now_time_tag, desc_comment);
    end

    # source
    if !isempty(source_paths)
        res_source_dir_path = Core.build_res_source_dir_path(working_dir, res_name, time_tag);
        Core.clear_res_source()
    end

end
