function atomneb_read_elj, Atom_Elj_file, atom, ion, level_num=level_num
;+
; NAME:
;     atomneb_read_elj
; PURPOSE:
;     read the energy levels (Ej) from the table extensions
;     of the FITS data file (./AtomElj.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     atom='o'
;     ion='iii'
;     oiii_elj_data=atomneb_read_elj(Atom_Elj_file, atom, ion, level_num=6)
;     print,oiii_elj_data.J_v
;     print,oiii_elj_data.Ej
;
; INPUTS:
;     fits_file - the MGFIT line data (./AtomElj.fits)
;     atom - atom name e.g. 'o'
;     ion - ionic level e.g 'iii'
;     level_num - maximum level number, optional, not necessary
; RETURN:  elj_data
;          { Configuration:'', 
;            Term:'', 
;            J:'', 
;            J_v:0.0, 
;            Ej:0.0, 
;            Reference:''}
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 24/12/2015
;- 
  element_data_list=atomneb_read_elj_list(Atom_Elj_file)
  atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_elj'
  ii=where(element_data_list.Elj_Data eq atom_ion_name);
  if ii eq -1 then begin
    print, 'could not find the given element or ion'
    exit
  endif
  Extention=element_data_list[ii].Extention

  level_template={Configuration:'', Term:'', J:'', J_v: float(0.0), Ej:double(0.0), Reference:''}
  
  ftab_ext,Atom_Elj_file,[1,2,3,4,5,6],Configuration,Term,J_s,J_v,Ej,Reference,EXTEN_NO =Extention
  temp=size(Reference,/DIMENSIONS)
  level_length=temp[0]
  if keyword_set(level_num) eq 1 then begin
     if level_num le level_length then level_length=level_num  
  endif else begin
    level_length=temp[0]
  endelse
  
  level_data=replicate(level_template, level_length)
  for i=0, level_length-1 do begin 
     level_data[i].Configuration=strtrim(Configuration[i])
     level_data[i].Term=strtrim(Term[i])
     level_data[i].J=strtrim(J_s[i])
     level_data[i].J_v=J_v[i]
     level_data[i].Ej=Ej[i]
     level_data[i].Reference=strtrim(Reference[i])
  endfor
  return, level_data
end
