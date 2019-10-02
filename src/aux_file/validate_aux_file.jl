function validate_aux_file(aux_file_path)
    if !isfile(aux_file_path)
        error("$(aux_file_path) does not exist or it is not a file, this can be solved calling resolve!!!")
    end
    return aux_file_path;
end
