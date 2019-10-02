function validate_aux_data(aux_file_path)
    data = read_aux_data(aux_file_path);
    if isa(data, Dict)
        error("$(aux_file_path) data is corrupt, "*
            "it can be solved with resolve!!!")
    end
    return data;
end
