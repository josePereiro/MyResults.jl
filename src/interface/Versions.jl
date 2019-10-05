function show_versions(res_name::AbstractString;
        start = 1, window = 10,
        cpreview_l = 200)
    res_name = extract_basename(res_name);
    versions = Core.find_res_repo_versions(get_working_dir(), res_name);
    println("Found $(length(versions)) version(s) for $(res_name), showing from $(start)");
    println();
    c = 1;
    for (i, v) in enumerate(Core.sort_by_time_tag(versions))
        i < start && continue;
        println(i, ": ", basename(v.res_dir));
        comment = Core.get_desc_comment(Core.load_res_desc(v));
        print("   ")
        length(comment) > cpreview_l && println(comment[1:cpreview_l], " ...");
        length(comment) <= cpreview_l && println(comment);
        println();
        c == window && return;
        c += 1;
    end
end

function get_versions(res_name::AbstractString)
    versions = Core.find_res_repo_versions(get_working_dir(), res_name);
    return [rr.res_dir for rr in
        Core.sort_by_time_tag(versions)];
end
