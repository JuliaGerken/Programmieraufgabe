clear all;
close all;
clc;

path = 'TIMIT MIT'; 
liste = dir(path); 
files = {liste.name}; 
% Liest die Text-Datei der Phoneme ein
phone = fopen(fullfile(path,'allphonelist.txt'));
data = textscan(phone, '%s','Delimiter', {'\n'});
% Trennt die Phoneme vom Sprecher/Satz 
sp={};
for k=1:length(data{1})
   data2= strsplit(data{1}{k}, 'h#');
   sp = [sp; data2];
   
end

% Teilt Sprecher und Satz auf 
sentence={};
for t = 1:length(data{1})
    data3 = strsplit(sp{t}, '/');
    sentence= [sentence; data3];
end

% Setzt die Phoneme zu den jeweiligen Sprecher und Satz 
for r = 1:length(data{1})
    sentence{r,3}=sp{r,2};
end
% Schließt die Textdatei der Phone
fclose(phone);
% Öffnet die Textdatei indem die Sätze enthalten werden 
saetze = fopen(fullfile(path,'allsenlist.txt'));
dataS = textscan(saetze, '%s','Delimiter', {'\n'});
% Trennt die Sätze von den Informtionen über Sprecher und Satzkennzeichnung
[tik, tok]= strtok(dataS);
% Setzt die Sätze zu den jeweiligen Sprecher, Satz und Phoneme
for r = 1:length(data{1})
    sentence{r,4}=tok{1}{r};
end
% Eingaben für die Suche 
% Die Eingabe, ob nach einem Sprecher, einem Satz, einem Phonem oder
% einem Wort gesucht werden soll
Gegenstand= input(['\n\n Geben sie an nach was sie suchen wollen! \n',...
        'Handelt es sich um einen Sprecher, Phonem oder Wort/Satz?\n'],'s');
% Die Eingabe des genauen Suchbegriffes
wort= input(['\n\n Geben sie den genauen Suchbegriff an!\n',...
        'z.B  der Sprecher, das Phonem oder das Wort/Satz \n'], 's');
% Setzt einen Flag, um eine falsche Eingabe zu erkennen
einmal = 1;
% Settzt die Bedingung die ausgeführt wird, wenn ein Wort oder Satz
% eingeben wird
if  strcmp(Gegenstand, 'Wort/Satz');
        k=0;
        right ={};
        for r = 1:160
            a = regexp(sentence{r,4},wort,'match');
            if isempty(a) == 0  
                     k=k+1;
                     right{k,1} = [sentence{r,1}]; %Speicherung von Sprecher
                     right{k,2} = [sentence{r,2}]; %Speicherung von Satz
            end                
        end
    if isempty(sp) == 0  %%Bedingung für Ausgabe      
        %Überschrift von Tabelle
         Ausgabe1=['Das/Die gesuchte/n Wort/e ' '"'   wort  '"'...
        ' wird/werden von folgenden Sprecher im jeweiligen Satz verwendet:'];
     
        %Erstellung von figure
        f = figure('Position',[440 500 461 146]);

        %Erstellung einer Tabelle
        t = uitable(f,'Data',right,...
                'ColumnName',{'Sprecher','Satz'});
        %Ausrichtung von Tabelle
        tableextent = get(t,'Extent');
        oldposition = get(t,'Position');
        newposition = [oldposition(1) oldposition(2) tableextent(3) tableextent(4)-100];
        set(t, 'Position', newposition);
         %Erstellung und Ausrichtung von Überschrift
        uicontrol('style', 'text', 'string', Ausgabe1, 'position', [newposition(1) ...
        newposition(1)+newposition(4) newposition(3) 50])
    end
    % Falls die Bedingung eingetroffen ist wird der Flag auf 0 gesetzt
    einmal = 0;
end 

% Settzt die Bedingung die ausgeführt wird, wenn ein Phonem eingeben wird
 if strcmp(Gegenstand, 'Phonem');
        k = 0;
        phonem ={};
        for r = 1:160
            a = regexp(sentence{r,3},wort,'match');
            if isempty(a) == 0 
                k=k+1;
               phonem{k,1} = [sentence{r,1}]; %Speicherung von Sprecher
               phonem{k,2}= [sentence{r,2}];  %Speicherung von Satz
            end
        end
     if isempty(phonem) == 0 %Bedinung für Ausgabe
    %Überschrift von Tabelle
     Ausgabe1=['Das/Die gesuchte/n Phonem/e ' '"'   wort  '"'...
         ' wird/werden von folgenden Sprecher im jeweiligen Satz verwendet:'];

    %Erstelllung von figure
    f = figure('Position',[440 500 461 146]);

    % Erstellung von Tabelle
    t = uitable(f,'Data',phonem,...
                'ColumnName',{'Sprecher','Satz'});

    % Ausrichtung von Tabelle
    tableextent = get(t,'Extent');
    oldposition = get(t,'Position');
    newposition = [oldposition(1) oldposition(2) tableextent(3) tableextent(4)-500];
    set(t, 'Position', newposition);
    %Erstellung und Ausrichtung von Überschrift
    uicontrol('style', 'text', 'string', Ausgabe1, 'position', [newposition(1) ...
    newposition(1)+newposition(4) newposition(3) 50])
     end
     % Falls die Bedingung eingetroffen ist wird der Flag auf 0 gesetzt
    einmal = 0;
 end
 % Settzt die Bedingung die ausgeführt wird, wenn ein Sprecher eingeben wird
 if strcmp(Gegenstand, 'Sprecher');
         sp ={};
        % sen= {};
          for r = 1:160
            a = regexp(sentence{r,1},wort,'match');
            if isempty(a) == 0  
                sp = [sp;sentence{r,1}];
                index=r;
                break
            end    
          end 
        for k = index:(index+9)
            sp = [sp; sentence{k,4}];
        end
        %Schleife zur Bestimmung von Herkunft von Sprecher
    if isempty(sp) == 0 %Schleifenbedingung
        dr={'dr1', 'dr2','dr3','dr4','dr5','dr6','dr7','dr8'};
        dialect_reg={'New England', 'Northern', 'North Midland', 'South Midland', 'Southern',...
                 'New York City', 'Western', 'Army Brat (moved around)'};
        dialect={};
        for c=1:length(dr)
            b = regexp(sp{1},dr{1,c},'match');
                if isempty(b) == 0
                    speaker_reg=dialect_reg{1,c};
                end
        end
    end
         
    if isempty(sp) == 0 %Bedinung für Ausgabe
        %Überschrift von Tabelle
        Ausgabe=['Der gesuchte Sprecher ' '"'   wort  '"'... 
            ' kommt aus der Region "' speaker_reg '" und sagt die Sätze:' ];

        %Erstellung von figure
        f = figure('Position',[440 500 461 146]);
    
        %Erstellung von Tabelle
        t = uitable(f,'Data',sp,...
            'ColumnName',{'Satz'});
    
        %Spaltenweite
        get(t)
        set(t, 'ColumnWidth', {300,120,83,83})
        %Ausrichtung von Tabelle
        tableextent = get(t,'Extent');
        oldposition = get(t,'Position');
        newposition = [oldposition(1) oldposition(2) tableextent(3) tableextent(4)-10];
        set(t, 'Position', newposition);
        % Erstellung und Ausrichtung von Überschrift
        uicontrol('style', 'text', 'string', Ausgabe, 'position', [newposition(1) ...
        newposition(1)+newposition(4) newposition(3) 50]);
    end
     % Falls die Bedingung eingetroffen ist wird der Flag auf 0 gesetzt
     einmal = 0;
 end
 % Überprüfung der Flags
 if einmal == 1;
    fprintf('Die Eingabe ist ungültig');
 end