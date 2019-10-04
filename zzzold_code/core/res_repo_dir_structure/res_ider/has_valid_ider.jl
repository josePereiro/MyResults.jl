function has_valid_ider(res)
    try
        validate_ider(res);
        return true;
    catch
        return false;
    end
end
