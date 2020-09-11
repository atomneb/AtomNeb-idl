; docformat = 'rst'

function atomneb_read_omij, Atom_Omij_file, atom, ion, reference=reference, level_num=level_num
;+
;     This function returns the collision strengths (omega_ij) from the table extensions
;     of the FITS data file ('AtomOmij.fits').
;
; :Returns:
;    type=an array of data. This function returns the omij_data:
;          { level1:0, 
;            level2:0, 
;            strength:dblarr(temp_steps)}.
;
; :Params:
;     Atom_Omij_file  : in, required, type=string
;                     the FITS data file name ('AtomOmij.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'o'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Keywords:
;     reference     : in, type=string
;                     set for the reference e.g. 'SSB14'
;     level_num     : in, type=string
;                     set for the maximum level number.
;
; :Examples:
;    For example::
;
;     IDL> base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     IDL> data_dir = ['atomic-data', 'collection']
;     IDL> Atom_Omij_file = filepath('AtomOmij.fits', root_dir=base_dir, subdir=data_dir )
;     IDL> atom='o'
;     IDL> ion='iii'
;     IDL> reference='SSB14'
;     IDL> oiii_omij_data=atomneb_read_omij(Atom_Omij_file, atom, ion, reference=reference)
;     IDL> print,oiii_omij_data.level1
;        0       1       1       1       1       2       2       2       3       3       4
;     IDL> print,oiii_omij_data.level2
;        0       2       3       4       5       3       4       5       4       5       5
;     IDL> print,oiii_omij_data[0].strength
;        100.00000       125.89254       158.48932       199.52623       251.18864       ...
;
; :Categories:
;   Collisionally Excited Lines
;
; :Dirs:
;  ./
;      Main routines
;
; :Author:
;   Ashkbiz Danehkar
;
; :Copyright:
;   This library is released under a GNU General Public License.
;
; :Version:
;   0.2.0
;
; :History:
;     24/12/2015, IDL code by A. Danehkar
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
