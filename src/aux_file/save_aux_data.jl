save_aux_data(aux_file_path, data) = FileIO.save(aux_file_path, aux_data_key, data);
save_aux_data(data) = save_aux_data(get_aux_file_path(), data);
