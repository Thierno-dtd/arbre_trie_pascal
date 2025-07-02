program mainArbre;

uses listePointeur, fonctionElementaireArbre, arbreTrieApplicatif;

var
    L, ListTriee: liste;
    a: arbre;
    i, val, pos: T;

begin
    writeln(' Bienvenue dans le programme de tri par Arbre Binaire Tri‚');
    writeln('-------------------------------------------------------------');

    vide(L);
    pos := 1;

    writeln;
    writeln(' Entrez les valeurs … trier (entrez -1 pour terminer la saisie) :');

    repeat
        write(' Valeur ', pos, ' : ');
        readln(val);
        if val <> -1 then
        begin
            inserer(L, pos, val);
            pos := pos + 1;
        end;
    until val = -1;

    writeln;
    writeln(' Liste initiale enregistr‚e avec succŠs !');
    writeln('-------------------------------------------');

    construireArbre(L, a);
    writeln(' Arbre binaire tri‚ construit avec succŠs !');

    writeln(' Cr‚ation de la liste tri‚e (parcours infix‚ en cours)...');
    infix(a, ListTriee);

    writeln;
    writeln(' R‚sultat final : Liste tri‚e par ordre croissant :');
    writeln('-----------------------------------------------------');
    for i := 1 to longueur(ListTriee) do
    begin
        write(' Valeur ', i, ' : ');
        writeln(ieme(ListTriee, i));
    end;

    writeln;
    writeln(' Fin du programme. Merci d''avoir utilis‚ notre arbre tri‚ !');
    writeln('---------------------------------------------------------------');
end.
