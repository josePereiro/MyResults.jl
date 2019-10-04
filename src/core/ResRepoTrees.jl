
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
    res_ider = basename(res_dir);
    res_name = ResName(String(split(res_ider, tt_rn_sep)[1]));
    time_tag = TimeTag(String(split(res_ider, tt_rn_sep)[2]));
    return ResRepoTree(dirname(res_dir),
        res_name, time_tag);
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

get_res_name(rr::ResRepoTree) = ResRepoTree.res_name;
