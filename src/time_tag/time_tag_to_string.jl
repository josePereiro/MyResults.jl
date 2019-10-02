time_tag_to_string(time_tag::Number) = Libc.strftime(time_tag / tag_factor);
time_tag_to_string(time_tag) = time_tag_to_string(parse(Int, time_tag));
