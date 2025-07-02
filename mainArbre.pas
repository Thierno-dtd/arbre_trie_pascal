program mainArbre;

uses listePointeur, fonctionElementaireArbre, arbreTrieApplicatif;

var
    L, ListTriee: liste;
    a: arbre;
    i, n, val: T;

begin
    writeln('🌳 Bienvenue dans le programme de tri par Arbre Binaire Trié 🌳');
    writeln('-------------------------------------------------------------');

    { Création de la liste initiale }
    vide(L);
    writeln;
    writeln('📝 Combien de valeurs souhaitez-vous entrer dans la liste ?');
    write('👉 Votre choix : ');
    readln(n);

    writeln;
    writeln('👉 Super ! Entrez maintenant les ', n, ' valeurs (une par ligne) :');
    for i := 1 to n do
    begin
        write('🔢 Valeur ', i, ' : ');
        readln(val);
        inserer(L, i, val);
    end;

    writeln;
    writeln('✅ Liste initiale enregistrée avec succès !');
    writeln('-------------------------------------------');

    { Construction de l'arbre }
    construireArbre(L, a);
    writeln('🌱 Arbre binaire trié construit avec succès !');

    { Parcours infixé pour trier }
    writeln('🔎 Génération de la liste triée (parcours infixé en cours)...');
    infix(a, ListTriee);

    { Affichage de la liste triée }
    writeln;
    writeln('✅ Résultat final : Liste triée par ordre croissant :');
    writeln('-----------------------------------------------------');
    for i := 1 to longueur(ListTriee) do
    begin
        write('➡️  ');
        writeln(ieme(ListTriee, i));
    end;

    writeln;
    writeln('🎉 Fin du programme. Merci d''avoir utilisé notre arbre trié !');
    writeln('---------------------------------------------------------------');
end.
