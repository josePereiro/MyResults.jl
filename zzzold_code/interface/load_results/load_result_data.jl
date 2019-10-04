

function load_result_data(res_name, ver_num)
    working_dir = get_working_dir();
    version_count = Core.get_res_version_count(working_dir, res_name);
end
