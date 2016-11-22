function atomneb_read_aij, Atom_Aij_file, atom, ion, reference=reference, level_num=level_num
;+
; NAME:
;     atomneb_read_aij
; PURPOSE:
;     read the transition probabilities (Aij) from the table extensions
;     of the FITS data file (./AtomAij.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     atom='o'
;     ion='iii'
;     reference='FFT04'
;     oiii_aij_data=atomneb_read_aij(Atom_Aij_file, atom, ion, reference=reference)
;     print,oiii_aij_data.Aij[*,*]
;
; INPUTS:
;     fits_file - the MGFIT line data (./AtomOmij.fits)
;     atom - atom name e.g. 'o'
;     ion - ionic level e.g 'iii'
;     reference - reference, optional e.g. 'FFT04', not necessary for Chianti52,60,70
;     level_num - maximum level number, optional, not necessary
; RETURN:  aij_data
;          { Aij:dblarr(n_level,n_level) }
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 24/12/2015
;-   
  element_data_list=atomneb_read_aij_list(Atom_Aij_file)
  if keyword_set(reference) eq 1 then begin
    atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_aij_'+strupcase(reference)
    ii=where(element_data_list.Aij_Data eq atom_ion_name);
    if ii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
  endif else begin
    atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_aij*'
    iii=where(strmatch(element_data_list.Aij_Data, atom_ion_name, /FOLD_CASE) eq 1)
    if iii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
    ii=min(iii)
  endelse
  Extention=element_data_list[ii].Extention
  
  fits_read,Atom_Aij_file,Aij,header1,EXTEN_NO =Extention 
  ;ftab_ext,Atom_Aij_file,Aij,EXTEN_NO =Extention
  temp=size(Aij,/DIMENSIONS)
  n_level=temp[0]
  aij_template={Aij:dblarr(n_level,n_level)}
  if keyword_set(level_num) eq 1 then begin
     if level_num le n_level then level_length=level_num  
  endif else begin
    level_length=n_level
  endelse
  
  aij_data=replicate(aij_template, 1)
  aij_data.Aij[*,*]=Aij[*,*]
  return, aij_data
end
