const aux_file_name = ".aux_file.jld2";
const aux_data_key = "aux_data";

build_aux_file_path(working_dir) = joinpath(working_dir, aux_file_name);
get_aux_file_path() = validate_aux_file(build_aux_file_path(get_working_dir()));
get_aux_data() = validate_aux_data(get_aux_file_path());

function read_aux_data(aux_file_path)
    try
        data = FileIO.load(aux_file_path)[aux_data_key];
    catch err
        if isa(err, SystemError)
            error("Not found");
        elseif isa(err, KeyError)
            println("Key not found");
        end
    end
end
