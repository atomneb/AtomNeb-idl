function atomneb_search_omij, Atom_Omij_file, atom, ion
;+
; NAME:
;     atomneb_search_omij
; PURPOSE:
;     Search collision strengths (omega_ij) for given element
;     and ionic levels
; EXPLANATION:
;
; CALLING SEQUENCE:
;     atom='o'
;     ion='iii'
;     list_oiii_omij_data=atomneb_search_omij(Atom_Omij_file, atom, ion)
;     print,list_oiii_omij_data
;
; INPUTS:
;     fits_file - the MGFIT line data (./AtomOmij.fits)
;     atom - atom name e.g. 'o'
;     ion - ionic level e.g 'iii'
; RETURN:  Omij_Data: Array of Strings
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 24/12/2015
;- 
  element_data_list=atomneb_read_omij_list(Atom_Omij_file)
  atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_omij_*'
  ii=where(strmatch(element_data_list.Omij_Data, atom_ion_name));
  temp=size(ii,/DIMENSIONS)
  ii_length=temp[0]
  if ii_length eq 1 then begin
    if ii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
  endif
  Select_Omij_Data=element_data_list[ii].Omij_Data
  
  return, Select_Omij_Data
end
