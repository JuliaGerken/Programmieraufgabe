%%
%  Test_Skript überprüft ob die Funktionen 'Satz', 'sp' und 'Phonem', welche
%  Teil der 'Programmieraufgabe' sind. 

%%
% Eingabeparameter für die Funktionen

% Die Eingabeparameter werden randomisiert erstellt aus der liste 'sentence'

liste_laden = load('sentence.mat');
liste = liste_laden.sentence;       
l_liste = length(liste);

% Suche nach einem randomisierten Phonem 
einzelnd = textscan(liste{randi(l_liste),3},'%s');
l_einzelnd=length(einzelnd{1});
phonem = einzelnd{1}{randi(l_einzelnd),1};

% Erzeuge ein randomisiertes Wort
einzelnes = textscan(liste{randi(l_liste),4},'%s');
l_einzelnes=length(einzelnes{1});
wort = einzelnes{1}{randi(l_einzelnes),1};

% Erzeugt einen randomisierten Satz oder Sprecher 
satz = liste{randi(l_liste),4};
sprecher = liste{randi(l_liste),1};
%%
% Zu testende Funktionen  

Phonem(phonem,liste)
Sprecher(sprecher,liste)
Satz(wort,liste)

