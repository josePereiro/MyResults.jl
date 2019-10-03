function log!(res_desc_path, ms)
    desc = load_res_desc(res_desc_path);
    desc[res_desc_log_key] *= "\n$(ms)";
    save_res_desc(res_desc_path, desc);
end

log_comment_updated!(res_desc_path, time_tag, new_comment = "") =
    log!(res_desc_path, res_desc_log_comment_updated_ms(time_tag, new_comment));

log_data_updated!(res_desc_path, time_tag) =
    log!(res_desc_path, res_desc_log_data_updated_ms(time_tag));

log_source_updated!(res_desc_path, time_tag) =
    log!(res_desc_path, res_desc_log_source_updated_ms(time_tag));
