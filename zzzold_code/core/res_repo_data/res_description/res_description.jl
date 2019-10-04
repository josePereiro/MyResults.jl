# The description file keep track of all modifications performed over the repo.
# It will store a user comment abount the data stored!!! Any comment update will
# be tracked in the description log!!!
# Important, all the methods implemented in this section will use the full
# description file path.

include("consts.jl");
include("builder.jl");
include("load_and_save/load_res_desc.jl");
include("load_and_save/save_res_desc.jl");
include("is_res_desc_file.jl");


include("log/log_ms.jl");
include("log/logs.jl");
include("log/add_res_desc_log_line.jl");
include("log/load_res_desc_log.jl");
include("log/save_res_desc_log.jl");


include("comment/save_res_desc_comment.jl");
include("comment/load_res_desc_comment.jl");
