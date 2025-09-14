# Conventions for WEB

- Macros should be used to simplify or clarify an **expression**,
  whereas new code chunks should be used to clarify **statements**.
  - Macros should not be used for statements.
- Code chunks typically begin with an imperative verb "Sort the
  files", "Parse a definition block", etc.
  - People don't remember more than 4 things, so a code chunk should
    be organized around this.
- Named chunks are modified to be of the form `@* [x] name.` where `x`
  is `F` for a file, `C` for a chapter, `S` for a section, `s` for a
  subsection. And `x` could be the empty string, i.e., `[x]` could be
  `[]`.
  - Typically, each file transcribed corresponds to a `@* [F] filename.` 

## TeX Macros

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