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
Siehe: http://www.domaigne.com/blog/computing/condvars-signal-with-mutex-locked-or-not/


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
