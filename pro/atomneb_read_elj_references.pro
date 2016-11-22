function atomneb_read_elj_references, Atom_Elj_file
;+
; NAME:
;     atomneb_read_elj_references
; PURPOSE:
;     read the references of energy levels (Ej) from the 2nd binary table extension
;     of the FITS data file (./AtomElj.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     elj_data_reference=atomneb_read_elj_references(Atom_Elj_file)
;
; INPUTS:
;     fits_file - the MGFIT line data (./AtomElj.fits)
; RETURN:  elj_data_reference
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
  
  ftab_ext,Atom_Elj_file,[1,2],Reference,Citation,EXTEN_NO =2
  temp=size(Reference,/DIMENSIONS)
  reference_length=temp[0]
  
  reference_data=replicate(reference_template, reference_length)
  for i=0, reference_length-1 do begin 
     reference_data[i].Reference=strtrim(Reference[i])
     reference_data[i].Citation=strtrim(Citation[i])
  endfor
  return, reference_data
end

