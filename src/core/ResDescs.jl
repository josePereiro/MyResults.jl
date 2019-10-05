const res_desc_key = "desc";
const res_desc_comment_key = "comment";;
const res_desc_log_key = "log";

struct ResDesc
    desc_dict::Dict
    function ResDesc()
        desc_dict = Dict();
        desc_dict[res_desc_comment_key] = "";
        desc_dict[res_desc_log_key] = "";
        return new(desc_dict);
    end
    function ResDesc(desc_dict::Dict)
        validate_res_desc_dict(desc_dict);
        return new(desc_dict)
    end
end

get_desc_log(resdesc::ResDesc) = resdesc.desc_dict[res_desc_log_key];
get_desc_comment(resdesc::ResDesc) = resdesc.desc_dict[res_desc_comment_key];

add_desc_log_line!(resdesc::ResDesc, log_line::AbstractString) =
    resdesc.desc_dict[res_desc_log_key] *= "$(now()): $(log_line)\n";

set_desc_comment!(resdesc::ResDesc, new_comment::AbstractString) =
    resdesc.desc_dict[res_desc_comment_key] = new_comment;

load_res_desc(repo::ResRepoTree) =
    FileIO.load(repo.desc_file)[res_desc_key];

save_res_desc!(repo::ResRepoTree, resdesc::ResDesc) =
    FileIO.save(repo.desc_file, res_desc_key, resdesc);
