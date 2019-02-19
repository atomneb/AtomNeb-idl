; docformat = 'rst'

function atomneb_list_aeff_n_ii_fsl13_references, Atom_RC_file, atom, ion
;+
;     This function returns a list for all references of recombination coefficients (Aeff)
;     for given element and ionic level from the FITS data file ('rc_n_iii_FSL13.fits').
;
; :Returns:
;    type=an array of strings. This function returns the references.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_n_iii_FSL13.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'n'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Examples:
;    For example::
;
;     IDL> base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     IDL> data_dir = ['atomic-data-rc']
;     IDL> Atom_RC_file= filepath('rc_n_iii_FSL13.fits', root_dir=base_dir, subdir=data_dir )
;     IDL> atom='n'
;     IDL> ion='iii' ; N II
;     IDL> list_nii_aeff_reference=atomneb_list_aeff_n_ii_fsl13_references(Atom_RC_file, atom, ion)
;     IDL> print,list_nii_aeff_reference
;        
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
;     03/07/2017, IDL code by A. Danehkar
;-

;+
; NAME:
;     atomneb_list_aeff_n_ii_fsl13_references
;
; PURPOSE:
;     This function returns a list for all references of recombination coefficients (Aeff)
;     for given element and ionic level from the FITS data file ('rc_n_iii_FSL13.fits').
;
; CALLING SEQUENCE:
;     reference_list=atomneb_list_aeff_collection_references(Atom_RC_file, atom, ion)
;
; INPUTS:
;     Atom_RC_file  : in, required, type=string, the FITS data file name ('rc_n_iii_FSL13.fits')
;     Atom          : in, required, type=string, atom name e.g. 'n'
;     Ion           : in, required, type=string, ionic level e.g 'iii'
;
; OUTPUTS:  This function returns an array of strings as the references.
;
; PROCEDURE: This function calls ftab_ext from IDL Astronomy User's library (../externals/astron/pro).
;
; EXAMPLE:
;     base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     data_dir = ['atomic-data-rc']
;     Atom_RC_file= filepath('rc_n_iii_FSL13.fits', root_dir=base_dir, subdir=data_dir )
;     atom='n'
;     ion='iii' ; N II
;     list_nii_aeff_reference=atomneb_list_aeff_n_ii_fsl13_references(Atom_RC_file, atom, ion)
;     print,list_nii_aeff_reference
;     > 
;
; MODIFICATION HISTORY:
;     03/07/2017, IDL code by A. Danehkar
;-
  rc_reference_template={AtomicData:'', Reference: ''}
  
  rc_reference_data=atomneb_read_aeff_n_ii_fsl13_references(Atom_RC_file)
  
  atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_aeff*'
  ii=where(strmatch(rc_reference_data.Reference, atom_ion_name));
  temp=size(ii,/DIMENSIONS)
  ii_length=temp[0]
  if ii_length eq 1 then begin
    if ii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
  endif
  Select_Reference=rc_reference_data[ii].Reference
  ;temp=size(Select_Omij_Data,/DIMENSIONS)
  References = STRARR(ii_length)
  for i=0, ii_length-1 do begin 
    Select_Aeff_Data_str1=strsplit(Select_Reference[i],'_', /EXTRACT)
    temp=size(Select_Aeff_Data_str1,/DIMENSIONS)
    ref_num=temp[0]
    if ref_num gt 3 then References[i] = Select_Aeff_Data_str1[3] else References[i] =''
  endfor
  return, References
end
