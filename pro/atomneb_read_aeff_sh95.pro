; docformat = 'rst'

function atomneb_read_aeff_sh95, Atom_RC_file, atom, ion, reference=reference, case1=case1
;+
;     This function returns the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file ('rc_SH95.fits').
;
; :Returns:
;    type=an array of data. This function returns the effective recombination coefficients.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_SH95.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'h'
;     ion           : in, required, type=string
;                     ionic level e.g 'ii' 
;
; :Keywords:
;     reference     : in, type=string
;                     set for the reference,  not necessary
;     case1         : in, type=string
;                     set for the case 'a' or 'b', defualt 'b'
;
; :Examples:
;    For example::
;
;     IDL> base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     IDL> data_rc_dir = ['atomic-data-rc']
;     IDL> Atom_RC_file= filepath('rc_SH95.fits', root_dir=base_dir, subdir=data_dir )
;     IDL> atom='h'
;     IDL> ion='ii' ; H I
;     IDL> hi_rc_data=atomneb_read_aeff_sh95(Atom_RC_file, atom, ion)
;     IDL> print,hi_rc_data[0].Aeff
;        100.00000       500.00000       0.0000000   4.2140000e-27    1.7560000e-27  ...
;        ...
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
;     atomneb_read_rc_sh95
;
; PURPOSE:
;     This function returns the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file ('rc_SH95.fits').
;
; CALLING SEQUENCE:
;     aeff_data=atomneb_read_rc_sh95(Atom_RC_file, atom, ion, reference=reference, case1=case1)
;
; INPUTS:
;     Atom_RC_file  : in, required, type=string, the FITS data file name ('rc_SH95.fits')
;     Atom          : in, required, type=string, atom name e.g. 'h'
;     Ion           : in, required, type=string, ionic level e.g 'ii'
;
; KEYWORD PARAMETERS:
;     REFERENCE     : in, type=string, set for the reference, not necessary
;     case1         : in, type=string, set for the case 'a' or 'b', defualt 'b'
;
; OUTPUTS:  This function returns an array data of the effective recombination coefficients.
;
; PROCEDURE: This function calls atomneb_read_aeff_sh95_list and
;            ftab_ext from IDL Astronomy User's library (../externals/astron/pro).
;
; EXAMPLE:
;     base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     data_rc_dir = ['atomic-data-rc']
;     Atom_RC_file= filepath('rc_SH95.fits', root_dir=base_dir, subdir=data_dir )
;     atom='h'
;     ion='ii' ; H I
;     hi_rc_data=atomneb_read_aeff_sh95(Atom_RC_file, atom, ion)
;     print,hi_rc_data[0].Aeff
;     > 100.00000       500.00000       0.0000000   4.2140000e-27    1.7560000e-27  ...
;     > ...
;
; MODIFICATION HISTORY:
;     15/01/2017, IDL code by A. Danehkar
;-   
  element_data_list=atomneb_read_aeff_sh95_list(Atom_RC_file)
  if keyword_set(reference) eq 1 then begin
    atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_aeff'
    if keyword_set(case1) eq 1 then begin
      atom_ion_name=atom_ion_name+'_'+case1
    endif else begin
      atom_ion_name=atom_ion_name+'_b'
    endelse
    atom_ion_name=atom_ion_name+'_'+strupcase(reference)
    ii=where(element_data_list.Aeff_Data eq atom_ion_name);
    if ii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
  endif else begin
    atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_aeff'
    if keyword_set(case1) eq 1 then begin
      atom_ion_name=atom_ion_name+'_'+case1
    endif else begin
      atom_ion_name=atom_ion_name+'_b'
    endelse
    atom_ion_name=atom_ion_name+'*'
    iii=where(strmatch(element_data_list.Aeff_Data, atom_ion_name, /FOLD_CASE) eq 1)
    if iii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
    ii=min(iii)
  endelse

  Extention=element_data_list[ii].Extention
 
  fits_read,Atom_RC_file,rc_aeff,header1,EXTEN_NO =Extention 
  temp=size(rc_aeff,/DIMENSIONS)
  col1=temp[0]
  row1=temp[1]
  aeff_template={Aeff:dblarr(col1,row1)}
  rc_data=replicate(aeff_template, 1)
  rc_data.Aeff[*,*]=rc_aeff[*,*]
  
  ;endfor
  return, rc_data
end
