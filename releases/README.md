# New in 1.44

- Reinstate old CTRL+up/down behaviour
- Fix screen drawing bug
- More reliably clear screen before returning to command mode
- Switch to Mode 135/Mode 7 when loading a file that's too large for
  the current mode
- Fix occasionally missing output when using *BR or *BZ
- Add separate `IFIND`, `ICHANGE` and `QICHANGE` commands for
  case-insensitive searching. `CASE` and `NOCASE` are gone
- You can press SHIFT+ESCAPE in edit mode to get back to BASIC
- When not in the second processor, you can (optionally - see docs)
  press SHIFT+ESCAPE in BASIC to get back to The BASIC Editor
  
The SHIFT+ESCAPE changes mean you can treat SHIFT+ESCAPE as
BASIC/editor toggle key.

Beta status has been removed. The invasive changes introduced in 1.41
seem to be behaving themselves.

# New in 1.43-beta

**1.43-beta is beta** - there may be issues, though hopefully only
minor, as some of the changes were rather invasive

- Fix`ZSAVE` and `ZRUN` in edit mode

# New in 1.42-beta

**1.42-beta is no longer available** - it was no good. `ZSAVE` and `ZRUN`
could create bad programs when invoked from edit mode

- New edit mode keyboard shortcuts: move to start/end of line; move to
  previous/next statement; `ZSAVE`; `ZRUN`
- Minor tweaks that may improve the speed a bit
- Clear screen when doing `EXIT`

# New in 1.41-beta

**1.41-beta is beta** - there may be issues, though hopefully only
minor, as some of the changes were rather invasive

- Command prompt HUD is gone (information still available via `INFO`)
- Program name mechanism has changed (see documentation)
- Speed improvements
- Free up space for future additions
- ROM version number is now bogus - really not sure this is worth
  bothering about though

# New in 1.40

- `*BZ` and `*BR`
- Shorten error messages to make space

# New in 1.39

- VDU5, VDU19 and COLOUR settings reset on entry (bug introduced in
  1.35)
- New `ZRUN` command that does a `ZSAVE` then `RUN`

# New in 1.38

- Paged mode disabled when editing (bug introduced in 1.35)
 
# New in 1.37

- You can press SHIFT+ESCAPE at the command prompt to get back to
  BASIC
- Searches can be case-insensitive

# New in 1.36

- Error messages work again (version 1.35 would hang if you tried to
  `LOAD` a non-existent file, for example)

# New in 1.35

(What happened to 1.34? Don't ask. It won't happen again.)

- `COPY` key forward deletes
- `MODE` restrictions have been lifted
- Full help text is back (albeit in a slightly less pretty form)
- `OVERTYPE` is back
- `ZAUTOSAV` is called `ZSAVE`
- The HIBASIC Editor
- Smaller command prompt HUD

# New in 1.33

- `RUN` can be spelt `R`
- Default colour scheme is white on black
- Insert mode is the default
- Command prompt HUD shows program name
- `SAVE` updates program name
- New `ZAUTOSAV` command to save the program under the program name
- Program name inferred from initial `REM>`
- Shorter HELP text
- `OVERTYPE` command mode command has been removed
- Smaller command prompt HUD
