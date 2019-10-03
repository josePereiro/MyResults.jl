function validate_time_tag(time_tag)
    template = string(generate_time_tag());
    time_tag = string(time_tag);
    if length(template) != length(time_tag)
        error("$(time_tag) has not the desired length!!!")
    elseif !all(isnumber, time_tag)
        error("$(time_tag) must have only numeric chars!!!")
    end
end
