function atomneb_read_aij_references, Atom_Aij_file
;+
; NAME:
;     atomneb_read_aij_references
; PURPOSE:
;     read the list of transition probabilities (Aij) from the 1st binary table extension
;     of the FITS data file (./AtomAij.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     aij_data_reference=atomneb_read_aij_references(Atom_Aij_file)
;
; INPUTS:
;     fits_file - the MGFIT line data (./AtomAij.fits)
; RETURN:  aij_data_reference
;          { Reference:'', 
;            Citation:''}
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 24/12/2015
;- 
  reference_template={Reference:'', Citation: ''}
  
  ftab_ext,Atom_Aij_file,[1,2],Reference,Citation,EXTEN_NO =2
  temp=size(Reference,/DIMENSIONS)
  reference_length=temp[0]
  
  reference_data=replicate(reference_template, reference_length)
  for i=0, reference_length-1 do begin 
     reference_data[i].Reference=strtrim(Reference[i])
     reference_data[i].Citation=strtrim(Citation[i])
  endfor
  return, reference_data
end
