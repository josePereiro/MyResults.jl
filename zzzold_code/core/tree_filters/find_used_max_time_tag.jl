function find_used_max_time_tag(working_dir)
    used_time_tags = parse.(Core.find_used_time_tags(working_dir));
    if isempty(used_time_tags)
        return 0;
    else
        return maximum(used_time_tags)
    end
end
