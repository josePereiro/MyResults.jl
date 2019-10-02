function create_aux_file(aux_file_path)
    data = Dict(used_time_tags_key => Vector{String}(),
        repo_creation_date_key => string(now()),
        repo_last_modification_date_key => "");
    save_aux_data(aux_file_path, data);
end
