const tag_factor = 1_000_000;

struct TimeTag
    time_tag::Int;
    function TimeTag(timetag::Int)
        validate_time_tag(timetag);
        new(timetag);
    end
end

TimeTag() = TimeTag(generate_time_tag_int());
TimeTag(timetag::AbstractString) = TimeTag(parse(Int, timetag));

Base.string(tt::TimeTag) = string(tt.time_tag);

generate_time_tag_int() = round(Int, time() * tag_factor);

strf_time_tag(tt::TimeTag) = Libc.strftime(tt.time_tag / tag_factor);
strf_time_tag(tt) = strf_time_tag(TimeTag(tt));
