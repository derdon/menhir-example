About
=====
NOTE: This code is all *example* code. It is targeted to developers; read it
and learn from it!

This example should be seen as an extension to the already existing menhir
examples (accessible through the directory "demo" in the source code of menhir).

To write this code, I used the example demos/calc from menhir's source code.
In the files lexer.mll and parser.mly I added comments for my own modifications
so that the reader of the source code can distinguish between code from INRIA
and code added by me.

A testfile is attached to avoid misunderstandings with the required file format.

Dependencies / Requirements
===========================
- OCaml_, tested with version 3.11.2
- Batteries_, tested with version 1.1.0-1
- menhir_ , tested with version 20090505
- Dune_, tested with version 1.8.2

File format
===========
Every expression must end with a semicolon (;). Whitespace, tabulators and
newlines are ignored.

How to compile
==============
``ocamlbuild calc.native``

Alternatively, there is support for the `dune` (formerly `jbuilder`) build-system:
```dune builld calc.exe```

How to use
==========
``./calc.native [filename]``

If you built with dune, run with ``dune exec ./calc.exe [filename]``

This command will print a list of results, represented as an OCaml list.

.. _OCaml: http://caml.inria.fr
.. _Batteries: http://batteries.forge.ocamlcore.org/
.. _menhir: http://cristal.inria.fr/~fpottier/menhir/
.. _Dune: https://github.com/ocaml/dune
