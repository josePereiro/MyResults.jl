function read_aux_data(aux_file_path)
    try
        data = FileIO.load(aux_file_path)[aux_data_key];
    catch err
        if isa(err, SystemError)
            error(missing_aux_file_ms(aux_file_path));
        elseif isa(err, KeyError)
            error(corrupted_aux_file_ms(aux_file_path));
        end
    end
end
