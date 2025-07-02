unit arbreTrieApplicatif;

interface

uses fonctionElementaireArbre, listePointeur;

procedure insererEntierArbre(x: T; var a: arbre);
procedure construireArbre(L: liste; var a: arbre);
procedure parcoursInfixe(a: arbre; var L: liste);
procedure infix(a : arbre; var l : liste);

implementation

procedure insererEntierArbre(x: T; var a: arbre);
    begin
        if videA(a) then
            consArbre(x, nil, nil, a)
        else 
            if x < racine(a) then
                insererEntierArbre(x, a^.sgauche)
        else
            insererEntierArbre(x, a^.sdroite);
    end;

procedure construireArbre(L: liste; var a: arbre);
    var
        i, n, val: T;
    begin
        a := nil;
        n := longueur(L);
        for i := 1 to n do
            begin
                ieme(L, i, val);
                insererEntierArbre(val, a);
            end;
    end;

procedure parcoursInfixe(a: arbre; var L: liste);

    procedure parcours(a: arbre; var L: liste; var pos: integer);
    begin
        if a <> nil then
        begin
            parcours(a^.sgauche, L, pos);
            inserer(L, pos, a^.racine);
            pos := pos + 1;
            parcours(a^.sdroite, L, pos);
        end;
    end;

var
    pos: integer;
begin
    vide(L);
    pos := 1;
    parcours(a, L, pos);
end;

procedure infix(a : arbre; var l : liste);
    var L1, L2 : liste;
        a1, a2 : arbre;
    begin
        if videA(a) then vide(l)
        else
            begin 
                gauche(a, a1);
                infix(a1, L1);

                droite(a, a2);
                infix(a2, L2);

                inserer(L2,  1, racine(a));
                concat(L1,L2,l);
            end;
    end;

end.
