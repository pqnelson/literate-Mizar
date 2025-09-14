# Conventions for WEB

- Macros should be used to simplify or clarify an **expression**,
  whereas new code chunks should be used to clarify **statements**.
- **Macro style...**
  - Remember: WEB macros accept at most one argument
  - Macro names should be written `in_snake_case`
  - Macros should not be used for statements.
  - Macros should be used for expressions.
  - The only "wiggle room" is when a macro condenses a function call
    (possibly doing some boilerplate "setup" or "cleanup" around it),
    because invoking a procedure is a perfectly acceptable statement.
- **Chunk style...**
  - Code chunks typically begin with an imperative verb "Sort the
    files", "Parse a definition block", etc.
  - People don't remember more than 4 things, so a code chunk should
    be organized around this: its contents should do at most 4 things.
- Named chunks are modified to be of the form `@* [x] name.` where `x`
  is `F` for a file, `C` for a chapter, `S` for a section, `s` for a
  subsection. And `x` could be the empty string, i.e., `[x]` could be
  `[]`.
  - Typically, each file transcribed corresponds to a `@* [F] filename.` 
- `begin` and `end`
  - I am following Knuth's _TeX: The Program_ for style regarding
    where to place the `end` keyword relative to the `begin` keyword.
  - For functions and procedures (even short ones), they should be on
    different lines.

## TeX Macros

- If you want a "named section" without starting a new page (or you
  don't want it to appear in the table of contents), then
  `@ \node{My new section.}` is how you would give the numbered
  paragraph a name in bold.
- Prefer using the `\texttt`, `\textbf`, `\textit` macros instead of
  `{\tt ...}`, `{\bf ...}`, `{\it ...}` (in case we end up changing to
  Noweb).
- Links can be inserted using `\href{url}{link name}`
- Links to arXiv can be inserted using `\arXiv{number}` --- for
  example, `\arXiv{2508.02305}` will insert a link [arXiv:2508.02305](https://arxiv.org/abs/2508.02305)
- Links to the doi can be inserted using `\doi{number}` --- for example,
  `\doi{10.1007/s10817-012-9261-6}` inserts [`doi:10.1007/s10817-012-9261-6`](https://dx.doi.org/10.1007/s10817-012-9261-6)
- Proofs end with a `\slug` macro (not that there are any proofs)
- Enumerated lists are written using `\enumerate\item ...\endenumerate`
- `\label` can be used for referencing paragraphs (and if you use it
  within a `\figure ... \endfigure`, it will refer to the figure
  number when you write its caption)
- `\ref` will produce the reference without a link, `\xref` produces a
  reference with the link to the referred paragraph (or figure)
- A lot of the notational choices are made to use semantic macros
  found in `notation.tex`

## Transcribing Code
  
- Reserved words in Pascal **must** be lowercase.
- A `case <expression> of...` **must** be closed with an `endcases`.
- A `case <expression> of ... else <statement> end` **must** be
  rewritten as `case <expression> of ... othercases <statement> endcases`
- Begin a file with the skeleton of the file, which usually looks like
  ```web
  @<GNU License@>
  unit [name]
     interface
        @<Interface for [name]@>@;
     implementation
        @<Implementation for [name]@>@;
     end.
  ```
  Sometimes the `uses` statement may appear in the skeleton, sometimes
  constants or global variables may appear if there are very few.

## Odds and ends

- Following Knuth's `mmixal.w` style, grammar should be typeset as
  ```tex
  $$\vbox{\halign{#\hfil\cr ...}}$$
  ```

# Spelling

- The modules of Mizar are spelled title-cased: Parser, Accommodator,
  Verifier, Schematizer, Equalizer, Unifier, etc. Always begin with a
  capital letter.
  - "Parser" when referring to the Mizar Parser as a proper Noun.
    (Or really, as a noun.) If we are referring to the abstract notion
    of a "parser", then it is lowercase.