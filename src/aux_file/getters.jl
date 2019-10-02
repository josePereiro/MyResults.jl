get_aux_file_path() = validate_aux_file(build_aux_file_path(get_working_dir()));
get_aux_data() = validate_aux_data(get_aux_file_path());
get_aux_data(key) = get_aux_data()[key];

#
# const repo_creation_date_key = "repo_creation_date";
# const repo_last_modification_date_key = "repo_last_modification_date";

get_used_time_tags() = get_aux_data(used_time_tags_key);
