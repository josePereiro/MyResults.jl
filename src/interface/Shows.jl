function show_versions(res_name::AbstractString;
        start = 1, window = 10,
        cpreview_l = 200)
    res_name = extract_basename(res_name);
    versions = Core.find_versions(get_working_dir(), res_name);
    println("Found $(length(versions)) version(s) for $(res_name), showing from $(start)");
    println();
    c = 1;
    for (i, v) in enumerate(versions)
        i < start && continue;
        println(i, ": ", basename(v.res_dir), " tt: ", Core.strf_time_tag(v.time_tag));
        comment = Core.get_desc_comment(Core.load_res_desc(v));
        print("   ")
        length(comment) > cpreview_l && println(comment[1:cpreview_l], " ...");
        length(comment) <= cpreview_l && println(comment);
        println();
        c == window && return;
        c += 1;
    end
end

function show_repo(res, ver::Union{Void, Int, String} = nothing; log_lw = 20)
    repo = get_loadable_repo(res, ver);
    println(basename(repo.res_dir), " tt: ", Core.strf_time_tag(repo.time_tag));
    println();
    println("Comment ----------------------------------------------");
    println(Core.get_desc_comment(Core.load_res_desc(repo)));
    println();
    println("Log Frgment----------------------------------------------");
    println("(...)")
    log = split(Core.get_desc_log(Core.load_res_desc(repo)),"\n");
    length(log) <= log_lw && for logline in log println(logline); end
    length(log) > log_lw && for logline in log[end - log_lw:end] println(logline); end
end

function show_repos(; cpreview_l = 200)
    repos = Core.find_repos(get_working_dir());

    for (i, repo) in enumerate(repos)
        println(i, ": ", basename(repo.res_dir), " tt: ", Core.strf_time_tag(repo.time_tag));
        comment = Core.get_desc_comment(Core.load_res_desc(repo));
        print("   ")
        length(comment) > cpreview_l && println(comment[1:cpreview_l], " ...");
        length(comment) <= cpreview_l && println(comment);
        println();
    end
end
