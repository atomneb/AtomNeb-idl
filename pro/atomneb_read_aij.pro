; docformat = 'rst'

function atomneb_read_aij, Atom_Aij_file, atom, ion, reference=reference, level_num=level_num
;+
;     This function returns the transition probabilities (Aij) from the table extensions
;     of the FITS data file ('AtomAij.fits').
;
; :Returns:
;    type=an array of data. This function returns the aij_data:
;          { Aij:dblarr(n_level,n_level) }.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('AtoAij.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'o'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Keywords:
;     reference     : in, type=string
;                     set for the reference,  not necessary
;     level_num     : in, type=string
;                     set for the maximum level number.
;
; :Examples:
;    For example::
;
;     IDL> base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     IDL> data_dir = ['atomic-data', 'collection']
;     IDL> Atom_Aij_file = filepath('AtomAij.fits', root_dir=base_dir, subdir=data_dir )
;     IDL> atom='o'
;     IDL> ion='iii'
;     IDL> reference='FFT04'
;     IDL> oiii_aij_data=atomneb_read_aij(Atom_Aij_file, atom, ion, reference=reference)
;     IDL> print,oiii_aij_data.Aij[*,*]
;        0.0000000   2.5960000e-05   3.0300000e-11   2.3220000e-06       0.0000000    0.0021910000
;        0.0000000       0.0000000   9.6320000e-05    0.0069510000      0.22550000       230.80000
;        0.0000000       0.0000000       0.0000000     0.020290000   0.00069980000       576.50000
;        0.0000000       0.0000000       0.0000000       0.0000000       1.6850000    0.0057770000
;        0.0000000       0.0000000       0.0000000       0.0000000       0.0000000   3.7600000e-11
;        0.0000000       0.0000000       0.0000000       0.0000000       0.0000000       0.0000000
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
  element_data_list=atomneb_read_aij_list(Atom_Aij_file)
  if keyword_set(reference) eq 1 then begin
    atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_aij_'+reference
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
  Extension=element_data_list[ii].Extension
  
  fits_read,Atom_Aij_file,Aij,header1,EXTEN_NO =Extension 
  ;ftab_ext,Atom_Aij_file,Aij,EXTEN_NO =Extension
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
