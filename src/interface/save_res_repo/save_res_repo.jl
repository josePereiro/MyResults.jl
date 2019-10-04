include("create_res_repo.jl");
include("update_res_repo.jl");

function save_results(res_name, data;
    desc_comment = "",
    overwrite = false,
    new_version = false,
    source_paths = [],
    ver = 0)

    # working_dir
    working_dir = get_working_dir();

    version_count = Core.get_res_version_count(working_dir, res_name);
    if new_version || version_count == 0 # New version
        comment = desc_comment == ""?"New repo!!!":desc_comment;
        create_res_repo(working_dir, res_name, data, comment, source_paths)
    elseif overwrite # overwrite versions


        # res_dir
        res_dir = Core.get_last_res_version_dir(working_dir, res_name);
        if !isdir(res_dir) error("Repo $(res_dir) not found!!!"); end

        # Update res
        update_res_repo(res_dir, data, desc_comment, source_paths);

    else
        error("A result repo already exist with this name $(res_name), "*
        "use the 'overwrite' keyword to update the last version or "*
        "the 'new_version' keyword to create a new version!!!")
    end

end
