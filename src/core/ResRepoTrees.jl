
const tt_rn_sep = ".v";
const res_source_dir_name = "source";
const res_data_file_ext = ".data.jld2";
const res_desc_file_ext = ".desc.jld2";

#=
    A struct representing a result repository file system.
=#
struct ResRepoTree
    res_name::AbstractString;
    time_tag::Int;
    parent_dir::AbstractString;
    res_dir::AbstractString;
    desc_file::AbstractString;
    data_file::AbstractString;
    source_dir::AbstractString;
    function ResRepoTree(parent_dir, rn::ResName, tt::TimeTag)
        res_name = rn.res_name;
        time_tag = tt.time_tag;
        res_ider = string(res_name, tt_rn_sep, time_tag);
        res_dir = joinpath(parent_dir, res_ider);
        desc_file = joinpath(res_dir, string(res_ider, res_desc_file_ext));
        data_file = joinpath(res_dir, string(res_ider, res_data_file_ext));
        source_dir = joinpath(res_dir, res_source_dir_name);
        new(res_name, time_tag, parent_dir, res_dir, desc_file, data_file, source_dir);
    end
end

function Base.parse(::Type{ResRepoTree}, s::AbstractString)
    base_s = basename(s);
    dirname_s = dirname(s);
    if is_valid_res_dir(base_s)
        res_name = extract_res_name(base_s);
        time_tag = extract_time_tag(base_s);
        return ResRepoTree(dirname(s), res_name, time_tag);
    elseif is_valid_res_repo_name(base_s)
        return ResRepoTree(dirname_s, base_s);
    else
        validate_res_dir(base_s);
    end
end

ResRepoTree(working_dir, res_name, time_tag) = ResRepoTree(working_dir, ResName(res_name), TimeTag(time_tag));
ResRepoTree(working_dir, res_name::ResName) = ResRepoTree(working_dir, res_name, TimeTag());
ResRepoTree(working_dir, res_name) = ResRepoTree(working_dir, ResName(res_name), TimeTag());
ResRepoTree(res::AbstractString) = parse(ResRepoTree, res);


# Tools
extract_res_name(res_dir) =
    ResName(String(split(basename(res_dir), tt_rn_sep)[1]));

extract_time_tag(res_dir) =
    TimeTag(String(split(basename(res_dir), tt_rn_sep)[2]));

sort_by_time_tag(rrs::Vector{ResRepoTree}) =
    [rrs[find_by_time_tag(rrs, tt)] for tt in sort!([rr.time_tag for rr in rrs])];

find_by_time_tag(rrs::Vector{ResRepoTree}, tt::Int) =
    findfirst((rr) -> rr.time_tag == tt, rrs);
find_by_time_tag(rrs::Vector{ResRepoTree}, tt::TimeTag) =
    find_by_time_tag(rrs, tt.time_tag);
