function validate_ider(res)
    res_name = extract_res_name(res);
    res_time_tag = extract_res_time_tag(res);
    validate_res_name(res_name);
    validate_time_tag(res_time_tag);
    return res;
end
