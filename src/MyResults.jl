module MyResults

module Core
    import FileIO;
    include("core/core.jl");
end  # module Core

module Interface
    import MyResults.Core;
    include("interface/interface.jl")
end # module Interface

include("exports.jl");
include("default_results_dir.jl");
include("exports.jl");
set_working_dir_to_default();

end  # module Results
