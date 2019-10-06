function is_valid_res_repo_name(res_name::AbstractString)
    try validate_res_name(res_name)
        return true;
    catch return false; end
end

function is_valid_res_dir(res_dir::AbstractString)
    try validate_res_dir(res_dir)
        return true;
    catch return false; end
end

function is_valid_res_repo_tree(rr::ResRepoTree)
    try validate_res_repo_tree(rr)
        return true;
    catch return false; end
end
is_valid_res_repo_tree(res_dir::AbstractString) =
    is_valid_res_repo_tree(ResRepoTree(res_dir))

function is_valid_time_tag(time_tag)
    try validate_time_tag(time_tag)
        return true;
    catch return false; end
end

repo_exist(rr::ResRepoTree) =
    is_valid_res_repo_tree(rr);

has_versions(rr::ResRepoTree) =
    length(find_versions(rr.parent_dir, rr.res_name)) > 0;

has_only_one_version(rr::ResRepoTree) =
    length(find_versions(rr.parent_dir, rr.res_name)) == 1;


# titi delicioso te quiero un poquito mas si me dices que me rio bonito mayor igual que Daniela.
# Esos serian los paraolimpicos de la risa, asi q mira a ver que vas a decir.....
