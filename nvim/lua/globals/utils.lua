function TrySource(filename)
  local is_success = pcall(require, filename)

  if not is_success then
    print('Failed to source: ' .. filename)
    local trace = debug.traceback()
    print(trace)
    return
  end
end


-- function IsNotInstalled(plugin_name)
--   local is_installed = pcall(require, plugin_name)
--   if not is_installed then
--     print('Missing: ' .. plugin_name)
--     return true
--   end
-- end

