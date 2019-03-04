; docformat = 'rst'

;+
; Returns AtomNeb version. This file is automatically edited 
; by the builder to include the revision.
;
; :Returns:
;    string
;
; :Keywords:
;    full : in, optional, type=boolean
;       set to return Subversion revision as well
;-
function atomneb_version, full=full
  compile_opt strictarr, hidden

  version = '0.0.2'
  revision = '-01e74b37'

  return, version + (keyword_set(full) ? (' ' + revision) : '')
end
