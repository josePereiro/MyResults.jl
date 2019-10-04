log_comment_changed!(res_desc_path, time_tag, new_comment = "") =
    add_res_desc_log_line!(res_desc_path, res_desc_log_comment_changed_ms(time_tag, new_comment));

log_data_changed!(res_desc_path, time_tag) =
    add_res_desc_log_line!(res_desc_path, res_desc_log_data_changed_ms(time_tag));

log_source_changed!(res_desc_path, time_tag) =
    add_res_desc_log_line!(res_desc_path, res_desc_log_source_changed_ms(time_tag));

log_desc_comment!(res_desc_path, time_tag, new_comment) =
    add_res_desc_log_line!(res_desc_path,
        res_desc_log_comment_changed_ms(time_tag, new_comment));
