DOs und DONTs beim Programmieren
================================

## Allgemeines

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
