res_desc_log_ms(time_tag, ms) = "$(time_tag_to_string(time_tag)): $(ms)";
function res_desc_log_creation_ms(time_tag, comment)
    ms = res_desc_log_ms(time_tag, "Results repo created!!!");
    ms *= "\n";
    ms *= res_desc_log_comment_updated_ms(time_tag, comment);
    ms *= "\n";
    ms *= res_desc_log_data_updated_ms(time_tag);
    ms *= "\n";
    ms *= res_desc_log_source_updated_ms(time_tag);
end
res_desc_log_comment_updated_ms(time_tag, new_comment = "") =
    res_desc_log_ms(time_tag, "Comment updated!!! $(new_comment)");
res_desc_log_data_updated_ms(time_tag) = res_desc_log_ms(time_tag, "Data updated!!!");
res_desc_log_source_updated_ms(time_tag) = res_desc_log_ms(time_tag, "Source updated!!!");
