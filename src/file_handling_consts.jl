# Names
const package_name = "MyResults";
    const aux_files_dir_name = "Aux";
        const used_time_tags_aux_file_name = "used_time_tags";
    const results_dir_name = "Results";
        const results_data_dir_name = "Data";
        const results_desc_dir_name = "Data";
        const results_data_dir_name = "Data";


# Extentions
const data_file_ext = ".jld2";
const aux_file_ext = ".aux" * data_file_ext;
const res_data_file_ext = ".data" * data_file_ext;
const res_desc_file_ext = ".desc" * data_file_ext;


# Paths
#### Package Dir
const package_dir_path = Pkg.dir(package_name);
#### Aux Files Dir
    const aux_files_dir_path = joinpath(package_dir_path, aux_files_dir_name);
####### used time tag file
        const used_time_tags_file_path =
            joinpath(aux_files_dir_path, used_time_tags_aux_file_name * aux_file_ext)
#### Results Dir
    const results_dir_path = joinpath(package_dir_path, results_dir_name)
######## Data Dir
        const results_data_dir_path = joinpath(results_dir_path, results_data_dir_name)

const missing_desc_file_err_msg = "Description missing!!!";
data_key = "data";
desc_key = "description";
