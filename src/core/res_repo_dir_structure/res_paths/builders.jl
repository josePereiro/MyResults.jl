build_res_dir_path(working_dir, res_ider) =
    joinpath(working_dir, build_res_dir_name(res_ider));
build_res_dir_path(working_dir, res_name, time_tag) =
    build_res_dir_path(working_dir, build_res_ider(res_name, time_tag));

build_res_source_dir_path(working_dir, res_ider) =
    joinpath(build_res_dir_path(working_dir, res_ider), res_source_dir_name);
build_res_source_dir_path(working_dir, res_name, time_tag) =
    build_res_source_dir_path(working_dir, build_res_ider(res_name, time_tag));

build_res_data_file_path(working_dir, res_ider) =
    joinpath(build_res_dir_path(working_dir, res_ider),
        build_res_data_file_name(res_ider));
build_res_data_file_path(working_dir, res_name, time_tag) =
    build_res_data_file_path(working_dir, build_res_ider(res_name, time_tag));

build_res_desc_file_path(working_dir, res_ider) =
    joinpath(build_res_dir_path(working_dir, res_ider),
        build_res_desc_file_name(res_ider));
build_res_desc_file_path(working_dir, res_name, time_tag) =
    build_res_desc_file_path(working_dir, build_res_ider(res_name, time_tag));
