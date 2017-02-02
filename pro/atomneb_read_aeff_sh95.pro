function atomneb_read_aeff_sh95, Atom_RC_file, atom, ion, reference=reference, case1=case1
;+
; NAME:
;     atomneb_read_rc_sh95
; PURPOSE:
;     read the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file (./rc_SH95.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     atom='h'
;     ion='ii'
;     hi_aeff_data=atomneb_read_rc_sh95(Atom_RC_file, atom, ion)
;     print,hi_aeff_data[0].Aeff
;
; INPUTS:
;     fits_file - the MGFIT line data (./rc_SH95.fits)
;     atom - atom name e.g. 'o'
;     ion - ionic level e.g 'iii'
;     reference - reference, not necessary
; RETURN:  aeff_data: array
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 15/01/2017
;-  
  element_data_list=atomneb_read_aeff_sh95_list(Atom_RC_file)
  if keyword_set(reference) eq 1 then begin
    atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_aeff'
    if keyword_set(case1) eq 1 then begin
      atom_ion_name=atom_ion_name+'_'+case1
    endif else begin
      atom_ion_name=atom_ion_name+'_b'
    endelse
    atom_ion_name=atom_ion_name+'_'+strupcase(reference)
    ii=where(element_data_list.Aeff_Data eq atom_ion_name);
    if ii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
  endif else begin
    atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_aeff'
    if keyword_set(case1) eq 1 then begin
      atom_ion_name=atom_ion_name+'_'+case1
    endif else begin
      atom_ion_name=atom_ion_name+'_b'
    endelse
    atom_ion_name=atom_ion_name+'*'
    iii=where(strmatch(element_data_list.Aeff_Data, atom_ion_name, /FOLD_CASE) eq 1)
    if iii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
    ii=min(iii)
  endelse

  Extention=element_data_list[ii].Extention
 
  fits_read,Atom_RC_file,rc_aeff,header1,EXTEN_NO =Extention 
  temp=size(rc_aeff,/DIMENSIONS)
  col1=temp[0]
  row1=temp[1]
  aeff_template={Aeff:dblarr(col1,row1)}
  rc_data=replicate(aeff_template, 1)
  rc_data.Aeff[*,*]=rc_aeff[*,*]
  
  ;endfor
  return, rc_data
end
