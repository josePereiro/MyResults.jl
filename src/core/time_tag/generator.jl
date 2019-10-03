function generate_time_tag()
    tag = round(Int, time() * tag_factor);
    if tag <= last_tag
        error("It was generated a ")
    end
    global last_tag = tag;
    return tag;
end
