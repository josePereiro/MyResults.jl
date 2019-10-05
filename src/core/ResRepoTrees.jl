
const tt_rn_sep = ".v";
const res_source_dir_name = "source";
const res_data_file_ext = ".data.jld2";
const res_desc_file_ext = ".desc.jld2";

"""
    A struct representing a result repository file system.
"""
struct ResRepoTree
    res_name::AbstractString;
    time_tag::Int;
    res_dir::AbstractString;
    desc_file::AbstractString;
    data_file::AbstractString;
    source_dir::AbstractString;
    function ResRepoTree(working_dir, rn::ResName, tt::TimeTag)
        res_name = rn.res_name;
        time_tag = tt.time_tag;
        res_ider = string(res_name, tt_rn_sep, time_tag);
        res_dir = joinpath(working_dir, res_ider);
        desc_file = joinpath(res_dir, string(res_ider, res_desc_file_ext));
        data_file = joinpath(res_dir, string(res_ider, res_data_file_ext));
        source_dir = joinpath(res_dir, res_source_dir_name);
        new(res_name, time_tag, res_dir, desc_file, data_file, source_dir);
    end
end

ResRepoTree(working_dir, res_name, time_tag) = ResRepoTree(working_dir, ResName(res_name), TimeTag(time_tag));

ResRepoTree(working_dir, res_name::ResName) = ResRepoTree(working_dir, res_name, TimeTag());
ResRepoTree(working_dir, res_name) = ResRepoTree(working_dir, ResName(res_name), TimeTag());

function ResRepoTree(res_dir::AbstractString)
    validate_res_dir(res_dir);
    res_name = extract_res_name(res_dir);
    time_tag = extract_time_tag(res_dir);
    return ResRepoTree(dirname(res_dir), res_name, time_tag);
end

function validate_res_dir(res_dir)
    spt = split(basename(res_dir), tt_rn_sep);
    if length(spt) != 2 error("'$(basename(res_dir))' is not a valid dir "*
        "name for a result repocitory") end
    validate_res_name(spt[1]);
    validate_time_tag(spt[2]);
    return res_dir;
end

function is_valid_res_dir(res_dir)
    try validate_res_dir(res_dir)
        return true;
    catch return false; end
end

function extract_res_name(res_dir)
    ResName(String(split(basename(res_dir), tt_rn_sep)[1]));
end

function extract_time_tag(res_dir)
    TimeTag(String(split(basename(res_dir), tt_rn_sep)[2]));
end

function validate_res_repo_tree(rr::ResRepoTree)
    if !isdir(rr.res_dir) error("$(rr.res_dir) not found or unreachable!!!"); end
    if !isdir(rr.source_dir) error("$(rr.source_dir) not found or unreachable!!!"); end
    if !isfile(rr.desc_file) error("$(rr.desc_file) not found or unreachable!!!"); end
    if !isfile(rr.data_file) error("$(rr.desc_file) not found or unreachable!!!"); end
end

function is_valid_res_repo_tree(rr::ResRepoTree)
    try validate_res_repo_tree(rr)
        return true;
    catch return false; end
end

function is_valid_res_repo_tree(res_dir)
    try rr = ResRepoTree(res_dir)
        return is_valid_res_repo_tree(rr);
    catch return false; end
end

sort_by_time_tag(rrs::Vector{ResRepoTree}) =
    [rrs[find_by_time_tag(rrs, tt)] for tt in sort!([rr.time_tag for rr in rrs])];

find_by_time_tag(rrs::Vector{ResRepoTree}, tt::Int) =
    findfirst((rr) -> rr.time_tag == tt, rrs);
find_by_time_tag(rrs::Vector{ResRepoTree}, tt::TimeTag) =
    find_by_time_tag(rrs, tt.time_tag);
