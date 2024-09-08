{$H+}

program luatest;

uses
  sysutils, lua54;

var
  running: boolean;
  error: integer;
  state: plua_state;
  line, combined, lower: string;
  heapStatus: THeapStatus;

begin
  running := true;
  state := lual_newstate;
  lual_openlibs(state);

  WriteLn(LUA_VERSION_);
  WriteLn;

  combined := '';

  while running do
  begin
    if Length(combined) = 0 then
      Write('> ')
    else
      Write('- ');

    ReadLn(line);

    lower := LowerCase(line);
    if (lower = 'quit') or (lower = 'exit') then
      running := false
    else
    if lower = 'memory' then
    begin
      heapStatus := GetHeapStatus;
      WriteLn('Total Addressable: ' + IntToStr(heapStatus.TotalAddrSpace));
      WriteLn('Total uncommitted: ' + IntToStr(heapStatus.TotalUncommitted));
      WriteLn('Total committed:   ' + IntToStr(heapStatus.TotalCommitted));
      WriteLn('Total allocated:   ' + IntToStr(heapStatus.TotalAllocated));
      WriteLn('Total free:        ' + IntToStr(heapStatus.TotalFree));
      WriteLn('Unused:            ' + IntToStr(heapStatus.Unused));
      WriteLn('Overhead:          ' + IntToStr(heapStatus.Overhead));
      WriteLn('Last Error Code:   ' + IntToStr(heapStatus.HeapErrorCode));
    end
    else
    begin
      if AnsiLastChar(line) = '\' then
      begin
        combined := combined + LeftStr(line, Length(line) - 1);
      end
      else
      begin
        error := lual_dostring(state, PChar(combined + line));
        if error <> 0 then
        begin
          WriteLn('ERROR: ' + lua_tostring(state, -1));
          lua_pop(state, 1);
        end;

        combined := '';
      end;
    end;
  end;

  lua_close(state);

  WriteLn('Press RETURN...');
  ReadLn;
end.


