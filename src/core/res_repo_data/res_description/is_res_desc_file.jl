is_res_desc_file(path) = isfile(path) && has_valid_ider(basename(path)) &&
    extract_res_file_ext(basename(path)) == res_desc_file_ext;
