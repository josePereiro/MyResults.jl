extract_res_name(res) = String(split(res,res_name_time_tag_separator)[1]);
extract_res_time_tag(res) = String(split(res, res_name_time_tag_separator)[2]);
extract_res_file_ext(res) = String(split(res, res_name_time_tag_separator)[3]);
extract_res_ider(res) = build_res_ider(extract_res_name(res), extract_res_time_tag(res));
