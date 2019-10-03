function save_res_desc_log!(res_desc_path, log)
    desc = load_res_desc(res_desc_path);
    desc[res_desc_log_key] = log;
    save_res_desc(res_desc_path, desc);
end
