unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  FormUnit, Unit2;


type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;
  GameForm : TForm1;
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
begin
  Form1 := TForm1.Create(Nil);
  Form1.Visible:=True;
  newBoard();

  Form1.Label1.Caption := Player1;

end;

procedure TForm2.Button2Click(Sender: TObject);
begin
    Form3 := TForm3.Create(nil);
    Form3.Visible:=True;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  ShowMessage('Igra "6 puta 7". Na tabli 6x7 (7 kolona po 6 polja) dva igraca naizmenicno stavljaju svoje znakove, npr. X i O. Na neko polje se sme staviti znak samo ako su sva polja ispod njega vec popunjena.Pobedjuje igrac koji prvi stavi cetiri svoja znaka u liniji (vertikalno, horizontalno ili dijagonalno). Srecno! *Made by:Sho, Robi Robija(hm) end Wex Englezzz');
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  Form2.Close();
end;

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

end.

