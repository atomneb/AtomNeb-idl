function atomneb_read_aeff_o_ii_ssb17, Atom_RC_file, atom, ion, case1, wavelength_range, wavelength=wavelength, reference=reference
;+
; NAME:
;     atomneb_read_aeff_o_ii_ssb17
; PURPOSE:
;     read the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file (./rc_o_iii_SSB17.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     atom='n'
;     ion='iii'
;     hi_aeff_data=atomneb_read_aeff_o_ii_ssb17, Atom_RC_file(Atom_RC_file, atom, ion, wavelength_range)
;     print,hi_aeff_data[0].Aeff
;
; INPUTS:
;     fits_file - the MGFIT line data (./rc_o_iii_SSB17.fits)
;     atom - atom name 'o'
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
  element_data_list=atomneb_read_aeff_o_ii_ssb17_list(Atom_RC_file)
  wave_min=min(wavelength_range)
  wave_max=max(wavelength_range)
  wave_loc1=where (element_data_list.wavelength ge wave_min and element_data_list.wavelength le wave_max and element_data_list.case1 eq case1)
  temp=size(wave_loc1,/DIMENSIONS) 
  if temp[0] lt 0 then return, 0
  wave_size=temp[0]
  rc_element_template={Wavelength: float(0.0), Aeff:fltarr(16,25)}
  rc_data=replicate(rc_element_template, wave_size)
   
  Extention1=element_data_list[wave_loc1].Extention
  Wavelength1=element_data_list[wave_loc1].wavelength
  
  if keyword_set(wavelength) eq 1 then begin
       rc_wave_template={Wavelength: float(0.0), lower_term:'',  upper_term: ''}
       rc_wave=replicate(rc_wave_template, wave_size)
       rc_wave.Wavelength=element_data_list[wave_loc1].wavelength
       rc_wave.lower_term=element_data_list[wave_loc1].lower_term
       rc_wave.upper_term=element_data_list[wave_loc1].upper_term
       return, rc_wave
  endif
  for i=0, wave_size-1 do begin 
    fits_read,Atom_RC_file,rc_aeff,header1,EXTEN_NO =Extention1[i]
    rc_data[i].Wavelength=Wavelength1[i]
    rc_data[i].Aeff[*,*]=rc_aeff[*,*]
  endfor
  
  return, rc_data
end
