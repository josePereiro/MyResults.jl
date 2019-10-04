const tag_factor = 1_000_000;

struct TimeTag
    time_tag::Int;
    function TimeTag(timetag::Int)
        validate_time_tag(timetag);
        new(timetag);
    end
end

TimeTag() = TimeTag(generate_time_tag_int());
TimeTag(timetag::String) = TimeTag(parse(Int, timetag));

Base.string(tt::TimeTag) = string(tt.time_tag);

function validate_time_tag(time_tag)
    template = string(generate_time_tag_int());
    time_tag = string(time_tag);
    if length(template) != length(time_tag)
        error("$(time_tag) has not the desired length!!!")
    elseif !all(isnumber, time_tag)
        error("$(time_tag) must have only numeric chars!!!")
    end
    return time_tag;
end

generate_time_tag_int() = round(Int, time() * tag_factor);
