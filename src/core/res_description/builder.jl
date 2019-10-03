function build_description(comment, time_tag)
    desc = Dict();
    desc[res_desc_comment_key] = comment;
    desc[res_desc_created_key] = time_tag_to_string(time_tag);
    desc[res_desc_modified_key] = time_tag_to_string(time_tag);
    desc[res_desc_log_key] = res_desc_log_creation_ms(time_tag, comment);
    return desc;
end
