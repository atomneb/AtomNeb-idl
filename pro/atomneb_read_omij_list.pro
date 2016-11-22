function atomneb_read_omij_list, Atom_Omij_file
;+
; NAME:
;     atomneb_read_omij_list
; PURPOSE:
;     read the list of collision strengths (omega_ij) from the 1st binary table extension
;     of the FITS data file (./AtomOmij.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     omij_data_list=atomneb_read_omij_list(Atom_Omij_file)
;
; INPUTS:
;     fits_file - the MGFIT line data (./AtomOmij.fits)
; RETURN:  omij_data_list
;          { Omij_Data:'', 
;            Extention:0.0}
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 24/12/2015
;- 
  element_template={Omij_Data:'', Extention:0}
  
  ftab_ext,Atom_Omij_file,[1,2],Omij_Data,Extention,EXTEN_NO =1
  temp=size(Omij_Data,/DIMENSIONS)
  element_length=temp[0]
  
  element_data=replicate(element_template, element_length)
  for i=0, element_length-1 do begin 
     element_data[i].Omij_Data=strtrim(Omij_Data[i])
     element_data[i].Extention=Extention[i]
  endfor
  return, element_data
end

