function TrySource(filename)
  local is_success = pcall(require, filename)

  if not is_success then
    print('Failed to source: ' .. filename)
    local trace = debug.traceback()
    print(trace)
    return
  end
end
