# function rename!(old_name::AbstractString, new_name::AbstractString)
#     Core.validate_res_name(old_name);
#     Core.validate_res_name(new_name);
#
#     old_repos = get_versions(old_name);
#     new_repos = Core.ResRepoTree.(get_working_dir(), new_name,
#         [rr.time_tag for rr in old_repos]);
#
#     for
#
#     if isfile(old_name)
#         !overwrite && isfile(new_name) && error("File $(new_name)"*
#             " already exist!!! use overwrite keyword to obviously overwrite!!!")
#         # moving res
#         FileIO.mv(old_name, new_name, remove_destination = true);
#         # moving desc
#         if isfile(old_desc_name)
#             FileIO.mv(old_desc_name, new_desc_name, remove_destination = true);
#         else
#             FileIO.save(new_desc_name, desc_key, get_default_description());
#         end
#     else
#         error("$(old_name) not found");
#     end
# end
