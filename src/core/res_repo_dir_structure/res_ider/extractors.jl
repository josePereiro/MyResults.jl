extract_res_name(res_name) = split(res_name,
    res_name_time_tag_separator)[1];
extract_res_time_tag(res_name) = split(res_name,
    res_name_time_tag_separator)[2];
extract_res_file_ext(res_name) = split(res_name,
    res_name_time_tag_separator)[3];
