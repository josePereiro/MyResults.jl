module MyResults

module Core
import FileIO;
include("core/core.jl");
end  # module Core

module Interface
    import Core;
    include("inteface/inteface.jl")
end



end  # module Results
