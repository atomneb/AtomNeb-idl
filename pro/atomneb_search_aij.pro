; docformat = 'rst'

function atomneb_search_aij, Atom_Aij_file, atom, ion
;+
;     This function searches transition probabilities (Aij) for given element
;     and ionic levels in the FITS data file ('AtomAij.fits'), and returns the data entry.
;
; :Returns:
;    type=array of data. This function returns the Aij_Data.
;
; :Params:
;     Atom_Aij_file  : in, required, type=string
;                     the FITS data file name ('AtoAij.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'o'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Examples:
;    For example::
;
;     IDL> base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     IDL> data_dir = ['atomic-data', 'collection']
;     IDL> Atom_Aij_file = filepath('AtomAij.fits', root_dir=base_dir, subdir=data_dir )
;     IDL> atom='o'
;     IDL> ion='iii'
;     IDL> list_oiii_aij_data=atomneb_search_aij(Atom_Aij_file, atom, ion)
;     IDL> print,list_oiii_aij_data
;        o_iii_aij_FFT04-SZ00 o_iii_aij_FFT04 o_iii_aij_GMZ97-WFD96 o_iii_aij_SZ00-WFD96
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
