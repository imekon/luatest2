# Lua Test

This is a simple Lua interpreter setup with Lua binaries from Lua.org and a Free Pascal application. To build it, you simply need to install Free Pascal then enter:

fpc luatest.pas

It should build a Windows or Linux version of this tool.

To exit, use 'quit' or 'exit'

To examine memory usage, use 'memory'

To enter commands simply type them in, as in 'print(10)'

If you want to enter commands across multiple lines, use '\\' to extend the lines, as in:

for i=1,10 do \\

print(i) \\

end

lua54.pas came from https://github.com/malcome/Lua4Lazarus

Pete Goodwin
