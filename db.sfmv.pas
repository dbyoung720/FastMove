unit db.sfmv;
{
  功能：super fast move
  时间：2021-10-01
  作者：dbyoung@sina.com
}

interface

function move_sse(dest: Pointer; const src: Pointer; len: Cardinal): Pointer; cdecl; external {$IFDEF WIN32} name '_memcpy_fast_sse' {$ELSE} name 'memcpy_fast_sse' {$ENDIF};
function move_avx(dest: Pointer; const src: Pointer; len: Cardinal): Pointer; cdecl; external {$IFDEF WIN32} name '_memcpy_fast_avx' {$ELSE} name 'memcpy_fast_avx' {$ENDIF};

implementation

{$IFDEF WIN32}
{$LINK obj\MoveSSE_x86.obj}
{$LINK obj\MoveAVX_x86.obj}
{$ELSE}
{$LINK obj\MoveSSE_x64.obj}
{$LINK obj\MoveAVX_x64.obj}
{$ENDIF}

end.
