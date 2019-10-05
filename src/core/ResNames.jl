
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

function validate_res_name(res_name::AbstractString)
    for (i,c) in enumerate(res_name)
        if !isalnum(c) && all(c .!= allowed_res_name_non_alphanumeric_chars)
            error("res_name not valid!!!, '$(res_name)' must contain only alphanumeric or this "*
                "$(allowed_res_name_non_alphanumeric_chars) characters!!! The problem was found in the "*
                "$(i)th char '$(c)'!!!");
        end
    end
    return res_name;
end

function is_valid_res_repo_name(res_name::AbstractString)
    try validate_res_name(res_name)
        return true;
    catch return false; end
end
