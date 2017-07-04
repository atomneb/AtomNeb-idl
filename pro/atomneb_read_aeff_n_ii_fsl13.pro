function atomneb_read_aeff_n_ii_fsl13, Atom_RC_file, atom, ion, wavelength_range, wavelength=wavelength, reference=reference
;+
; NAME:
;     atomneb_read_aeff_n_ii_fsl13
; PURPOSE:
;     read the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file (./rc_n_iii_FSL13.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     atom='n'
;     ion='iii'
;     hi_aeff_data=atomneb_read_aeff_n_ii_fsl13(Atom_RC_file, atom, ion)
;     print,hi_aeff_data[0].Aeff
;
; INPUTS:
;     fits_file - the MGFIT line data (./rc_n_iii_FSL13.fits)
;     atom - atom name 'n'
;     ion - ionic level 'iii'
;     reference - reference, not necessary
; RETURN:  aeff_data: array
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 03/07/2017
;-  
  element_data_list=atomneb_read_aeff_n_ii_fsl13_list(Atom_RC_file)
  wave_min=min(wavelength_range)
  wave_max=max(wavelength_range)
  wave_loc1=where (element_data_list.wavelength ge wave_min and element_data_list.wavelength le wave_max)
  temp=size(wave_loc1,/DIMENSIONS) 
  if temp[0] lt 0 then return, 0
  wave_size=temp[0]
  rc_element_template={Wavelength: float(0.0), Aeff:fltarr(7,4)}
  rc_data=replicate(rc_element_template, wave_size)
   
  Extention1=element_data_list[wave_loc1].Extention
  Wavelength1=element_data_list[wave_loc1].wavelength
  
  if keyword_set(wavelength) eq 1 then begin
       rc_wave_template={Wavelength: float(0.0), Tr:'',  Trans: '', T_X: ''}
       rc_wave=replicate(rc_wave_template, wave_size)
       rc_wave.Wavelength=element_data_list[wave_loc1].wavelength
       rc_wave.Tr=element_data_list[wave_loc1].Tr
       rc_wave.Trans=element_data_list[wave_loc1].Trans
       rc_wave.T_X=element_data_list[wave_loc1].T_X
       return, rc_wave
  endif
  for i=0, wave_size-1 do begin 
    fits_read,Atom_RC_file,rc_aeff,header1,EXTEN_NO =Extention1[i]
    ;temp=size(rc_aeff,/DIMENSIONS)
    ;col1=temp[0]
    ;row1=temp[1]
    ;aeff_template={Aeff:dblarr(col1,row1)}
    ;rc_data=replicate(aeff_template, 1)
    rc_data[i].Wavelength=Wavelength1[i]
    rc_data[i].Aeff[*,*]=rc_aeff[*,*]
  endfor
  
  return, rc_data
end
