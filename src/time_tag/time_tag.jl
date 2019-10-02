last_tag = 0;
tag_factor = 1_000_000;
function generate_time_tag()
    tag = round(Int128, time() * tag_factor);
    if tag <= last_tag
        tag = last_tag + 1;
    end
    global last_tag = tag;
    return tag;
end

strf_tag_time(time_tag::Number) = Libc.strftime(time_tag / tag_factor);
strf_tag_time(time_tag) = strf_tag_time(parse(Int, time_tag));
