% Skript zum Durchsuchen der Datenbank "TIMIT MIT" nach einem Sprecher
% einem Phonem eines Satzes oder eines einzelnen Wortes. Es ist auch
% möglich die Auswahl zu treffen nach zwei Sachen zu suchen.
%
% Zum Ausführen des Skripts werden folgende Funktionen benötigt:
%   Satz.m
%   Phonem.m
%   Sprecher.m
%   playCheckedFile.m
% Als Eingaben können erfolgen:
% Anzahl der Suchbegriffe = 1 oder 2
% Sprecher = Sprecher, Wort = Wort, Satz = Satz, Phonem= Phonem
% Den genauen Suchebegriff
% Die Ausgabe erfolgt in Form einer Tabelle
clear all;
close all;
clc;
% Einlesen des Pfades in dem die Datei liegt
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
mehr = input(['\n\n Suchen sie nach einem oder nach zwei Suchebegriffen? \n',...
    'Die Eingabe erfolgt durch 1 für einen Suchbegriff und 2 für zwei Suchbegriffe \n'],'s');
% Setzt die Bedingung die ausgeführt wird, wenn ein Wort oder Satz
% eingeben wird
if strcmp(mehr, '1')
    % Die Eingabe, ob nach einem Sprecher, einem Satz, einem Phonem oder
    % einem Wort gesucht werden soll
    Gegenstand= input(['Handelt es sich um einen Sprecher, Phonem oder Wort bzw. Satz?\n',...
        'Die Eingabe erfolgt entsprechend mit den Parametern:\n',...
        'Für Wort = Wort \n',...
        'Für Phone = Phonem\n',...
        'Für Sprecher = Sprecher\n',...
        'Für Satz = Satz\n'],'s');
    % Die Eingabe des genauen Suchbegriffes
    wort= input(['\n\n Geben sie den Suchbegriff an, nach dem gesucht werden soll!\n',...
        'Z.B. Für Sprecher = dr1-fvmh0\n Für Phonem = iy \n',...
        'Für Satz = she had your dark suit in greasy wash water all year\n',...
        'Für Wort = she\n'], 's');
    % Setzt einen Flag, um eine falsche Eingabe zu erkennen
    EingabenKontrolle = 1;
    % Überprüft die Eingabe nach dem Parameter Wort/Satz in dem Cell-Array...
    % und führt, falls vorhanden, die Funktion Satz für das Cell-Array wort
    % durch
    if  strcmp(Gegenstand, 'Wort') || strcmp(Gegenstand, 'Satz');
        Satz(wort,sentence);
        % Setzt Flag auf Null, wenn Bedingung eingetroffen
        EingabenKontrolle = 0;
    end
    % Überprüft die Eingabe nach dem Parameter Phonem in dem Cell-Array...
    % und führt, falls vorhanden, die Funktion Phonem für das Cell-Array wort
    % durch
    if strcmp(Gegenstand, 'Phonem');
        Phonem(wort,sentence);
        % Setzt Flag auf Null, wenn Bedingung eingetroffen
        EingabenKontrolle = 0;
    end
    % Überprüft die Eingabe nach dem Parameter Sprecher in dem Cell-Array...
    % und führt, falls vorhanden, die Funktion sp für das Cell-Array wort
    % durch
    if strcmp(Gegenstand, 'Sprecher');
        Sprecher(wort,sentence);
        % Setzt Flag auf Null, wenn Bedingung eingetroffen
        EingabenKontrolle = 0;
    end
    % Überprüfung der Flags
    if EingabenKontrolle == 1;
        fprintf('Die Eingabe ist ungültig');
    end
end
% Bedingung zum Ausführen mit einem Input von zwei Parametern
if strcmp(mehr, '2')
    % Eingabe der Suchparameter
    Gegenstand1= input(['\n \n Handelt es sich beim ersten Suchbegriff um einen Sprecher, Satz, Phonem oder Wort?\n',...
        'Die Eingabe erfolgt entsprechend mit den Parametern:\n',...
        'Für Wort = Wort \n',...
        'Für Phone = Phonem\n',...
        'Für Sprecher = Sprecher\n',...
        'Für Satz = Satz\n'],'s');
    wort1= input(['\n\n Geben sie den dazugehörigen Suchbegriff an, nach dem gesucht werden soll!\n',...
        'Z.B. Für Sprecher = dr1-fvmh0\n Für Phonem = iy \n',...
        'Für Satz = she had your dark suit in greasy wash water all year\n',...
        'Für Wort = she\n'], 's');
    Gegenstand2= input(['\n \n Handelt es sich beim zweiten Suchbegriff um einen Sprecher, Satz, Phonem oder Wort?\n'],'s');
    wort2= input(['\n\n Geben sie den dazugehörigen Suchbegriff an, nach dem gesucht werden soll!\n',...
       'Z.B. Für Sprecher = dr1-fvmh0\n Für Phonem = iy \n',...
        'Für Satz = she had your dark suit in greasy wash water all year\n',...
        'Für Wort = she\n'], 's');
    % Setzt einen Flag, um eine falsche Eingabe zu erkennen
    EingabenKontrolle = 1;
    % Überprüft die Eingabe nach dem Parameter Wort/Satz in dem Cell-Array...
    % Gegenstand1 und führt, falls vorhanden, die Funktion Satz für das Cell-...
    % Array wort1 durch
    if  strcmp(Gegenstand1, 'Wort') || strcmp(Gegenstand1, 'Satz');
        Satz(wort1,sentence);
        % Setzt Flag auf Null, wenn Bedingung eingetroffen
        EingabenKontrolle = 0;
    end
    % Überprüft die Eingabe nach dem Parameter Phonem in dem Cell-Array...
    % Gegenstand1 und führt, falls vorhanden, die Funktion Phonem für das Cell-...
    % Array wort1 durch
    if strcmp(Gegenstand1, 'Phonem');
        Phonem(wort1,sentence);
        % Setzt Flag auf Null, wenn Bedingung eingetroffen
        EingabenKontrolle = 0;
    end
    % Überprüft die Eingabe nach dem Parameter Sprecher in dem Cell-Array...
    % Gegenstand1 und führt, falls vorhanden, die Funktion sp für das Cell-...
    % Array wort1 durch
    if strcmp(Gegenstand1, 'Sprecher');
        Sprecher(wort1,sentence);
        % Setzt Flag auf Null, wenn Bedingung eingetroffen
        EingabenKontrolle = 0;
    end
    % Überprüfung der Flags
    if EingabenKontrolle == 1;
        fprintf('Die Eingabe ist ungültig \n');
    end
    % Setzt einen Flag, um eine falsche Eingabe zu erkennen
    EingabenKontrolle2 = 1;
    % Überprüft die Eingabe nach dem Parameter Wort/Satz in dem Cell-Array...
    % Gegenstand2 und führt, falls vorhanden, die Funktion Satz für das Cell-...
    % Array wort2 durch
    if  strcmp(Gegenstand2, 'Wort') || strcmp(Gegenstand2, 'Satz');
        Satz(wort2,sentence);
        % Setzt Flag auf Null, wenn Bedingung eingetroffen
        EingabenKontrolle2 = 0;
    end
    % Überprüft die Eingabe nach dem Parameter Phonem in dem Cell-Array...
    % Gegenstand2 und führt, falls vorhanden, die Funktion Phonem für das Cell-...
    % Array wort2 durch
    if strcmp(Gegenstand2, 'Phonem');
        Phonem(wort2,sentence);
        % Setzt Flag auf Null, wenn Bedingung eingetroffen
        EingabenKontrolle2 = 0;
    end
    % Überprüft die Eingabe nach dem Parameter Sprecher in dem Cell-Array...
    % Gegenstand2 und führt, falls vorhanden, die Funktion sp für das Cell-...
    % Array wort2 durch
    if strcmp(Gegenstand2, 'Sprecher');
        Sprecher(wort2,sentence);
        % Setzt Flag auf Null, wenn Bedingung eingetroffen
        EingabenKontrolle2 = 0;
    end
    % Überprüfung der Flags
    if EingabenKontrolle2 == 1;
        fprintf('Die Eingabe ist ungültig \n');
    end
end


%Copyright (c) <2015> <Julia Gerken, Kevin Picker, Frederike Kirschner>

%Permission is hereby granted, free of charge, to any person obtaining a copy
%of this software and associated documentation files (the "Software"), to
%deal in the Software without restriction, including without limitation the
%rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
%sell copies of the Software, and to permit persons to whom the Software is
%furnished to do so, subject to the following conditions:
%The above copyright notice and this permission notice shall be included in
%all copies or substantial portions of the Software.

%THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
%FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
%DEALINGS IN THE SOFTWARE.
