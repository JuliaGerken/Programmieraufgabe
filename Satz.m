function Satz(wort,sentence)
% Ein Funktion um die Datenbank nach einem Satz oder Wort zu durchsuchen
% Input Parameter:
% wort:             Der eingebene Suchbegriff 
%
% Output Parameter:
% right:            Cell-Array mit den Treffern der Suchbegriff

%------------------------------------------------------------------------ 
right= {};
k=0;
% for-Schleife, um die erste Spalte mit 160 Cell-Eintr�gen zu durchsuchen
for r = 1:160
    a = regexp(sentence{r,4},wort,'match');
            if isempty(a) == 0  
                     k=k+1;
                     right{k,1} = [sentence{r,1}]; %Speicherung von Sprecher
                     right{k,2} = [sentence{r,2}]; %Speicherung von Satz
            end                
end
    
if isempty(right) == 0  %%Bedingung f�r Ausgabe      
    
    %�berschrift von Tabelle
    Ausgabe1=['Das/Die gesuchte/n Wort/e ' '"'   wort  '"'...
        ' wird/werden von folgenden Sprecher im jeweiligen Satz verwendet:'];
     
    %Erstellung von figure
    f = figure('Position',[440 500 461 146]);
    columnformat = {'numeric','bank','logical'};
    
    %Erzeugung neuer Spalte zur Indizierung der Tickbox
    for k=1:length(right)
        right{k,3}=false;
    end
    
    %Erstellung von Tabelle
    t = uitable(f,'Data',right,... %Daten
                'ColumnName',{'Sprecher','Satzindex', 'Play'},... %Spalten�berschriften
                'ColumnFormat', columnformat,...                  %Spaltenformat                                                                  
                'ColumnEditable', [false false true],...          %Benutzereditierbarkeit
                'CellEditCallback', {@playCheckedFile,right},...%Benutzerkontrollierter Aufruf
                 'Position', [20 20 700 300]);                %Postion von Tabelle
        
    %Ausrichtung von Tabelle
    tableextent = get(t,'Extent');
    oldposition = get(t,'Position');
    newposition = [oldposition(1) oldposition(2) tableextent(3) tableextent(4)];
    set(t, 'Position', newposition);
    
    %Erstellung und Ausrichtung von �berschrift
    uicontrol('style', 'text', 'string', Ausgabe1, 'position', [newposition(1) ...
        newposition(1)+newposition(4) newposition(3) 50])
end    