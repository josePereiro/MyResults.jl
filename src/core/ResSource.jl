function add_res_source!(repo::ResRepoTree, sources::Vector)
    for src in sources
        dst = joinpath(repo.source_dir, basename(src));
        cp(src, dst, follow_symlinks = true, remove_destination = true);
    end
end

function clear_res_source!(repo::ResRepoTree)
    for src in readdir(repo.source_dir)
        rm(joinpath(repo.source_dir, basename(src)), force = true, recursive = true)
    end
end

function set_res_source!(repo::ResRepoTree, sources::Vector)
    clear_res_source!(repo);
    add_res_source!(repo, sources);
end
