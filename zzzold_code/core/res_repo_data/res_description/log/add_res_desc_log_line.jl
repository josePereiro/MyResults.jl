function add_res_desc_log_line!(res_desc_path, ms)
    desc = load_res_desc(res_desc_path);
    desc[res_desc_log_key] *= "\n$(ms)";
    save_res_desc(res_desc_path, desc);
end
