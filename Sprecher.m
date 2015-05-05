function Sprecher(wort,sentence)
% Eine Funktion um die Datenbank nach einem Sprecher zu durchsuchen
% Input Parameter:
% wort:             Der eingebene Suchbegriff 
%
% Output Parameter:
% right:            Cell-Array mit den Treffern der Suchbegriff

%------------------------------------------------------------------------ 
sp ={};
sen={};
k=0;

%Schleife zur Suche nach Sprecher in Datenbank
for r = 1:160
    a = regexp(sentence{r,1},wort,'match');
    if isempty(a) == 0
        k=k+1;
        sp = [sp;sentence{r,1}];    %Sprecher
        sen{k,2} = [sentence{r,4}]; % Satz
        sen{k,1}= [sentence{r,2}]; % Satznummer
    end
end


%Schleife zur Bestimmung von Herkunft von Sprecher
if isempty(sp) == 0 %Schleifenbedingung
    dr={'dr1', 'dr2','dr3','dr4','dr5','dr6','dr7','dr8'};%Index für Herkunft
    dialect_reg={'New England', 'Northern', 'North Midland', 'South Midland', 'Southern',...
        'New York City', 'Western', 'Army Brat (moved around)'};%Herkunft
    dialect={};                             
    for c=1:length(dr)
        b = regexp(sp{1},dr{1,c},'match'); 
        if isempty(b) == 0
            speaker_reg=dialect_reg{1,c}; % Herkunft von ges. Sprecher
        end
    end
end

%% Ausgabe

if isempty(sp) == 0 %Bedinung für Ausgabe
    %Überschrift von Tabelle
    Ausgabe1=['Der gesuchte Sprecher ' '"'   wort  '"'...
        ' kommt aus der Region "' speaker_reg '" und sagt die Sätze:' ];
    
    %Erstellung von figure
    f = figure('Position',[440 500 600 200]);
    columnformat = {'numeric','bank','logical'};
    
    %Erzeugung neuer Spalte zur Indizierung der Tickbox
    for k=1:length(sen)
        sen{k,3}=false;
    end
    
    % neue Indizierung für Aufruf von @playCheckedFile 
    name={};
    for k=1:length(sen)
        name{k,1} = sp{1,1};  %Sprecher
        name{k,2} = sen{k,1}; %Satzindex
    end
    
    %Erstellung von Tabelle
    t = uitable(f,'Data',sen,... %Daten
        'ColumnName',{'Satzindex','Satz','Play'},... %Spaltenüberschriften
        'ColumnFormat', columnformat,...             %Spaltenformat
        'ColumnEditable', [false false true],...     %Benutzereditierbarkeit
        'CellEditCallback', {@playCheckedFile,name},...%Benutzerkontrollierter Aufruf
        'Position', [20 20 700 300]);                  %Postion von Tabelle
    
    %Spaltenweite
    set(t, 'ColumnWidth', {50,400,83,83});
    
    %Ausrichtung von Tabelle
    tableextent = get(t,'Extent');
    oldposition = get(t,'Position');
    newposition = [oldposition(1) oldposition(2) tableextent(3) tableextent(4)-10];
    set(t, 'Position', newposition);
    
    % Erstellung und Ausrichtung von Überschrift
    uicontrol('style', 'text', 'string', Ausgabe1, 'position', [newposition(1) ...
        newposition(1)+newposition(4) newposition(3) 50]);
end