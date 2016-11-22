function atomneb_get_elj_reference_citation, Atom_Elj_file, reference
;+
; NAME:
;     atomneb_get_elj_reference_citation
; PURPOSE:
;     read the citation of a given references of energy levels (Ej) 
;     from the 2nd binary table extension of the FITS data file (./AtomElj.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     citation=atomneb_get_elj_reference_citation(Atom_Elj_file, 'L7288')
;     print,citation
;
; INPUTS:
;     fits_file - the MGFIT line data (./AtomElj.fits)
;     reference - reference
; RETURN:  Citation: string
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 24/12/2015
;-  
  reference_template={Reference:'', Citation: ''}
  
  element_data_reference=atomneb_read_elj_references(Atom_Elj_file)
  ii=where(element_data_reference.Reference eq reference);
  if ii eq -1 then begin
    print, 'could not find the given reference'
    exit
  endif
  Citation=element_data_reference[ii].Citation
  
  return, Citation
end
