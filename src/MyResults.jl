module MyResults

import FileIO;

# module Core

# include("core/working_dir/working_dir.jl");
include("core/resolve/resolve.jl");
include("core/time_tag/time_tag.jl");
include("core/res_description/res_description.jl");
include("core/res_names/res_names.jl");
include("core/res_paths/res_paths.jl");
include("core/create_res_repo/create_res_repo.jl");
include("core/tree_exploration/tree_exploration.jl");


# end  # module Core


end  # module Results
