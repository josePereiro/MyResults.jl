function validate_aux_file(aux_file_path)
    if !isfile(aux_file_path)
        error(missing_aux_file_ms(aux_file_path))
    end
    return aux_file_path;
end
