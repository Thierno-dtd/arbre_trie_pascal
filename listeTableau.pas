unit listeTableau;

interface

const
            MAX = 100;

type
            T = integer;  

            liste = record
                elements: array[1..MAX] of T;
                taille: integer;
            end;

function longueur(L: liste): integer;
procedure inserer(var L: liste; pos: integer; val: T);
procedure supprimer(var L: liste; pos: integer);
function ieme(L: liste; pos: integer): T; overload;
procedure ieme(L: liste; pos: integer; var val: T); overload;
procedure vide(var L: liste);
procedure concat(L1, L2: liste; var Lres: liste);

implementation

function longueur(L: liste): integer;
    begin
        longueur := L.taille;
    end;

procedure inserer(var L: liste; pos: integer; val: T);
    var
        i: integer;
    begin
        if (L.taille < MAX) and (pos >= 1) and (pos <= L.taille + 1) then
            begin
                for i := L.taille downto pos do
                            L.elements[i + 1] := L.elements[i];
                L.elements[pos] := val;
                L.taille := L.taille + 1;
            end
        else
            writeln('Erreur : insertion impossible.');
    end;

procedure supprimer(var L: liste; pos: integer);
    var
        i: integer;
    begin
        if (pos >= 1) and (pos <= L.taille) then
            begin
                        for i := pos to L.taille - 1 do
                                    L.elements[i] := L.elements[i + 1];
                        L.taille := L.taille - 1;
            end
        else
            writeln('Erreur : suppression impossible.');
    end;

function ieme(L: liste; pos: integer): T; overload;
    begin
        if (pos >= 1) and (pos <= L.taille) then  ieme := L.elements[pos]
        else
            begin
                        writeln('Erreur : position invalide.');
                        ieme := 0; 
            end;
    end;

procedure ieme(L: liste; pos: integer; var val: T); overload;
    begin
        if (pos >= 1) and (pos <= L.taille) then  val := L.elements[pos]
        else      writeln('Erreur : position invalide.');
    end;

procedure vide(var L: liste);
    begin
        L.taille := 0;
    end;

procedure concat(L1, L2: liste; var Lres: liste);
    var
        i, taille1, taille2: integer;
        val: T;
    begin
        vide(Lres);
        taille1 := longueur(L1);
        taille2 := longueur(L2);

        for i := 1 to taille1 do   inserer(Lres, i, ieme(L1, i));

        for i := 1 to taille2 do  inserer(Lres, longueur(Lres) + 1, ieme(L2, i));
    end;

end.
