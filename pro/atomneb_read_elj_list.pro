function atomneb_read_elj_list, Atom_Elj_file
;+
; NAME:
;     atomneb_read_elj_list
; PURPOSE:
;     read the list of energy levels (Ej) from the 1st binary table extension
;     of the FITS data file (./AtomElj.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     elj_data_list=atomneb_read_elj_list(Atom_Elj_file)
;
; INPUTS:
;     fits_file - the MGFIT line data (./AtomElj.fits)
; RETURN:  elj_data_list
;          { Elj_Data:'', 
;            Extention:0.0}
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 24/12/2015
;- 
  element_template={Elj_Data:'', Extention:0}
  
  ftab_ext,Atom_Elj_file,[1,2],Elj_Data,Extention,EXTEN_NO =1
  temp=size(Elj_Data,/DIMENSIONS)
  element_length=temp[0]
  
  element_data=replicate(element_template, element_length)
  for i=0, element_length-1 do begin 
     element_data[i].Elj_Data=strtrim(Elj_Data[i])
     element_data[i].Extention=Extention[i]
  endfor
  return, element_data
end

