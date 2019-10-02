function load_result_data(file_name::String)
    file_name = get_res_full_path(file_name);
    if isfile(file_name)
        return FileIO.load(file_name)[data_key];
    end
    error("$(file_name) not found");
end

function load_result_description(file_name::String)
    file_name = get_desc_full_path(file_name);
    if isfile(file_name)
        return FileIO.load(file_name)[desc_key];
    end
    error("$(file_name) not found");
end

import FileIO;
import Rath2017PhD.Paths;
include("params.jl");
function rename!(old_name::String, new_name::String; overwrite = false)
    old_desc_name = get_desc_full_path(old_name);
    new_desc_name = get_desc_full_path(new_name);
    old_name = get_res_full_path(old_name)
    new_name = get_res_full_path(new_name);
    if isfile(old_name)
        !overwrite && isfile(new_name) && error("File $(new_name)"*
            " already exist!!! use overwrite keyword to obviously overwrite!!!")
        # moving res
        FileIO.mv(old_name, new_name, remove_destination = true);
        # moving desc
        if isfile(old_desc_name)
            FileIO.mv(old_desc_name, new_desc_name, remove_destination = true);
        else
            FileIO.save(new_desc_name, desc_key, get_default_description());
        end
    else
        error("$(old_name) not found");
    end
end

function save_result(file_res::String, data, description::String; force = false)
    res_path = get_res_full_path(file_res);
    desc_path = get_desc_full_path(file_res);
    !force && isfile(res_path) && error("File $(res_path)"*
        " already exist!!! use force keyword to overwrite!!!")
    FileIO.save(res_path, data_key, data);
    FileIO.save(desc_path, desc_key, description * get_default_description());
    println("Saved as $res_path");
end
save_result(file_name::String, data; description = get_default_description(), force = false) =
    save_result(file_name, data, description; force = force);

get_default_description() = " || Modified at $(now())";

function parse_basename(file_name, ext)
    !is_basename(file_name) && warn("$(file_name)"*
        " contain a parent dir!!!"*
        " We'll take only the basename $(basename(file_name))!!!")
    return add_ext(basename(file_name), ext);
end

exist_file(file_name) = isfile(get_res_full_path(file_name));

get_res_full_path(file_name) = joinpath(Paths.results_path, parse_basename(file_name, res_file_ext));
get_desc_full_path(file_name) = joinpath(Paths.descriptions_path, parse_basename(file_name, desc_file_ext));
list_results() = get_ext_files(Paths.results_path, res_file_ext);
list_desc_files() = get_ext_files(Paths.descriptions_path, res_file_ext);


function add_ext(file_name, ext_to_add)
    ext = extension(file_name);
    if ext != ""
        return replace(file_name, ext => ext_to_add);
    else
        return file_name *= ext_to_add;
    end
end

extension(file_name::String) = try match(r"\.[A-Za-z0-9]+$", file_name).match catch "" end

is_basename(basename) = dirname(basename) == "";

function status()
    res_names = basename.(list_results());
    for (i, name) in enumerate(res_names)
        desc = missing_desc_file_err_msg;
        try desc = load_result_description(name); catch end
        println("----------------------------------------------------");
        println(i, ": ", name)
        println("--------------------------------------");
        println();
        println(desc);
        println();
    end
end

get_ext_files(dir_path, ext) = filter((f) -> endswith(f, ext), readdir(dir_path));

function remove!(file_name)
    res_path = get_res_full_path(file_name);
    desc_path = get_desc_full_path(file_name);
    rm(res_path; force = true);
    rm(desc_path; force = true);
    println("$res_path was deleted!!!")
end

function edit_description!(file_name, description)
    res_path = get_res_full_path(file_name);
    desc_path = get_desc_full_path(file_name);
    if exist_file(file_name)
        FileIO.save(desc_path, desc_key, description * get_default_description());
    else
        error("$file_name not found!!!")
    end
end
