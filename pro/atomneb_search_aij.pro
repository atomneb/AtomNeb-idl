function atomneb_search_aij, Atom_Aij_file, atom, ion
;+
; NAME:
;     atomneb_search_omij
; PURPOSE:
;     Search transition probabilities (Aij) for given element
;     and ionic levels
; EXPLANATION:
;
; CALLING SEQUENCE:
;     atom='o'
;     ion='iii'
;     list_oiii_aij_data=atomneb_search_aij(Atom_Aij_file, atom, ion)
;     print,list_oiii_aij_data
;
; INPUTS:
;     fits_file - the MGFIT line data (./AtomAij.fits)
;     atom - atom name e.g. 'o'
;     ion - ionic level e.g 'iii'
; RETURN:  Aij_Data: Array of Strings
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 24/12/2015
;- 
  element_data_list=atomneb_read_aij_list(Atom_Aij_file)
  atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_aij_*'
  ii=where(strmatch(element_data_list.Aij_Data, atom_ion_name));
  temp=size(ii,/DIMENSIONS)
  ii_length=temp[0]
  if ii_length eq 1 then begin
    if ii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
  endif
  Select_Aij_Data=element_data_list[ii].Aij_Data
  
  return, Select_Aij_Data
end
