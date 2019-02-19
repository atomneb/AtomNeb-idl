; docformat = 'rst'

function atomneb_read_elj, Atom_Elj_file, atom, ion, level_num=level_num
;+
;     This function returns the energy levels (Ej) from the table extensions
;     of the FITS data file ('AtomElj.fits').
;
; :Returns:
;    type=an array of data. This function returns the elj_data:
;          { Configuration:'', 
;            Term:'', 
;            J:'', 
;            J_v:0.0, 
;            Ej:0.0, 
;            Reference:''}.
;
; :Params:
;     Atom_Elj_file  : in, required, type=string
;                     the FITS data file name ('AtomElj.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'o'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Keywords:
;     level_num     : in, type=string
;                     set for the maximum level number.
;
; :Examples:
;    For example::
;
;     IDL> base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     IDL> data_dir = ['atomic-data', 'collection']
;     IDL> Atom_Elj_file = filepath('AtomElj.fits', root_dir=base_dir, subdir=data_dir )
;     IDL> atom='o'
;     IDL> ion='iii'
;     IDL> oiii_elj_data=atomneb_read_elj(Atom_Elj_file, atom, ion, level_num=6)
;     IDL> print,oiii_elj_data.J_v
;        0.00000      1.00000      2.00000      2.00000      0.00000      2.00000
;     IDL> print,oiii_elj_data.Ej
;        0.0000000       113.17800       306.17400       20273.270       43185.740       60324.790
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
;   0.0.1
;
; :History:
;     24/12/2015, IDL code by A. Danehkar
;-

;+
; NAME:
;     atomneb_read_elj
;
; PURPOSE:
;     This function returns the energy levels (Ej) from the table extensions
;     of the FITS data file ('AtomElj.fits').
;
; CALLING SEQUENCE:
;     elj_data=atomneb_read_elj(Atom_Elj_file, atom, ion, level_num=level_num)
;
; INPUTS:
;     Atom_Elj_file : in, required, type=string, the FITS data file name ('AtomElj.fits')
;     Atom          : in, required, type=string, atom name e.g. 'o'
;     Ion           : in, required, type=string, ionic level e.g 'iii'
;
; KEYWORD PARAMETERS:
;     LEVEL_NUM     : in, type=string, set for the maximum level number.
;
; OUTPUTS:  This function returns an array data of the elj_data:
;          { Configuration:'', 
;            Term:'', 
;            J:'', 
;            J_v:0.0, 
;            Ej:0.0, 
;            Reference:''}.
;
; PROCEDURE: This function calls atomneb_read_elj_list and
;            ftab_ext from IDL Astronomy User's library (../externals/astron/pro).
;
; EXAMPLE:
;     base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     data_dir = ['atomic-data', 'collection']
;     Atom_Elj_file = filepath('AtomElj.fits', root_dir=base_dir, subdir=data_dir )
;     atom='o'
;     ion='iii'
;     oiii_elj_data=atomneb_read_elj(Atom_Elj_file, atom, ion, level_num=6)
;     print,oiii_elj_data.J_v
;     > 0.00000      1.00000      2.00000      2.00000      0.00000      2.00000
;     print,oiii_elj_data.Ej
;     > 0.0000000       113.17800       306.17400       20273.270       43185.740       60324.790
;
; MODIFICATION HISTORY:
;     24/12/2015, IDL code by A. Danehkar
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
