const res_data_key = "data";

load_res_data(repo::ResRepoTree) =
    FileIO.load(repo.data_file)[res_data_key];

save_res_data!(repo::ResRepoTree, data) =
    FileIO.save(repo.data_file, res_data_key, data);
