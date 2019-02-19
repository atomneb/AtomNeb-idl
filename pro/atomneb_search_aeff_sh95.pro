; docformat = 'rst'

function atomneb_search_aeff_sh95, Atom_RC_file, atom, ion
;+
;     This function searches effective recombination coefficients (Aeff) for given element
;     and ionic levels in the FITS data file ('rec_SH95.fits'), and returns the data entry.
;
; :Returns:
;    type=array of data. This function returns the Aeff_Data.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_SH95.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'h'
;     ion           : in, required, type=string
;                     ionic level e.g 'ii'
;
; :Examples:
;    For example::
;
;     IDL> base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     IDL> data_rc_dir = ['atomic-data-rc']
;     IDL> Atom_RC_file= filepath('rc_SH95.fits', root_dir=base_dir, subdir=data_rc_dir )
;     IDL> atom='h'
;     IDL> ion='ii' ; H I
;     IDL> list_hi_aeff_data=atomneb_search_aeff_sh95(Atom_RC_file, atom, ion)
;     IDL> print,list_hi_aeff_data
;        h_ii_aeff_a h_ii_aeff_b
;
; :Categories:
;   Recombination Lines
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
;     atomneb_search_aeff_ppb91
;     
; PURPOSE:
;     This function searches effective recombination coefficients (Aeff) for given element
;     and ionic levels in the FITS data file ('rec_SH95.fits'), and returns the data entry.
;
; CALLING SEQUENCE:
;     list_aeff_data=atomneb_search_aeff_sh95(Atom_RC_file, atom, ion)
; 
; INPUTS:
;     Atom_RC_file  : in, required, type=string, the FITS data file name ('rc_SH95.fits')
;     Atom          : in, required, type=string, atom name e.g. 'h'
;     Ion           : in, required, type=string, ionic level e.g 'ii'
; 
; OUTPUTS:  This function returns an array of data as the Aeff_Data.
; 
; PROCEDURE: This function calls atomneb_read_aeff_sh95_list and 
;            fits_read from IDL Astronomy User's library (../externals/astron/pro).
; 
; EXAMPLE:
;     base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     data_rc_dir = ['atomic-data-rc']
;     Atom_RC_file= filepath('rc_SH95.fits', root_dir=base_dir, subdir=data_rc_dir )
;     atom='h'
;     ion='ii' ; H I
;     list_hi_aeff_data=atomneb_search_aeff_sh95(Atom_RC_file, atom, ion)
;     print,list_hi_aeff_data
;     > h_ii_aeff_a h_ii_aeff_b
;
; MODIFICATION HISTORY:
;     15/01/2017, IDL code by A. Danehkar
;-  
  element_data_list=atomneb_read_aeff_sh95_list(Atom_RC_file)
  atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_aeff*'
  ii=where(strmatch(element_data_list.Aeff_Data, atom_ion_name));
  temp=size(ii,/DIMENSIONS)
  ii_length=temp[0]
  if ii_length eq 1 then begin
    if ii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
  endif
  Select_Aeff_Data=element_data_list[ii].Aeff_Data
  
  return, Select_Aeff_Data
end
