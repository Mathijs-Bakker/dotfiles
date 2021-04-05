-- Try-catch like function:
function TrySource(str)
  local is_success = pcall(require, str)

  if not is_success then
    print('Failed to source: ' .. str)
    return
  end
end

