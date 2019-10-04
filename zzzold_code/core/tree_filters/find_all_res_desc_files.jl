function find_all_res_desc_files(working_dir)
    return filter_over_all_repos(working_dir, is_res_desc_file);
end
