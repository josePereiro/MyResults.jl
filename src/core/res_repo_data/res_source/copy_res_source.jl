function copy_res_source(res_source_dir_path, sources_to_copy::Vector)
    for src in sources_to_copy
        dst = joinpath(res_source_dir_path, basename(src));
        cp(src, dst, follow_symlinks = true, remove_destination = true);
    end
end
