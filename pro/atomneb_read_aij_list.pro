function atomneb_read_aij_list, Atom_Aij_file
;+
; NAME:
;     atomneb_read_aij_list
; PURPOSE:
;     read the list of transition probabilities (Aij) from the 1st binary table extension
;     of the FITS data file (./AtomAij.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     aij_data_list=atomneb_read_aij_list(Atom_Aij_file)
;
; INPUTS:
;     fits_file - the MGFIT line data (./AtomAij.fits)
; RETURN:  aij_data_list
;          { Aij_Data:'', 
;            Extention:0.0}
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 24/12/2015
;- 
  element_template={Aij_Data:'', Extention:0}
  
  ftab_ext,Atom_Aij_file,[1,2],Aij_Data,Extention,EXTEN_NO =1
  temp=size(Aij_Data,/DIMENSIONS)
  element_length=temp[0]
  
  element_data=replicate(element_template, element_length)
  for i=0, element_length-1 do begin 
     element_data[i].Aij_Data=strtrim(Aij_Data[i])
     element_data[i].Extention=Extention[i]
  endfor
  return, element_data
end

