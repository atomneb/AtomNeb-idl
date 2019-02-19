; docformat = 'rst'

function atomneb_read_aeff_he_i_pfsd12, Atom_RC_file, atom, ion, wavelength=wavelength, reference=reference
;+
;     This function returns the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file ('rc_he_ii_PFSD12.fits').
;
; :Returns:
;    type=an array of data. This function returns the effective recombination coefficients.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_he_ii_PFSD12.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'he'
;     ion           : in, required, type=string
;                     ionic level e.g 'ii'
;
; :Keywords:
;     wavelength    : in, type=boolean
;                     set for returning the wavelengths
;     reference     : in, type=string
;                     set for the reference, not necessary
;
; :Examples:
;    For example::
;
;     IDL> base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     IDL> data_rc_dir = ['atomic-data-rc']
;     IDL> Atom_RC_file= filepath('rc_he_ii_PFSD12.fits', root_dir=base_dir, subdir=data_dir )
;     IDL> atom='he'
;     IDL> ion='ii' ; He I
;     IDL> hei_rc_data=atomneb_read_aeff_he_i_pfsd12(Atom_RC_file, atom, ion)
;     IDL> hei_rc_data_wave=atomneb_read_aeff_he_i_pfsd12(Atom_RC_file, atom, ion, /wavelength)
;     IDL> print,hei_rc_data[0].Aeff
;        5000.0000       10.000000      -25.379540      -25.058970      -25.948440      ...
;     IDL> temp=size(hei_rc_data_wave.Wavelength,/DIMENSIONS)
;     IDL> n_line=temp[0]
;     IDL> for i=0,n_line-1 do print,hei_rc_data_wave[i].Wavelength, hei_rc_data_wave[i].LowerTerm, hei_rc_data_wave[i].UpperTerm
;        2945.00005p^{3}P2s^{3}S
;        3188.00004p^{3}P2s^{3}S
;        3614.00005p^{1}P2s^{1}S
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
;     atomneb_read_aeff_he_i_pfsd12
;
; PURPOSE:
;     This function returns the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file ('rc_he_ii_PFSD12.fits').
;
; CALLING SEQUENCE:
;     aeff_data=atomneb_read_aeff_he_i_pfsd12(Atom_RC_file, atom, ion, wavelength=wavelength, reference=reference)
;
; INPUTS:
;     Atom_RC_file  : in, required, type=string, the FITS data file name ('rc_he_ii_PFSD12.fits')
;     Atom          : in, required, type=string, atom name e.g. 'he'
;     Ion           : in, required, type=string, ionic level e.g 'ii'
;
; KEYWORD PARAMETERS:
;     WAVELENGTH    : in, type=boolean, set for returning the wavelengths
;     REFERENCE     : in, type=string, set for the reference, not necessary
;
; OUTPUTS:  This function returns an array data of the effective recombination coefficients.
;
; PROCEDURE: This function calls atomneb_read_aeff_he_i_pfsd12_list and
;            ftab_ext from IDL Astronomy User's library (../externals/astron/pro).
;
; EXAMPLE:
;     base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     data_rc_dir = ['atomic-data-rc']
;     Atom_RC_file= filepath('rc_he_ii_PFSD12.fits', root_dir=base_dir, subdir=data_dir )
;     atom='he'
;     ion='ii' ; He I
;     hei_rc_data=atomneb_read_aeff_he_i_pfsd12(Atom_RC_file, atom, ion)
;     hei_rc_data_wave=atomneb_read_aeff_he_i_pfsd12(Atom_RC_file, atom, ion, /wavelength)
;     print,hei_rc_data[0].Aeff
;     > 5000.0000       10.000000      -25.379540      -25.058970      -25.948440      ...
;     temp=size(hei_rc_data_wave.Wavelength,/DIMENSIONS)
;     n_line=temp[0]
;     for i=0,n_line-1 do print,hei_rc_data_wave[i].Wavelength, hei_rc_data_wave[i].LowerTerm, hei_rc_data_wave[i].UpperTerm
;     > 2945.00005p^{3}P2s^{3}S
;     > 3188.00004p^{3}P2s^{3}S
;     > 3614.00005p^{1}P2s^{1}S
;     > ...
;
; MODIFICATION HISTORY:
;     15/01/2017, IDL code by A. Danehkar
;-
  element_data_list=atomneb_read_aeff_he_i_pfsd12_list(Atom_RC_file)
  if keyword_set(wavelength) eq 1 then prefix='_wavelength' else prefix='_aeff
  if keyword_set(reference) eq 1 then begin
    atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+prefix+'_'+strupcase(reference)
    ii=where(element_data_list.Aeff_Data eq atom_ion_name);
    if ii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
  endif else begin
    reference='PFSD13'
    if keyword_set(wavelength) eq 1 then begin
      atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+prefix
    endif else begin
      atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+prefix+'_'+strupcase(reference)
    endelse
    iii=where(strmatch(element_data_list.Aeff_Data, atom_ion_name, /FOLD_CASE) eq 1)
    if iii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
    ii=min(iii)
  endelse

  Extention=element_data_list[ii].Extention
 
  atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+prefix
  case atom_ion_name of
     'he_ii_aeff': begin
        fits_read,Atom_RC_file,rc_aeff,header1,EXTEN_NO =Extention 
        temp=size(rc_aeff,/DIMENSIONS)
        col1=temp[0]
        row1=temp[1]
        aeff_template={Aeff:dblarr(col1,row1)}
        rc_data=replicate(aeff_template, 1)
        rc_data.Aeff[*,*]=rc_aeff[*,*]
      end
    'he_ii_wavelength': begin
        ftab_ext,Atom_RC_file,[1,2,3],Wavelength,LowerTerm,UpperTerm,EXTEN_NO =Extention
        rc_template={Wavelength: double(0.0), LowerTerm:'', UpperTerm:''}
        
        temp=size(Wavelength,/DIMENSIONS)
        n_line=temp[0]
        
        rc_data=replicate(rc_template, n_line)
        
        rc_data[*].Wavelength=Wavelength[*]
        rc_data[*].LowerTerm=LowerTerm[*]
        rc_data[*].UpperTerm=UpperTerm[*]
      end
  endcase
  return, rc_data
end
