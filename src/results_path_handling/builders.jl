build_res_dir_path(res_name, time_tag) =
    joinpath(get_working_dir(), build_res_dir_name(res_name, time_tag));

build_res_data_file_path(res_name, time_tag) =
    joinpath(build_res_dir_path(res_name, time_tag), build_res_data_file_name(res_name, time_tag));

build_res_desc_file_path(res_name, time_tag) =
    joinpath(build_res_dir_path(res_name, time_tag), build_res_desc_file_name(res_name, time_tag));

build_res_source_dir_path(res_name, time_tag) =
    joinpath(build_res_dir_path(res_name, time_tag), res_source_dir_name);
