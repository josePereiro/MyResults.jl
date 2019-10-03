function generate_time_tag()::Int128
    tag = round(Int128, time() * tag_factor);
    if tag <= last_tag
        error("It was generated a ")
    end
    global last_tag = tag;
    return tag;
end
