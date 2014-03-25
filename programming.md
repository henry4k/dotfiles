DOs und DONTs beim Programmieren
================================

## Allgemeines

### Code Craft

Dinge, die mir beim lesen von 'Code Craft' besonders wichtig erschienen:

#### Die Einstellung zählt
Wie bei vielen Dingen im Leben geht es auch hier zuallererst
um die innere Einstellung zum Thema. Wenn man nicht wirklich schönen/guten
Code schreiben *will*, wird man auch keinen hervorbringen.

#### Programmiere defensiv

Defensiv programmieren bedeutet keine Ahnnahmen
über die Nutzung seines Codes zu machen.

- Was mache ich, wenn Parameter X ausserhalb von 0-1 ist?


Lösungen:

- Variablen immer initialisieren.
- Unterstützende Sprachfeatures wie `const` immer nutzen.
- Return-Werte und Fehler-Codes prüfen.


#### Gute und durchdachte Namen

So kurz und prägnant wie möglich. Nicht nur prägnant für dich selbst.

Auf den Kontext achten.  
Wenn ein Name immer nur in einem bestimmten Kontext genutzt wird,
muss er auch nur in diesem eindeutig sein.

Makros sollten herrausstechen,
weil sie sich nicht an die Regeln der Sprache halten.


#### Dokumentation

Die beste Dokumentation ist der Code selbst.  
Man sollte also Code immer so schreiben, dass dieser leicht verständlich ist:

- Gute Namen benutzten
- Elemente im Quellcode dem optimalen Lesefluss entsprechend anordnen.  
  Interne Funktionen sollten also immer am *Ende* einer Datei stehen,
  denn den Leser interessiert erstmal der öffentliche Teil.
- Zusammengehörige Anweisungen sollten gruppiert werden.
- Bei if-else-Statements sollte der gängige Fall immer zuerst behandelt werden.

Je weiter die Dokumentation vom Code entfernt ist,
desto eher vergisst man diese zu aktualisieren.

(Überraschende) Seiteneffekte müssen vermieden werden.
Ansonsten müssen sie dokumentiert und die Dokumentation befolgt werden. => Doof

Keine großen Funktionen!
Kleine verschachtelte Funktionen sind viel leichter zu lesen und zu warten.


### Statements von irgendwelchen Leuten

- Beautiful is better than ugly.
- Explicit is better than implicit.
- Simple is better than complex.
- Complex is better than complicated.
- Flat is better than nested. (=> Complex)
- Sparse is better than dense.
- Readabillity counts.
- Special cases aren't special enough to break the rules.
  Although practicality beats purity.
- Errors should never pass silently.
  Unless explicitly silenced.
- If the implementation is hard to explain, it's a bad idea.

- Enable compiler warnings and pay attention to them.
- Use assertions to validate your assumptions.
- Don't quietly ignore error conditions or invalid input.
- For a complicated, critical algorithm, consider using a second algorithm to validate the first. (e.g. validate binary search with a linear search).
- Don't write multi-purpose functions such as realloc (it can grow memory, shrink memory, free memory, or allocate new memory -- it does it all).
- Check boundary conditions carefully.
- Avoid risky language idioms.
- *Write code for the "average" programmer. Don't make the "average" programmer reach for a reference manual to understand your code.*
- Fix bugs now, not later.
- *There are no free features; don't allow needless flexibility (like realloc).*
- Ultimately the developer is responsible for finding bugs; he shouldn't write sloppy code and hope that QA will find all his bugs. 

> Google often builds the "minimum useful product" as an initial version and then quickly iterates successive versions allowing for internal and user feedback and careful consideration of quality with every small step.

    ThisIsHardToRead, asIsThis. This_is_easier, unless_it_is_underlined. This.is.easy. This-is-easy-too. Almost as easy to read as this.


## Multithreading

### Convars

Ein von einer Convar gelockter Mutex, kann jederzeit wieder geöffnet werden.
Es muss also immer geprüft werden, ob die von der Convar
kontrollierte Variable auch tatsächlich den entsprechenden Status hat.

    bool   fooReady = false
    Convar fooConvar
    Mutex  fooMutex

    void WaiterThreadFn()
    {
        fooMutex.lock()
        while(true)
        {
            fooConvar.wait(fooMutex)
            if(fooReady)
                break;
        }
        // dinge tun
        fooMutex.unlock()
    }

    void SignalThreadFn()
    {
        fooMutex.lock()
        fooRead = true
        fooConvar.signal() // Vor unlock!
        fooMutex.unlock()
    }

Ausserdem sollte bei `conver.signal` immer der entsprechende Mutex gelockt sein.
Siehe:
http://www.domaigne.com/blog/computing/condvars-signal-with-mutex-locked-or-not/
http://stackoverflow.com/questions/4544234/calling-pthread-cond-signal-without-locking-mutex

Aus der Valgrind-Dokumentation:
> Sending a signal without holding a lock on the associated mutex is a common
> programming error which can cause subtle race conditions and unpredictable behavior.
> There exist some uncommon synchronization patterns however
> where it is safe to send a signal without holding a lock on the associated mutex.

Hab allerdings auch schon vom Gegenteil gelesen. Hmm.

TODO: notify


## C/C++ Spezifisches

### Strukturen initialisieren
    struct Test
    {
        int foo;
    };

    Test test;
    test.foo = 42;

Soweit läuft alles korrekt.
Nun beschliesst aber jemand die Struktur `Test` um neue Attribute zu erweitern
und schon hat man uninitialisierte Speicherbereiche.

Auch wenn die Struktur über `{ 42 }` oder `{ .foo=42 }` initialisiert wird,
würde das den Compiler nicht bewegen ein Warning oder gar einen Error auszugeben.
Die einzig sichere Methode scheint der konsequente Einsatz eines Konstruktors zu sein.
(In C dann analog eine Konstruktor-Funktion.)


### C11 / C++11

Da denkt man an nichts böses und kompiliert mit dem GCC ein Programm was
C++11 Threads nutzt und bekommt prompt bei der Thread-Erstellung ein
`Operation not permitted` an den Kopf geworfen.

Auf Linux Systemen reicht es nicht, über `-std=c++11` den neuen Standart
zu aktivieren. Um Threads nutzen zu können muss man ausserdem auch `-pthread`
mit übergeben, da multithreading scheinbar keine Kernfunktion ist.

Wie auch immer. Sollte man halt im Kopf behalten.
