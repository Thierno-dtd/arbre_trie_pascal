unit fonctionElementaireArbre;

interface

type

    T = integer;      
    arbre = ^noeud;
    noeud = record
        racine : T;          
        sgauche : arbre;
        sdroite : arbre;
    end;


function racine(a : arbre): T;
procedure gauche( a : arbre; var G : arbre);
procedure droite( a : arbre; var D : arbre);
function videA(a : arbre) : boolean;
function feuille(a : arbre) : boolean;
procedure consArbre(r : T; G, D : arbre; var a : arbre);

implementation

function videA(a : arbre) : boolean;
    begin
        videA := a = nil;
    end;

function racine(a : arbre) : T;
    begin
        racine := a^.racine;
    end;

procedure consArbre(r : T; G, D : arbre; var a : arbre);
    begin
        new(a);
        a^.racine := r;
        a^.sgauche := G;
        a^.sdroite := D;
    end;

function feuille(a : arbre) : boolean;
    begin
        feuille := (a<> nil) and (a^.sgauche = nil) and (a^.sdroite = nil);
    end;

procedure gauche( a : arbre; var G : arbre);
    begin
        G := a^.sgauche;
    end;

procedure droite( a : arbre; var D : arbre);
    begin
        D := a^.sdroite;
    end;

end.