function add_time_tag(tag)
    data = get_aux_data();
    push!(data[used_time_tags_key], string(tag));
    save_aux_data(data);
end
