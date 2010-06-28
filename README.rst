About
=====
NOTE: This code is all *example* code. It is targeted to developers; read it
and learn from it!

This example should be seen as an extension to the already existing menhir
examples (accessible through the directory "demo" in the source code of menhir).

To write this code, I used the example demos/calc from menhir's source code.

A testfile is attached to avoid misunderstandings with the required file format.

Dependencies / Requirements
===========================
- OCaml_, tested with version 3.11.2
- Batteries_, tested with version 1.1.0-1
- menhir_ , tested with version 20090505

File format
===========
Every expression must end with a semicolon (;). Whitespace, tabulators and
newlines are ignored.

How to compile
==============
``ocamlbuild calc.native``

How to use
==========
``./calc.native [filename]``

This command will print a list of results, represented as an OCaml list.

.. _OCaml: http://caml.inria.fr
.. _Batteries: http://batteries.forge.ocamlcore.org/
.. _menhir: http://cristal.inria.fr/~fpottier/menhir/
