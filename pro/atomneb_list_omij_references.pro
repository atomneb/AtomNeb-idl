; docformat = 'rst'

function atomneb_list_omij_references, Atom_Omij_file, atom, ion
;+
;     This function returns a list for all references of collision strengths (Omega_ij)
;     for given element and ionic level from the FITS data file ('AtomOmij.fits').
;
; :Returns:
;    type=an array of strings. This function returns the references.
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
;     IDL> list_oiii_omij_reference=atomneb_list_omij_references(Atom_Omij_file, atom, ion)
;     IDL> print,list_oiii_omij_reference
;        AK99 LB94 Pal12-AK99 SSB14
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
;     15/01/2017, IDL code by A. Danehkar
;-

;+
; NAME:
;     atomneb_list_omij_references
;
; PURPOSE:
;     This function returns a list for all references of collision strengths (Omega_ij)
;     for given element and ionic level from the FITS data file ('AtomOmij.fits').
;
; CALLING SEQUENCE:
;     reference_list=atomneb_list_aij_references(Atom_RC_file, atom, ion)
;
; INPUTS:
;     Atom_Elj_file : in, required, type=string, the FITS data file name ('AtomOmij.fits')
;     Atom          : in, required, type=string, atom name e.g. 'o'
;     Ion           : in, required, type=string, ionic level e.g 'iii'
;
; OUTPUTS:  This function returns an array of strings as the references.
;
; PROCEDURE: This function calls ftab_ext from IDL Astronomy User's library (../externals/astron/pro).
;
; EXAMPLE:
;     base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     data_dir = ['atomic-data', 'collection']
;     Atom_Omij_file = filepath('AtomOmij.fits', root_dir=base_dir, subdir=data_dir )
;     atom='o'
;     ion='iii'
;     list_oiii_omij_reference=atomneb_list_omij_references(Atom_Omij_file, atom, ion)
;     print,list_oiii_omij_reference
;     > AK99 LB94 Pal12-AK99 SSB14
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
  ;temp=size(Select_Omij_Data,/DIMENSIONS)
  NLINES1=ii_length;temp[0]
  References = STRARR(NLINES1)
  for i=0, NLINES1-1 do begin 
    Select_Omij_Data_str1=strsplit(Select_Omij_Data[i],'_', /EXTRACT)
    References[i] = Select_Omij_Data_str1[3]
  endfor
  return, References
end
