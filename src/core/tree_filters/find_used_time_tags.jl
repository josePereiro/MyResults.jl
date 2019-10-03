function find_used_time_tags(working_dir)
    repos = find_repos(working_dir);
    return extract_res_time_tag.(basename.(repos));
end
