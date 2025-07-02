unit listePointeur;

interface

type
            T = integer;
            pCellule = ^elt;
            elt = record
                val: T;
                suivant: pCellule;
            end;

            liste = pCellule;

procedure vide(var L: liste);
function longueur(L: liste): integer;
procedure inserer(var L: liste; pos: integer; val: T);
procedure supprimer(var L: liste; pos: integer);
function ieme(L: liste; pos: integer): T; overload;
procedure ieme(L: liste; pos: integer; var val: T); overload;

implementation

procedure vide(var L: liste);
        begin
                L := nil;
        end;

function longueur(L: liste): integer;
        var
                count: integer;
                p: liste;
        begin
                count := 0;
                p := L;
                while p <> nil do
                        begin
                                        count := count + 1;
                                        p := p^.suivant;
                        end;
                longueur := count;
        end;

procedure inserer(var L: liste; pos: integer; val: T);
    var
            nouv, courant: liste;
            i: integer;
    begin
            if (pos < 1) or (pos > longueur(L) + 1) then writeln('Erreur : position invalide.')
            else
                begin
                    new(nouv);
                    nouv^.val := val;

                    if pos = 1 then
                        begin
                                nouv^.suivant := L;
                                L := nouv;
                        end
                    else
                        begin
                                courant := L;
                                for i := 1 to pos - 2 do  courant := courant^.suivant;
                                nouv^.suivant := courant^.suivant;
                                courant^.suivant := nouv;
                        end;
                end;
    end;

procedure supprimer(var L: liste; pos: integer);
    var
        courant, temp: liste;
        i: integer;
    begin
        if (pos < 1) or (pos > longueur(L)) then    writeln('Erreur : position invalide.')
        else
            begin
                if pos = 1 then
                    begin
                            temp := L;
                            L := L^.suivant;
                            dispose(temp);
                    end
                else
                    begin
                        courant := L;
                        for i := 1 to pos - 2 do          courant := courant^.suivant;
                                
                        temp := courant^.suivant;
                        if temp <> nil then
                            begin
                                    courant^.suivant := temp^.suivant;
                                    dispose(temp);
                            end;
                    end;
            end;           
    end;

function ieme(L: liste; pos: integer): T; overload;
    var
        courant: liste;
        i: integer;
    begin
        if (pos < 1) or (pos > longueur(L)) then
            begin
                writeln('Erreur : position invalide.');
                ieme := 0;
            end
        else
            begin
                courant := L;
                for i := 1 to pos - 1 do      courant := courant^.suivant;

                ieme := courant^.val;
            end;
    end;

procedure ieme(L: liste; pos: integer; var val: T); overload;
    var
        courant: liste;
        i : integer;
    begin
        if (pos < 1) or (pos > longueur(L)) then  writeln('Erreur : position invalide.')
        else
            begin
                courant := L;
                for i := 1 to pos - 1 do    courant := courant^.suivant;
                val := courant^.val;
            end;
    end;

end.
