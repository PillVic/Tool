require("githead"):setup()

function Linemode:file_info()
  return string.format("%s   %s", self:size(), self:mtime())
end
