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
;   0.0.1
;
; :History:
;     24/12/2015, IDL code by A. Danehkar
;-

;+
; NAME:
;     atomneb_search_aij
;     
; PURPOSE:
;     This function searches transition probabilities (Aij) for given element
;     and ionic levels in the FITS data file ('AtomAij.fits'), and returns the data entry.
;
; CALLING SEQUENCE:
;     list_aij_data=atomneb_search_aij(Atom_Aij_file, atom, ion)
; 
; INPUTS:
;     Atom_Aij_file : in, required, type=string, the FITS data file name ('AtoAij.fits')
;     Atom          : in, required, type=string, atom name e.g. 'o'
;     Ion           : in, required, type=string, ionic level e.g 'iii'
; 
; OUTPUTS:  This function returns an array of data as the Aij_Data.
; 
; PROCEDURE: This function calls atomneb_read_aij_list and 
;            fits_read from IDL Astronomy User's library (../externals/astron/pro).
; 
; EXAMPLE:
;     base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     data_dir = ['atomic-data', 'collection']
;     Atom_Aij_file = filepath('AtomAij.fits', root_dir=base_dir, subdir=data_dir )
;     atom='o'
;     ion='iii'
;     list_oiii_aij_data=atomneb_search_aij(Atom_Aij_file, atom, ion)
;     print,list_oiii_aij_data
;     > o_iii_aij_FFT04-SZ00 o_iii_aij_FFT04 o_iii_aij_GMZ97-WFD96 o_iii_aij_SZ00-WFD96
;
; MODIFICATION HISTORY:
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
