# Polyglot SuperCollider - Browser

A simple interface to the _hsc3-graphs_ database.
The database has programs written in various languages, each with the _.scsyndef_ the program evaluates to.

![](https://rohandrape.net/sw/hsc3-graphs/png/polyglot-browser.png)

The first pane is a list of all programs in the database.
The focus can be sent to the list pane by typing _Mod-P_.

When a program is selected it is displayed in the text area below the program list.

Programs can be played by pressing the _Play_ button or typing _Mod-,_.

The synthesiser can be reset by pressing the _Reset_ button or typing _Mod-._.

_Note_: _.scsyndef_ files that refer to Ugens that do not exist in the Wasm build will crash the synthesiser.
In particular the Mouse Ugens are not implemented.
