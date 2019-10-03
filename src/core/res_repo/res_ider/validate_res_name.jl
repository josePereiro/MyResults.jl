const allowed_chars = ['_'];
function validate_res_name(res_name::AbstractString)
    for (i,c) in enumerate(res_name)
        if !isalnum(c) && all(c .!= allowed_chars)
            error("$(res_name) must contain only alphanumeric plus "*
                "$(allowed_chars) characters!!! The problem is in the "*
                "$(i)th char '$(c)'!!!");
        end
    end
    return res_name;
end
