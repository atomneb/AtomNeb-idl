function atomneb_read_aeff_o_ii_ssb17_references, Atom_RC_file
;+
; NAME:
;     atomneb_read_aeff_o_ii_ssb17_references
; PURPOSE:
;     read the list of recombination coefficients (Aeff) from the 2nd binary table extension
;     of the FITS data file (./rc_o_iii_SSB17.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     aeff_data_reference=atomneb_read_aeff_o_ii_ssb17_references(Atom_RC_file)
;
; INPUTS:
;     fits_file - the MGFIT line data (./rc_o_iii_SSB17.fits)
; RETURN:  aeff_data_reference
;          { Reference:'', 
;            Citation:''}
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 03/07/2017
;- 
  reference_template={Reference:'', Citation: ''}
  
  ftab_ext,Atom_RC_file,[1,2],Reference,Citation,EXTEN_NO =2
  temp=size(Reference,/DIMENSIONS)
  reference_length=temp[0]
  if reference_length eq 0 then reference_length=1
  
  reference_data=replicate(reference_template, reference_length)
  for i=0, reference_length-1 do begin 
     reference_data[i].Reference=strtrim(Reference[i])
     reference_data[i].Citation=strtrim(Citation[i])
  endfor
  return, reference_data
end

