function atomneb_get_aij_reference_citation, Atom_Aij_file, atom, ion, reference
;+
; NAME:
;     atomneb_get_aij_reference_citation
; PURPOSE:
;     read the citation of a given references of transition probabilities(Aij) 
;     from the 2nd binary table extension of the FITS data file (./AtoAij.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     fits_file - the MGFIT line data (./AtoAij.fits)
;     atom='o'
;     ion='iii'
;     reference='FFT04'
;     citation=atomneb_get_aij_reference_citation(Atom_Omij_file, atom, ion, reference)
;     print,citation
;
; INPUTS:
;     fits_file - the MGFIT line data (./AtomOmij.fits)
;     atom - atom name e.g. 'o'
;     ion - ionic level e.g 'iii'
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
  
  element_data_reference=atomneb_read_aij_references(Atom_Aij_file)
  atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_aij_'+strupcase(reference)
  ii=where(element_data_reference.Reference eq atom_ion_name);
  if ii eq -1 then begin
    print, 'could not find the given reference'
    exit
  endif
  Citation=element_data_reference[ii].Citation
  
  return, Citation
end
