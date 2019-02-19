; docformat = 'rst'

function atomneb_read_aeff_n_ii_fsl13, Atom_RC_file, atom, ion, wavelength_range, wavelength=wavelength, reference=reference
;+
;     This function returns the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file ('rc_n_iii_FSL13.fits').
;
; :Returns:
;    type=an array of data. This function returns the effective recombination coefficients.
;
; :Params:
;     Atom_RC_file     : in, required, type=string
;                        the FITS data file name ('rc_n_iii_FSL13.fits')
;     atom             : in, required, type=string
;                        atom name e.g. 'n'
;     ion              : in, required, type=string
;                        ionic level e.g 'iii'
;     wavelength_range : in, required, type=array
;                        wavelength range e.g. [4400.0, 7100.0]    
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
;     IDL> Atom_RC_file= filepath('rc_n_iii_FSL13.fits', root_dir=base_dir, subdir=data_dir )
;     IDL> atom='n'
;     IDL> ion='iii' ; N II
;     IDL> wavelength_range=[4400.0, 7100.0] 
;     IDL> nii_rc_data=atomneb_read_aeff_n_ii_fsl13(Atom_RC_file, atom, ion, wavelength_range)
;     IDL> nii_rc_data_wave=atomneb_read_aeff_n_ii_fsl13(Atom_RC_file, atom, ion, wavelength_range, /wavelength)
;     IDL> print,nii_rc_data[0].Aeff
;        255.000      79.5000      47.3000      12.5000      ...
;     IDL> temp=size(nii_rc_data_wave.Wavelength,/DIMENSIONS)
;     IDL> n_line=temp[0]
;     IDL> for i=0,n_line-1 do print,nii_rc_data_wave[i].Wavelength, nii_rc_data_wave[i].Tr, nii_rc_data_wave[i].Trans
;        6413.236g - 4f2p6g G[9/2]o4 - 2p4f F[7/2]e3
;        6556.326g - 4f2p6g G[9/2]o5 - 2p4f G[7/2]e4
;        6456.976g - 4f2p6g G[9/2]o5 - 2p4f F[7/2]e4
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
;     03/07/2017, IDL code by A. Danehkar
;-

;+
; NAME:
;     atomneb_read_aeff_n_ii_fsl13
;
; PURPOSE:
;     This function returns the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file ('rc_n_iii_FSL13.fits').
;
; CALLING SEQUENCE:
;     aeff_data=atomneb_read_aeff_n_ii_fsl13(Atom_RC_file, atom, ion, wavelength_range, wavelength=wavelength, reference=reference)
;
; INPUTS:
;     Atom_RC_file     : in, required, type=string, the FITS data file name ('rc_n_iii_FSL13.fits')
;     Atom             : in, required, type=string, atom name e.g. 'n'
;     Ion              : in, required, type=string, ionic level e.g 'iii'
;     Wavelength_range : in, required, type=array, wavelength range e.g. [4400.0, 7100.0]
;
; KEYWORD PARAMETERS:
;     WAVELENGTH    : in, type=boolean, set for returning the wavelengths
;     REFERENCE     : in, type=string, set for the reference, not necessary
;
; OUTPUTS:  This function returns an array data of the effective recombination coefficients.
;
; PROCEDURE: This function calls atomneb_read_aeff_n_ii_fsl13_list and
;            ftab_ext from IDL Astronomy User's library (../externals/astron/pro).
;
; EXAMPLE:
;     base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     data_rc_dir = ['atomic-data-rc']
;     Atom_RC_file= filepath('rc_n_iii_FSL13.fits', root_dir=base_dir, subdir=data_dir )
;     atom='n'
;     ion='iii' ; N II
;     wavelength_range=[4400.0, 7100.0] 
;     nii_rc_data=atomneb_read_aeff_n_ii_fsl13(Atom_RC_file, atom, ion, wavelength_range)
;     nii_rc_data_wave=atomneb_read_aeff_n_ii_fsl13(Atom_RC_file, atom, ion, wavelength_range, /wavelength)
;     print,nii_rc_data[0].Aeff
;     > 255.000      79.5000      47.3000      12.5000      ...
;     temp=size(nii_rc_data_wave.Wavelength,/DIMENSIONS)
;     n_line=temp[0]
;     for i=0,n_line-1 do print,nii_rc_data_wave[i].Wavelength, nii_rc_data_wave[i].Tr, nii_rc_data_wave[i].Trans
;     > 6413.236g - 4f2p6g G[9/2]o4 - 2p4f F[7/2]e3
;     > 6556.326g - 4f2p6g G[9/2]o5 - 2p4f G[7/2]e4
;     > 6456.976g - 4f2p6g G[9/2]o5 - 2p4f F[7/2]e4
;     > ...
;
; MODIFICATION HISTORY:
;     03/07/2017, IDL code by A. Danehkar
;-
  element_data_list=atomneb_read_aeff_n_ii_fsl13_list(Atom_RC_file)
  wave_min=min(wavelength_range)
  wave_max=max(wavelength_range)
  wave_loc1=where (element_data_list.wavelength ge wave_min and element_data_list.wavelength le wave_max)
  temp=size(wave_loc1,/DIMENSIONS) 
  if temp[0] lt 0 then return, 0
  wave_size=temp[0]
  rc_element_template={Wavelength: float(0.0), Aeff:fltarr(7,4)}
  rc_data=replicate(rc_element_template, wave_size)
   
  Extention1=element_data_list[wave_loc1].Extention
  Wavelength1=element_data_list[wave_loc1].wavelength
  
  if keyword_set(wavelength) eq 1 then begin
       rc_wave_template={Wavelength: float(0.0), Tr:'',  Trans: '', T_X: ''}
       rc_wave=replicate(rc_wave_template, wave_size)
       rc_wave.Wavelength=element_data_list[wave_loc1].wavelength
       rc_wave.Tr=element_data_list[wave_loc1].Tr
       rc_wave.Trans=element_data_list[wave_loc1].Trans
       rc_wave.T_X=element_data_list[wave_loc1].T_X
       return, rc_wave
  endif
  for i=0, wave_size-1 do begin 
    fits_read,Atom_RC_file,rc_aeff,header1,EXTEN_NO =Extention1[i]
    ;temp=size(rc_aeff,/DIMENSIONS)
    ;col1=temp[0]
    ;row1=temp[1]
    ;aeff_template={Aeff:dblarr(col1,row1)}
    ;rc_data=replicate(aeff_template, 1)
    rc_data[i].Wavelength=Wavelength1[i]
    rc_data[i].Aeff[*,*]=rc_aeff[*,*]
  endfor
  
  return, rc_data
end
