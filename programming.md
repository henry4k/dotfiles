DOs und DONTs beim Programmieren
================================

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
