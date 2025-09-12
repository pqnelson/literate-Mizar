This is a transcription of the Mizar system using Donald Knuth's WEB
system.

This assumes `WEAVE` is version 4.5; for earlier versions, you may
have to modify the Makefile.

# Build the documentation

**tl;dr**
To build the PDF, simply do the following:

```
~/Mizar-system/lit$ make
```

This will run Metapost (and mptopdf) on the relevant files in the
`img/` subdirectory, then run produce a 466 page PDF from the current
draft of the `parser.web` file.

# Plans

**Short-term goal:** Right now, I am trying to annotate and transcribe the files
needed for the Parser.

I have transcribed most of the files (I believe I need to finish transcribing
`base/wsmarticle.pas`).

I am in the process of annotating the `parser.pas` file.

**Long-term goal:** A question lurking in the back of my mind is,
"What does the Mizar system do which is not covered in the
Mizar-in-rust program?" This forces me to study the source code of
Mizar to answer it.

WEB is overspecialized to the Pascal dialect used at Stanford in the
late 1970s, early 1980s, tailored to Knuth's idiosyncratic style of
programming (e.g., Knuth uses one giant file with a `program`,
variables are global, etc.). Consequently it does not adequately index
Object Pascal. If I do this seriously, I may need to hack Weave to
support the adjustments needed. (As it stands, I should add a script
to strip out common types like `integer` and `boolean` from the index...)

# Observations

There is a lot of code in Mizar, not all of it is used. Most of it is
surprisingly well coded.

There are some bugs and possible improvements, but nothing severe so
far.

# Progress

So far I have transcribed and annotated about 18549 lines of code. These
are in 1610 numbered "chunks" spanning 545 pages (with an additional
161 pages of backmatter), for a total of 606 pages.

This is not even considering the `kernel` directory, which contains
40244 lines of code in 54 files.