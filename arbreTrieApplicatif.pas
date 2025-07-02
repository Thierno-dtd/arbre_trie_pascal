unit arbreTrieApplicatif;

interface

uses fonctionElementaireArbre, listePointeur;

procedure insererEntierArbre(x: T; var a: arbre);
procedure construireArbre(L: liste; var a: arbre);
procedure infix(a : arbre; var l : liste);
procedure concat(L1, L2: liste; var Lres: liste);

implementation

procedure concat(L1, L2: liste; var Lres: liste);
    var
        i, taille1, taille2: integer;
    begin
        vide(Lres);
        taille1 := longueur(L1);
        taille2 := longueur(L2);

        for i := 1 to taille1 do   inserer(Lres, i, ieme(L1, i));

        for i := 1 to taille2 do  inserer(Lres, longueur(Lres) + 1, ieme(L2, i));
    end;

procedure insererEntierArbre(x: T; var a: arbre);
var
    r: T;
    Sg, Sd: arbre;
begin
    if videA(a) then
        initialiserArbre(x, a)
    else
    begin
        r := racine(a);
        gauche(a, Sg);
        droite(a, Sd);

        if x < r then
            insererEntierArbre(x, Sg)
        else
            insererEntierArbre(x, Sd);

        consArbre(r, Sg, Sd, a);
    end;
end;


procedure construireArbre(L: liste; var a: arbre);
    var
        i, n, val: T;
    begin
        viderArbre(a);
        n := longueur(L);
        for i := 1 to n do
            begin
                ieme(L, i, val);
                insererEntierArbre(val, a);
            end;
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
