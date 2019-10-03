include("create_res_repo.jl");
# include("update_res_repo.jl")

function save_results(res_name, data;
    desc_comment = "",
    overwrite = false,
    source_paths = [],
    ver = 0
    )

    # working_dir
    working_dir = get_working_dir();

    version_count = Core.get_res_version_count(working_dir, res_name);
    if version_count == 0 # New result
        comment = desc_comment == ""?"New repo!!!":desc_comment;
        create_res_repo(working_dir, res_name, data, comment, source_paths)
    else # Exist versions


        # res_dir
        res_dir = joinpath(working_dir, res_ider);
        if !isdir(res_dir) error("Repo $(res_dir) not found!!!"); end


    end

end
