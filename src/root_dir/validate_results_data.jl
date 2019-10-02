function validate_results_data(working_dir)
    aux_file_path = build_aux_file_path(working_dir);
    validate_aux_file(aux_file_path);
    validate_aux_data(aux_file_path);
    return working_dir;
end
