function atomneb_get_aeff_sh95_reference_citation, Atom_RC_file, atom, ion, reference=reference, case1=case1
;+
; NAME:
;     atomneb_get_omij_reference_citation
; PURPOSE:
;     read the citation of a given references of recombination coefficients (Aeff)
;     from the 2nd binary table extension of the FITS data file (./rc_SH95.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     fits_file - the MGFIT line data (./rc_SH95.fits)
;     atom='h'
;     ion='ii'
;     citation=atomneb_get_aeff_sh95_reference_citation(Atom_RC_file, atom, ion)
;     print,citation
;
; INPUTS:
;     fits_file - the MGFIT line data (./rc_SH95.fits)
;     atom - atom name e.g. 'h'
;     ion - ionic level e.g 'ii'
;     reference - reference, not necessary
; RETURN:  Citation: string
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 15/01/2017
;-  
  reference_template={Reference:'', Citation: ''}
  
  element_data_reference=atomneb_read_aeff_sh95_references(Atom_RC_file)
  atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_aeff'
  if keyword_set(case1) eq 1 then begin
    atom_ion_name=atom_ion_name+'_'+case1
  endif else begin
    atom_ion_name=atom_ion_name+'_b'
  endelse
  if keyword_set(reference) eq 1 then begin
    atom_ion_name=atom_ion_name+'_'+strupcase(reference)
  endif 
  
  ii=where(element_data_reference.Reference eq atom_ion_name);
  if ii eq -1 then begin
    print, 'could not find the given reference'
    exit
  endif
  Citation=element_data_reference[ii].Citation
  
  return, Citation
end
