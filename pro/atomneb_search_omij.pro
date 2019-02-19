; docformat = 'rst'

function atomneb_search_omij, Atom_Omij_file, atom, ion
;+
;     This function searches collision strengths (omega_ij) for given element
;     and ionic levels in the FITS data file ('AtomOmij.fits'), and returns the data entry.
;
; :Returns:
;    type=array of data. This function returns the Omij_Data.
;
; :Params:
;     Atom_Omij_file  : in, required, type=string
;                     the FITS data file name ('AtomOmij.fits')
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
;     IDL> Atom_Omij_file = filepath('AtomOmij.fits', root_dir=base_dir, subdir=data_dir )
;     IDL> atom='o'
;     IDL> ion='iii'
;     IDL> list_oiii_omij_data=atomneb_search_omij(Atom_Omij_file, atom, ion)
;     IDL> print,list_oiii_omij_data
;        o_iii_omij_AK99 o_iii_omij_LB94 o_iii_omij_Pal12-AK99 o_iii_omij_SSB14
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
;     This function searches collision strengths (omega_ij) for given element
;     and ionic levels in the FITS data file ('AtomOmij.fits'), and returns the data entry.
;
; CALLING SEQUENCE:
;     list_aij_data=atomneb_search_aij(Atom_Aij_file, atom, ion)
; 
; INPUTS:
;     Atom_Omij_file: in, required, type=string, the FITS data file name ('AtomOmij.fits')
;     Atom          : in, required, type=string, atom name e.g. 'o'
;     Ion           : in, required, type=string, ionic level e.g 'iii'
; 
; OUTPUTS:  This function returns an array of data as the Omij_Data.
; 
; PROCEDURE: This function calls atomneb_read_omij_list and 
;            fits_read from IDL Astronomy User's library (../externals/astron/pro).
; 
; EXAMPLE:
;     base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     data_dir = ['atomic-data', 'collection']
;     Atom_Omij_file = filepath('AtomOmij.fits', root_dir=base_dir, subdir=data_dir )
;     atom='o'
;     ion='iii'
;     list_oiii_omij_data=atomneb_search_omij(Atom_Omij_file, atom, ion)
;     print,list_oiii_omij_data
;     > o_iii_omij_AK99 o_iii_omij_LB94 o_iii_omij_Pal12-AK99 o_iii_omij_SSB14
;
; MODIFICATION HISTORY:
;     24/12/2015, IDL code by A. Danehkar
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
