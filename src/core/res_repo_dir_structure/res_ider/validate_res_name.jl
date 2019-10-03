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
