;+
; Builds the proequib sav file.
;-

; clear any other compilations
.reset

; compile required code

@atomneb_compile_all

; create the sav file
save, filename='atomneb.sav', /routines, description='AtomNeb-idl ' + atomneb_version(/full)

exit
