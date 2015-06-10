unit FormUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons;
const
  NumOfColumn = 6;   {Broj kolona}
  NumOfRow = 7;      {Broj Redova}
  OnMovePlayer : integer = 1;
  Player1 : String = 'Wex';
  Player2 : String = 'Dana';
  Player1cl : TColor =  clRed;
  Player2cl : TColor = clBlue;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure ClickShape(Sender: TObject);
    procedure move(Sender: TObject);
    procedure undo(Sender: TObject);
  //  procedure initValue(a, b: String; c1, c2: TColor);
  private
    { private declarations }
  public
    { public declarations }
  end;

   cells = record
    value : integer;
    shape: TShape;
  end;

  matShapes = array[0..NumOfColumn-1] of array[0..NumOfRow-1] of cells;
         procedure newBoard();
         function isLegalMove(a,b:integer):boolean;
         function winner():integer;
       procedure initValue(a,b:String; c1,c2:TColor);
var
  Form1: TForm1;
  table :matShapes;
  a,b:integer;

implementation

{$R *.lfm}

{ TForm1 }




{ TTable }
procedure initValue(a, b: String; c1, c2: TColor);
begin
     Player1 := a;
     Player2 := b;
     Player1cl := c1;
     Player2cl := c2;
end;

procedure TForm1.ClickShape(Sender: TObject);
{Procedura koja se izvrsava kada se klikne na kvadrat, iz imena kvadrata se naprave
koordinate u matrici, proveri se da li je polje dozvoljeno i ako jete
kvadrat se pretvori u krug i promeni boju, a i b su globalne promenljive
i potez se zavrsava kada se izvrsi procedura move}
var
  err: integer;
  tmp: String;
  legalMove:Boolean;
begin
 if (Button1.Enabled = True) or (Button2.Enabled = True) then
    ShowMessage('Pa nemoj da varas bre, razredni sve vidi!!!')
 else
 begin
     tmp := copy((Sender as TShape).Name, 6, 2);
     val(tmp,a,err);
     b := a mod 10;
     a := a div 10;
     legalMove := isLegalMove(a,b);
 if not(legalMove) then
    ShowMessage('Pa ne tu covece!')
 else begin
 Button1.Enabled:=True;
 Button2.Enabled:=True;
 if OnMovePlayer = 1 then
 begin
     (Sender as TShape).Brush.Color := Player1cl;
     (Sender as Tshape).Shape := stCircle;
 end else begin
        (Sender as TShape).Brush.Color := Player2cl;
        (Sender as TShape).Shape := stCircle;
 end;
 end;
end;
end;

procedure NewBoard();
 {kreira praznu tablu, value u matrici postaje nula, a shape kvadrat 50*50}
 var
    i,j:integer;
 begin
  a:=0;
  b:=0;
   for i:=0 to NumOfColumn-1 do
       for j:=0 to NumOfRow-1 do
           begin
                  table[i][j].value:=0;
                  table[i][j].shape := TShape.Create(Form1);
                  with table[i][j].shape do
                  begin
                         name:= 'Shape'+IntToStr(i)+IntToStr(j);
                         Width:=50;
                         Height:=50;
                         top:= i*50;
                         left := j*50;
                         visible := True;
                         parent:= Form1;
                         shape :=  stRectangle;
                         brush.color := clWhite;
                         brush.Style := bsSolid;
                         pen.Color := clBlack;
                         pen.Width := 1;
                         OnClick :=  @form1.ClickShape;
                  end;
             end;
 end;


 function isLegalMove(a,b:integer):boolean;
 {funkciji se prosledjuju koordinate polja koje igrac zeli da odigra
 ukoliko je to polje legalno za potez funkcija vraca true, u suprotnom
 vraca false}
 begin
  if table[a][b].value = 0 then
  begin
       if (table[a+1][b].value <> 0) or (a = NumOfColumn-1) then
          isLegalMove := true
       else begin

          isLegalMove := false;
       end;
  end else
      isLegalMove := False;
 end;

 function winner():integer;
 {funkcija prolazi kroz matricu i ukoliko postoji pobednik vraca jedan
 ili dva, ukoliko nema pobednika vraca 0}
 var
    i,j : integer;
    nereseno : boolean;
 begin



  for i := 0 to 5 do
    for j := 0 to 3 do
        if (table[i][j].value <> 0) and
           (table[i][j].value = table[i][j+1].value) and
           (table[i][j].value = table[i][j+2].value) and
           (table[i][j].value = table[i][j+3].value) then
               winner := table[i][j].value;

  for i := 0 to 2 do
    for j := 0 to 3 do
        if (table[i][j].value <> 0) and
           (table[i][j].value = table[i+1][j+1].value) and
           (table[i][j].value = table[i+2][j+2].value) and
           (table[i][j].value = table[i+3][j+3].value) then
               winner := table[i][j].value;

  for i := 3 to 5 do
    for j := 0 to 3 do
        if (table[i][j].value <> 0) and
           (table[i][j].value = table[i-1][j+1].value) and
           (table[i][j].value = table[i-2][j+2].value) and
           (table[i][j].value = table[i-3][j+3].value) then
               winner := table[i][j].value;

  for j := 0 to 3 do
    begin
    for i := 0 to 2 do
        if (table[i][j].value <> 0) and
           (table[i][j].value = table[i+1][j+1].value) and
           (table[i][j].value = table[i+2][j+2].value) and
           (table[i][j].value = table[i+3][j+3].value) then
               winner := table[i][j].value;

    for i := 3 to 5 do
        if (table[i][j].value <> 0) and
           (table[i][j].value = table[i-1][j+1].value) and
           (table[i][j].value = table[i-2][j+2].value) and
           (table[i][j].value = table[i-3][j+3].value) then
               winner := table[i][j].value;
     end;
  for i := 0 to 2 do
    for j := 0 to 6 do
        if (table[i][j].value <> 0) and
           (table[i][j].value = table[i+1][j].value) and
           (table[i][j].value = table[i+2][j].value) and
           (table[i][j].value = table[i+3][j].value) then
               winner := table[i][j].value;
  nereseno := true;
  for i:=0 to 5 do
    for j:=0 to 6 do
      if table[i][j].value <> 0 then
         nereseno:=false;

  if nereseno then
     winner:=-1;
      end;

 procedure TForm1.move(Sender: TObject);
 {procedura u matricu upisuje na polje kordinata(a,b) redni broj igraca
 1 ili 2 to se smatra potezom}
 var
    win :integer;
 begin
  table[a][b].value := OnMovePlayer;
  Button1.Enabled:=False;
  Button2.Enabled:=False;
  if OnMovePlayer = 1 then
  begin
     OnMovePlayer:=2;
     Label1.Caption := Player2;
  end
  else
  begin
     OnMovePlayer:=1;
     Label1.Caption := Player1;
  end;
  win:= winner();
  if win <> 0 then
  begin
     if win = 1 then
        ShowMessage('Alal vera '+Player1)
     else if win = 2 then
          ShowMessage('Alal vera '+Player2 + '... Pa jeste Alal vera!')
     else if win = -1 then
          ShowMessage('Nereseno!!!');
     Form1.Close();

  end;
 end;

 procedure TForm1.undo(Sender: TObject);
 begin
  table[a][b].value := 0;
  table[a][b].shape.Shape:=stRectangle;
  table[a][b].shape.Brush.Color:=clWhite;
  Button1.Enabled:=False;
  Button2.Enabled:=False;
 end;

end.


end.

