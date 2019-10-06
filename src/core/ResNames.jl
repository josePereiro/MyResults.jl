const allowed_res_name_non_alphanumeric_chars = ['_'];

#
# An String representing the Readeble name of the result repo
#
struct ResName
    res_name::AbstractString
    function ResName(resname::AbstractString)
        validate_res_name(resname);
        new(resname);
    end
end

Base.string(rn::ResName) = string(rn.res_name);
