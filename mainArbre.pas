program mainArbre;

uses listePointeur, fonctionElementaireArbre, arbreTrie;

var
    L, Ltriée: liste;
    a: arbre;
    i, n, val: T;

begin
    { Création de la liste initiale }
    vide(L);
    writeln('Combien d''éléments dans la liste ? ');
    readln(n);

    writeln('Entrez les ', n, ' valeurs : ');
    for i := 1 to n do
    begin
        readln(val);
        inserer(L, i, val);
    end;

    { Construction de l''arbre binaire trié à partir de la liste }
    construireArbre(L, a);

    { Parcours infixé pour obtenir la liste triée }
    parcoursInfixe(a, Ltriée);

    { Affichage de la liste triée }
    writeln('Liste triée :');
    for i := 1 to longueur(Ltriée) do
        writeln(ieme(Ltriée, i));

end.
