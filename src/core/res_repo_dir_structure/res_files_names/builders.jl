build_res_data_file_name(res_name, time_tag) =
    string(build_res_ider(res_name, time_tag), res_name_time_tag_separator,
    res_data_file_ext);
build_res_desc_file_name(res_name, time_tag) =
    string(build_res_ider(res_name, time_tag), res_name_time_tag_separator,
    res_desc_file_ext);