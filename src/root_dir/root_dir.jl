working_dir = nothing;

function get_working_dir()
     validate_results_dir(working_dir);
     validate_results_data(working_dir);
 end
function set_working_dir(dir::AbstractString)
    validate_results_dir(dir);
    validate_results_data(dir);
    global working_dir = dir;
end
