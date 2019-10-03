function update_desc_comment!(res_desc_path, new_comment)
    desc = load_res_desc(res_desc_path);
    desc[res_desc_comment_key] = new_comment;
    save_res_desc(res_desc_path, desc);
    log_comment_updated!(res_desc_path, generate_time_tag(), new_comment);
end