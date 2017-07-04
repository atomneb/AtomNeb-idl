function atomneb_read_omij, Atom_Omij_file, atom, ion, reference=reference, level_num=level_num
;+
; NAME:
;     atomneb_read_omij
; PURPOSE:
;     read the collision strengths (omega_ij) from the table extensions
;     of the FITS data file (./AtomOmij.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     atom='o'
;     ion='iii'
;     reference='SSB14'
;     oiii_omij_data=atomneb_read_omij(Atom_Omij_file, atom, ion, reference=reference)
;     print,oiii_omij_data.level1
;     print,oiii_omij_data.level2
;     print,oiii_omij_data[0].strength
;
; INPUTS:
;     fits_file - the MGFIT line data (./AtomOmij.fits)
;     atom - atom name e.g. 'o'
;     ion - ionic level e.g 'iii'
;     reference - reference, optional e.g. 'SSB14', not necessary for Chianti52,60,70
;     level_num - maximum level number, optional, not necessary
; RETURN:  omij_data
;          { level1:0, 
;            level2:0, 
;            strength:dblarr(temp_steps)}
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 24/12/2015
;-  
  element_data_list=atomneb_read_omij_list(Atom_Omij_file)
  if keyword_set(reference) eq 1 then begin
    atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_omij_'+reference
    ii=where(element_data_list.Omij_Data eq atom_ion_name);
    if ii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
  endif else begin
    atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_omij*'
    iii=where(strmatch(element_data_list.Omij_Data, atom_ion_name, /FOLD_CASE) eq 1)
    if iii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
    ii=min(iii)
  endelse

  Extention=element_data_list[ii].Extention
 
  ftab_ext,Atom_Omij_file,[1,2,3],level1,level2,strength,EXTEN_NO =Extention
  temp=size(level1,/DIMENSIONS)
  n_line=temp[0]
  temp=size(strength,/DIMENSIONS)
  temp_steps=temp[0]
  n_level=max([max(level1),max(level2)])
  omij_template={level1:0, level2:0, strength:dblarr(temp_steps)}
  if keyword_set(level_num) eq 1 then begin
     if level_num le n_level then level_length=level_num  
  endif else begin
    level_length=n_level
  endelse
  
  omij_data=replicate(omij_template, n_line)
  for i=0, n_line-1 do begin 
     omij_data[i].level1=level1[i]
     omij_data[i].level2=level2[i]
     omij_data[i].strength=strength[*,i]
  endfor
  return, omij_data
end
