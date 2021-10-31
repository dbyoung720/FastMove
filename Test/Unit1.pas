unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    mmoLog: TMemo;
    btn3: TButton;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    Fintlen         : Integer;
    FMemSrc, FMemDst: Pointer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses System.Diagnostics, mormot.core.base, db.sfmv;

const
  c_intTimes = 1000000;

procedure TForm1.btn1Click(Sender: TObject);
var
  I: Integer;
begin
  with TStopwatch.StartNew do
  begin
    for I := 0 to c_intTimes - 1 do
    begin
      Move(FMemSrc^, FMemDst^, Fintlen);
    end;
    mmoLog.Lines.Add(Format('Sys RTL Move Times: %0.3d ms', [ElapsedMilliseconds]));
  end;
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  I: Integer;
begin
  with TStopwatch.StartNew do
  begin
    for I := 0 to c_intTimes - 1 do
    begin
      MoveFast(FMemSrc^, FMemDst^, Fintlen);
    end;
    mmoLog.Lines.Add(Format('mORMot2 Move Times: %0.3d ms', [ElapsedMilliseconds]));
  end;
end;

procedure TForm1.btn3Click(Sender: TObject);
var
  I: Integer;
begin
  with TStopwatch.StartNew do
  begin
    for I := 0 to c_intTimes - 1 do
    begin
      move_avx(FMemDst, FMemSrc, Fintlen);
    end;
    mmoLog.Lines.Add(Format('FastAVX Move Times: %0.3d ms', [ElapsedMilliseconds]));
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Fintlen := 1024;
  FMemSrc := AllocMem(Fintlen);
  FMemDst := AllocMem(Fintlen);
  FillChar(FMemSrc^, Fintlen, #65);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeMem(FMemSrc);
  FreeMem(FMemDst);
end;

end.
