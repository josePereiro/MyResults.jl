function clear_res_source(res_source_dir_path)
    for sub in readdir(res_source_dir_path)
        rm(joinpath(res_source_dir_path, sub), force = true, recursive = true)
    end
end
