using MyResults;

@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end

include("res_repo_tests/res_repo_tests.jl");
