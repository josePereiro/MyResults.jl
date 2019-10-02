extract_res_basename(res) = basename(res);
extract_res_name(res) = split(extract_res_basename(res),
    res_name_time_tag_separator)[1];
extract_res_time_tag(res) = split(extract_res_basename(res),
    res_name_time_tag_separator)[2];
extract_res_file_ext(res) = split(extract_res_basename(res),
    res_name_time_tag_separator)[3];
