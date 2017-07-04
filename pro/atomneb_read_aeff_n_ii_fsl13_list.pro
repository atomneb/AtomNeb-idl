function atomneb_read_aeff_n_ii_fsl13_list, Atom_RC_file
;+
; NAME:
;     atomneb_read_aeff_n_ii_fsl13_list
; PURPOSE:
;     read the list of effective recombination coefficients (Aeff) from the 1st binary table extension
;     of the FITS data file (./rc_n_iii_FSL13.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     aeff_data_list=atomneb_read_aeff_n_ii_fsl13_list(Atom_RC_file)
;
; INPUTS:
;     fits_file - the MGFIT line data (./rc_n_iii_FSL13.fits)
; RETURN:  aeff_data_list
;          {Aeff_Data:'',  Extention:0, $
;           IND:long(0), Wavelength: float(0.0), $
;           Tr:'',  Trans: '', T_X: ''}
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 03/07/2017
;- 
  
  element_template={Aeff_Data:'',  Extention:0, $
                       IND:long(0), Wavelength: float(0.0), $
                       Tr:'',  Trans: '', T_X: ''}
                       
  ftab_ext,Atom_RC_file,[1,2,3,4,5,6],Aeff_Data,Extention,IND,Wavelength,Tr,Trans,EXTEN_NO =1
  temp=size(Aeff_Data,/DIMENSIONS)
  element_length=temp[0]
  
  element_data=replicate(element_template, element_length)
  for i=0, element_length-1 do begin 
     element_data[i].Aeff_Data=strtrim(Aeff_Data[i],2)
     element_data[i].Extention=Extention[i]
     element_data[i].IND=IND[i]
     element_data[i].Wavelength=Wavelength[i]
     element_data[i].Tr=strtrim(Tr[i],2)
     element_data[i].Trans=strtrim(Trans[i],2)
  endfor
  return, element_data
end

