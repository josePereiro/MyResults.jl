function get_res_version_dir(working_dir, res, version::Int)
    res_name = extract_res_name(res);
    versions = sort(find_res_repo_versions(working_dir, res_name))[version];
end

function get_last_res_version_dir(working_dir, res)
    res_name = extract_res_name(res);
    versions = sort(find_res_repo_versions(working_dir, res_name))[end];
end

function get_res_version_count(working_dir, res)
    res_name = extract_res_name(res);
    versions = length(find_res_repo_versions(working_dir, res_name));
end
