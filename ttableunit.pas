unit TTableUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ExtCtrls;

const
  NumOfColumn = 6;   {Broj kolona}
  NumOfRow = 7;      {Broj Redova}

type
  cells = record
    value : integer;
    shape: TShape;
  end;

  matShapes = array[1..NumOfColumn] of array[1..NumOfRow] of cells;
  TTable = class
  private
         table :matShapes;
  public
         procedure newBoard();
         function isLegalMove(a,b:integer):boolean;
         function winner():integer;
         procedure move(player,a,b:integer);
  end;
implementation
         procedure TTable.newBoard();
         {kreira praznu tablu, u matricu postavlja sve nule}
         begin
         end;

         function TTable.isLegalMove(a,b:integer):boolean;
         {funkciji se prosledjuju koordinate polja koje igrac zeli da odigra
         ukoliko je to polje legalno za potez funkcija vraca true, u suprotnom
         vraca false}
         begin
         end;

         function TTable.winner():integer;
         {funkcija prolazi kroz matricu i ukoliko postoji pobednik vraca jedan
         ili dva, ukoliko nema pobednika vraca -1}
         begin
         end;

         procedure TTable.move(player,a,b:integer);
         {procedura u matricu upisuje na polje kordinata(a,b) redni broj igraca
         1 ili 2 to se smatra potezom}
         begin
         end;

end.

