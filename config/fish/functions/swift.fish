function swift
  set -l PATH /System/Library/Frameworks/Python.framework/Versions/Current/bin $PATH
  xcrun swift $argv
end
