function atomneb_read_aeff_collection_list, Atom_RC_file
;+
; NAME:
;     atomneb_read_aeff_collection_list
; PURPOSE:
;     read the list of effective recombination coefficients (Aeff) from the 1st binary table extension
;     of the FITS data file (./rc_collection.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     aeff_data_list=atomneb_read_aeff_collection_list(Atom_RC_file)
;
; INPUTS:
;     fits_file - the MGFIT line data (./rc_collection.fits)
; RETURN:  aeff_data_list
;          { Aeff_Data:'', 
;            Extention:0.0}
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 15/01/2017
;- 
  element_template={Aeff_Data:'', Extention:0}
  
  ftab_ext,Atom_RC_file,[1,2],Aeff_Data,Extention,EXTEN_NO =1
  temp=size(Aeff_Data,/DIMENSIONS)
  element_length=temp[0]
  
  element_data=replicate(element_template, element_length)
  for i=0, element_length-1 do begin 
     element_data[i].Aeff_Data=strtrim(Aeff_Data[i])
     element_data[i].Extention=Extention[i]
  endfor
  return, element_data
end

