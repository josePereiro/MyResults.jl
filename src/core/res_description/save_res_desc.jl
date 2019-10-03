function save_res_desc(res_desc_path, desc::Dict)
    FileIO.save(res_desc_path, res_desc_key, desc);
end
