function validate_aux_data(aux_file_path)
    data = read_aux_data(aux_file_path);
    if !isa(data, Dict) || !(all(haskey.(data, aux_data_format["keys"])))
        error(corrupted_aux_file_ms(aux_file_path))
    end
    return data;
end
