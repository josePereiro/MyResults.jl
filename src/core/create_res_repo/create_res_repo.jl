include("consts.jl")


function create_res_repo(working_dir, res_name, data;
        desc_comment = default_desc_comment,
        source_paths = [],
        overwrite = true)

    # time_tag
    time_tag = generate_time_tag();

    # res_dir_path
    res_dir_path = build_res_dir_path(working_dir, res_name, time_tag);
    mkpath(res_dir_path);

    # res_data_file_path
    res_data_file_path = build_res_data_file_path(working_dir, res_name, time_tag);
    FileIO.save(res_data_file_path, res_data_key, data);

    # res_desc_file_path
    res_desc_file_path = build_res_desc_file_path(working_dir, res_name, time_tag);
    save_res_desc(res_desc_file_path, build_description(desc_comment, time_tag));

    # res_source_dir_path
    res_source_dir_path = build_res_source_dir_path(working_dir, res_name, time_tag);
    mkpath(res_source_dir_path);

    return res_dir_path;
end
