parse_repo(res::AbstractString) =
    parse(Core.ResRepoTree, joinpath(get_working_dir(), extract_basename(res)));
parse_repo(res::AbstractString, tt) =
    Core.ResRepoTree(get_working_dir(),res,tt);

function extract_basename(res::AbstractString)
    res_name = basename(res);
    res != res_name && warn("Only the file name $(res_name) is taken, the rest is ignored!!!");
    return res_name;
end
