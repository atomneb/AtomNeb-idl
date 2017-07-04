function atomneb_list_aeff_n_ii_fsl13_references, Atom_RC_file, atom, ion
;+
; NAME:
;     atomneb_list_aeff_n_ii_fsl13_references
; PURPOSE:
;     list all references of recombination coefficients (Aeff) 
;     for given element and ionic level
; EXPLANATION:
;
; CALLING SEQUENCE:
;     atom='n'
;     ion='iii'
;     list_hi_aeff_reference=atomneb_list_aeff_n_ii_fsl13_references(Atom_RC_file, atom, ion)
;     print,list_hi_aeff_reference
;
; INPUTS:
;     fits_file - the MGFIT line data (./rc_n_iii_FSL13.fits)
; RETURN:  References: Array of Strings
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 03/07/2017
;- 
  rc_reference_template={AtomicData:'', Reference: ''}
  
  rc_reference_data=atomneb_read_aeff_n_ii_fsl13_references(Atom_RC_file)
  
  atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_aeff*'
  ii=where(strmatch(rc_reference_data.Reference, atom_ion_name));
  temp=size(ii,/DIMENSIONS)
  ii_length=temp[0]
  if ii_length eq 1 then begin
    if ii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
  endif
  Select_Reference=rc_reference_data[ii].Reference
  ;temp=size(Select_Omij_Data,/DIMENSIONS)
  References = STRARR(ii_length)
  for i=0, ii_length-1 do begin 
    Select_Aeff_Data_str1=strsplit(Select_Reference[i],'_', /EXTRACT)
    temp=size(Select_Aeff_Data_str1,/DIMENSIONS)
    ref_num=temp[0]
    if ref_num gt 3 then References[i] = Select_Aeff_Data_str1[3] else References[i] =''
  endfor
  return, References
end
