# test throws
Test.@test_throws ErrorException MyResults.
    Core.build_res_ider("ItCanNotIncludeTheSeparator"*
        "$(MyResults.Core.res_name_time_tag_separator)", 123);
