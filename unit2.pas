unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, FormUnit;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ColorDialog1: TColorDialog;
    ColorDialog2: TColorDialog;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);
begin
  initValue(Edit1.Text,Edit2.Text,Button2.Color, Button3.Color);
  Close;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
   Button2.Color:=ColorDialog1.Color;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
        if ColorDialog2.Execute then
           Button3.Color:=ColorDialog2.Color;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin

end;


end.

