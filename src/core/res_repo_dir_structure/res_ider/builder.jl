# A res identifier (res_ider) is composed by a custom name (res_name)
# and a time generated tag (time_tag)
build_res_ider(res_name::String, time_tag::Int) = string(validate_res_name(res_name),
    res_name_time_tag_separator, time_tag);
