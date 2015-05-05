function Phonem(wort,sentence)
% Ein Funktion um die Datenbank nach einem Phonem zu durchsuchen
% Input Parameter:
% wort:             Der eingebene Suchbegriff 
%
% Output Parameter:
% phonem:            Cell-Array mit den Treffern der Suchbegriff
% Funktionen, die benötigt werden:
%   playCheckedFile.m
% Variablen, die benötigt werden:
%   sentence = Der Inhalt der Datenbank 'TIMIT MIT' in einem Cell-Array(160x4)

%------------------------------------------------------------------------
%Schleife zur Suche nach Phonem
k=0;
phonem ={};
for r = 1:160
    a = regexp(sentence{r,3},wort,'match');
    if isempty(a) == 0
        k=k+1;
        phonem{k,1} = [sentence{r,1}]; %Speicherung von Sprecher
        phonem{k,2}= [sentence{r,2}];  %Speicherung von Satz
    end
end

%% ausgabe phonem

if isempty(phonem) == 0 %Bedinung für Ausgabe
    %Überschrift von Tabelle
     Ausgabe1=['Das/Die gesuchte/n Phonem/e ' '"'   wort  '"'...
         ' wird/werden von folgenden Sprecher im jeweiligen Satz verwendet:'];

    %Erstelllung von figure
    f = figure('Position',[440 500 600 400]);

    columnformat = {'numeric','bank','logical'};
    
    %Erzeugung neuer Spalte zur Indizierung der Tickbox
    for k=1:length(phonem)
        phonem{k,3}=false;
    end

    % Erstellung von Tabelle
    t = uitable(f,'Data',phonem,... %Daten
        'ColumnName',{'SPrecher','Satzindex','Play'},... %Spaltenüberschriften
        'ColumnFormat', columnformat,...             %Spaltenformat
        'ColumnEditable', [false false true],...     %Benutzereditierbarkeit 
        'CellEditCallback', {@playCheckedFile,phonem},...%Benutzerkontrollierter Aufruf
        'Position', [20 20 700 300]);                  %Postiotn von Tabelle

    % Ausrichtung von Tabelle
    tableextent = get(t,'Extent');
    oldposition = get(t,'Position');
    newposition = [oldposition(1) oldposition(2) tableextent(3) tableextent(4)-(length(phonem)*13.59)];
    set(t, 'Position', newposition);
    
    %Erstellung und Ausrichtung von Überschrift
    uicontrol('style', 'text', 'string', Ausgabe1, 'position', [newposition(1) ...
    newposition(1)+newposition(4) newposition(3) 50])
end
