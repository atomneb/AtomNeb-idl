function atomneb_search_aeff_o_ii_ssb17, Atom_RC_file, atom, ion, case1, wavelength
;+
; NAME:
;     atomneb_search_aeff_o_ii_ssb17
; PURPOSE:
;     Search effective recombination coefficients (Aeff) for given element
;     and ionic levels
; EXPLANATION:
;
; CALLING SEQUENCE:
;     atom='n'
;     ion='iii'
;     list_nii_aeff_data=atomneb_search_aeff_o_ii_ssb17(Atom_RC_file, atom, ion, wavelength)
;     print,list_nii_aeff_data
;
; INPUTS:
;     fits_file - the MGFIT line data (./rc_o_iii_SSB17.fits)
;     atom - atom name 'o'
;     ion - ionic level 'iii'
;     wavelength - wavelength
; RETURN:  Aeff_Data: Array of Strings
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 03/07/2017
;- 
  element_data_list=atomneb_read_aeff_o_ii_ssb17_list(Atom_RC_file)
  
  ii=where(abs(element_data_list.wavelength-wavelength) le 0.02 and element_data_list.case1 eq case1) 
  temp=size(ii,/DIMENSIONS)
  ii_length=temp[0]
  if ii_length eq 1 then begin
    if ii eq -1 then begin
      print, 'could not find the given wavelength'
      exit
    endif
  endif else begin
     if ii_length gt 1 then begin
       ii_min=min(abs(element_data_list[ii].wavelength-wavelength))
       ii=where(abs(element_data_list.wavelength-wavelength) eq ii_min and element_data_list.case1 eq case1) 
       temp=size(ii,/DIMENSIONS)
       ii_length=temp[0]
     endif
  endelse
  Extention1=element_data_list[ii].Extention
  Wavelength1=element_data_list[ii].wavelength
  
  rc_element_template={Wavelength: float(0.0), Aeff:fltarr(16,25)}
  Select_Aeff_Data=replicate(rc_element_template, ii_length)
  for i=0, ii_length-1 do begin 
    fits_read,Atom_RC_file,rc_aeff,header1,EXTEN_NO =Extention1[ii]
    Select_Aeff_Data[i].Wavelength=Wavelength1[ii]
    Select_Aeff_Data[i].Aeff[*,*]=rc_aeff[*,*]
  endfor
  return, Select_Aeff_Data
end
