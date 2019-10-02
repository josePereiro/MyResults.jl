"""
    init a repo in the specified directory. If it does not exist, it will
    create the required dirs.
"""
function init_rep(working_dir; verbose = true)
    if isdir(working_dir)
        aux_file_path = build_aux_file_path(working_dir);
        create_aux_file(aux_file_path);
        # resolve(verbode = false)
        verbose && info("Repo ready to be used!!!");
    else
        mkpath(working_dir)
        verbose && info("$(working_dir) created!!!");
        init_rep(working_dir); # recursive call
    end
end
