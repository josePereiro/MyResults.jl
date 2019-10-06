get_versions(res_name::AbstractString) =
    Core.find_versions(get_working_dir(), res_name);
function get_version(res_name::AbstractString, ver_num::Int)
    vers = get_versions(res_name);
    if 0 < ver_num <= length(vers)
        return vers[ver_num];
    else
        error("$(ver_num) is not a valid ver number, it must be "*
            "between 0 and $(length(vers))!!!")
    end
end

has_versions(res_name::AbstractString) = length(get_versions(res_name)) > 0;

get_last_version(res_name::AbstractString) = get_versions(res_name)[end];
