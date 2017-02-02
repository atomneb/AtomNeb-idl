function atomneb_get_aeff_collection_reference_citation, Atom_RC_file, atom, ion, br=br, reference=reference
;+
; NAME:
;     atomneb_get_omij_reference_citation
; PURPOSE:
;     read the citation of a given references of recombination coefficients (Aeff)
;     from the 2nd binary table extension of the FITS data file (./rc_collection.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     fits_file - the MGFIT line data (./rc_collection.fits)
;     atom='c'
;     ion='iii'
;     citation=atomneb_get_aeff_collection_reference_citation(Atom_RC_file, atom, ion)
;     print,citation
;
; INPUTS:
;     fits_file - the MGFIT line data (./rc_collection.fits)
;     atom - atom name e.g. 'c'
;     ion - ionic level e.g 'iii'
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
  
  element_data_reference=atomneb_read_aeff_collection_references(Atom_RC_file)
  if keyword_set(br) eq 1 then prefix='_br' else prefix='_aeff'
  if keyword_set(reference) eq 1 then begin
    atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+prefix+'_'+strupcase(reference)
  endif else begin
    atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+prefix
  endelse
  
  ii=where(element_data_reference.Reference eq atom_ion_name);
  if ii eq -1 then begin
    print, 'could not find the given reference'
    exit
  endif
  Citation=element_data_reference[ii].Citation
  
  return, Citation
end
