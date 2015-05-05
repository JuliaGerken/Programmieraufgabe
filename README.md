#README
## Für das Skript zur Durchsuchung der Datenbank 'TIMIT MIT'

##**Was tut das Skript?** 
Es handelt sich um das Skript 'ProgrammaufgabeDatenbankPiekerKirschnerGerken' dient zur Durchsuchung der Datenbank.
Die Anwendung ist benutzerfreundlich und erfolgt durch Eingabe von zwei Parametern.
Nach Aufforderung, der Eingabe nach was gesucht werden soll, wird durch Eingabe ausgewählt, ob nach einem Sprecher, einem Satz, einem Phonem oder nach einem Wort gesucht werden soll. Es kann zusätzlich nach zwei Suchbegriffen gleichzeitig gesucht werden.
Danach erfolgt die Aufforderung einen genauen Suchbegriff zu definieren.
In dieser Eingabe wird das zu suchende Objekt eingegeben.
Danach erfolgt die Ausgabe in einem sepertaen Fenster. Mittels dieser Angaben kann eine Übersicht der Datenbank erfolgen. Zusätzlich bietet das Programm die Möglichkeit, durch Auswahl, die entsprechenden Wav-Dateien abzuspielen

#**Was liegt wo?**
In der zu durchsuchenden Datenbank liegen verschiedene Ordner, die nach den Sprechern bennant wurde.
In jedem dieser Ordner sind Wav.-Datein enthalten, die derjenige Sprecher aufgezeichnet hat.
Zusätzlich sind Textdoktumente enthalten, die genau aufzechenen welcher Satz aus welchen Phonen besteht und welcher Sprecher welche Sätze gesprochen hat.

#**Benutzung**
Damit die Datenbank durchsucht werden kann, muss das Skript durch die Taste **F5** oder den Button **Run**     gestartet werden. Der Benutzer wird aufgefordert einzugeben, ob er die Datenbank nach zwei oder nach einem Begriff durchsuchen möchte. Dafür drückt er entweder die Nummer **2** oder die Nummer **1**. Danach erfolgt je nach Auswahl, die Eingabe des Suchbegriff. Dafür wird der Benutzer zunächst aufgefordert, sich zu entscheiden, ob er nach einem Sprecher, Satz, Wort oder Phonem suchen möchte. Die Eingabe erfolgt mit den entsprechenden Parametern **Sprecher**, **Satz**, **Wort** oder **Phonem** und daie Eingabe des entsprechenden Suchbegriffes. Es kann nicht nach einem Satzkürzel wie z.B. "sa1" gesucht werden.
Als Ausgabe öffnet sich ein Fenster mit einer Tabelle, wo der Suchbegriff gefunden wurde. Mit Hilfe eines Hacken können die einzlenen Dateien angeklickt werden, was zu einer Ausgabe der entsprechenden Wav-Datei führt.
 
**Beispiel für einen Suchebegriff:**  

Suchen Sie nach einem oder nach zwei Suchebegriffen? 
Die Eingabe erfolgt durch 1 für einen Suchbegriff und 2 für zwei Suchbegriffe 
>1

Handelt es sich um einen Sprecher, Phonem oder Wort bzw. Satz?
Die Eingabe erfolgt entsprechend mit den Parametern:
Für Wort = Wort 
Für Phone = Phonem
Für Sprecher = Sprecher
Für Satz = Satz
>Wort


 Geben sie den Suchbegriff an, nach dem gesucht werden soll!
Z.B. Für Sprecher = dr1-fvmh0
 Für Phonem = iy 
Für Satz = she had your dark suit in greasy wash water all year
Für Wort = she
>had

**Beispiel für zwei Suchebegriffe:** 

 Suchen sie nach einem oder nach zwei Suchebegriffen? 
Die Eingabe erfolgt durch 1 für einen Suchbegriff und 2 für zwei Suchbegriffe 
>2

 
 Handelt es sich beim ersten Suchbegriff um einen Sprecher, Satz, Phonem oder Wort?
Die Eingabe erfolgt entsprechend mit den Parametern:
Für Wort = Wort 
Für Phone = Phonem
Für Sprecher = Sprecher
Für Satz = Satz
>Wort


 Geben sie den dazugehörigen Suchbegriff an, nach dem gesucht werden soll!
Z.B. Für Sprecher = dr1-fvmh0
 Für Phonem = iy 
Für Satz = she had your dark suit in greasy wash water all year
Für Wort = she
>she

 
 Handelt es sich beim zweiten Suchbegriff um einen Sprecher, Satz, Phonem oder Wort?
>Sprecher


 Geben sie den dazugehörigen Suchbegriff an, nach dem gesucht werden soll!
Z.B. Für Sprecher = dr1-fvmh0
 Für Phonem = iy 
Für Satz = she had your dark suit in greasy wash water all year
Für Wort = she
>dr8-fbcg1



#**Dependencies**
Damit das Programm verwendet werden kann, muss auf dem verwendeten Computer Matlab installiert sein.
Das Programm wurde mit der Matlabversion R2014a implementiert und ist für alle Versionen > R2014a kompatibel. Das Programm ist auf alles Betriebssystemen ausführbar, auf denen auch Matlab funktioniert. Damit das Programm einwandfrei funktioniert, sollten die folgende Funktionen im selben Verzeichniss liegen:
* Sprecher.m
* Satz.m
* Phonem.m
* playCheckedFile.m

Auch die Datenbank 'TIMIT MIT' sollte im gleichen Verzeichniss liegen. 

#**Installationshinweise**
Außer der Installation von Matlab sind keine weiteren Installationen nötigt, damit das Programm ausgeführt werden kann. 

#**Änderungshistorie**
* 28.04.15     -  Erste Implementierung, Daten einlesen
* 01.05.15     -  Erstellung des Suchalgorythmus
* 01.05.15     -  Hinzufügen der Eingabe für einen Suchbegriff
* 02.05.15     -  1. Versuch nach Kombinationen zu suchen; Problem: Eingabe nicht möglich zu trennen und dann damit weiterzuarbeiten
* 03.05.15     -  Hinzufügen der Ausgabe
* 04.05.15     -  Hinzufügen der sound-Ausgabe
* 04.05.15     -  Problem der Eingabe mit einer zusätzlichen if Bedingung und zwei zusätzlichen Inputs gelöst
* 04.05.15     -  Auslagern der einzelnen Funktionen
* 05.05.15     -  Anpassung der Ausgabe-figure

#**Autoren**
Das Programm und die einzlenen Funktionen wurden im Rahmen einer Studienleistung der Jade Hochschule Olddenburg von den Studenten Kevin Picker, Frederike Kirschner und Julia Gerken entwickelt.





