; docformat = 'rst'

function atomneb_read_aeff_o_ii_ssb17, Atom_RC_file, atom, ion, case1, wavelength_range, wavelength=wavelength, reference=reference
;+
;     This function returns the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file ('rc_o_iii_SSB17.fits').
;
; :Returns:
;    type=an array of data. This function returns the effective recombination coefficients.
;
; :Params:
;     Atom_RC_file     : in, required, type=string
;                        the FITS data file name ('rc_o_iii_SSB17.fits')
;     atom             : in, required, type=string
;                        atom name e.g. 'o'
;     ion              : in, required, type=string
;                        ionic level e.g 'iii'
;     case1            : in, type=string
;                        set for the case 'a' or 'b', defualt 'b'
;     wavelength_range : in, required, type=array
;                        wavelength range e.g. [5320.0, 5330.0]    
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
;     IDL> Atom_RC_file= filepath('rc_o_iii_SSB17.fits', root_dir=base_dir, subdir=data_dir )
;     IDL> atom='o'
;     IDL> ion='iii' ; O II
;     IDL> case1='B'
;     IDL> wavelength_range=[5320.0, 5330.0] 
;     IDL> oii_rc_data=atomneb_read_aeff_o_ii_ssb17(Atom_RC_file, atom, ion, case1, wavelength_range)
;     IDL> oii_rc_data_wave=atomneb_read_aeff_o_ii_ssb17(Atom_RC_file, atom, ion, case1, wavelength_range, /wavelength)
;     IDL> print,oii_rc_data[0].Aeff
;        1.64100e-30  1.60000e-30  1.56400e-30  1.54100e-30 ...
;     IDL> temp=size(oii_rc_data_wave.Wavelength,/DIMENSIONS)
;     IDL> n_line=temp[0]
;     IDL> for i=0,n_line-1 do print,oii_rc_data_wave[i].Wavelength, oii_rc_data_wave[i].lower_term, oii_rc_data_wave[i].upper_term
;        5327.172s22p2(1S)3p 2Po
;        5325.422s22p2(1S)3p 2Po
;        5327.182s22p2(1D)3d 2Ge
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
;   0.2.0
;
; :History:
;     03/07/2017, IDL code by A. Danehkar
;-
  element_data_list=atomneb_read_aeff_o_ii_ssb17_list(Atom_RC_file)
  wave_min=min(wavelength_range)
  wave_max=max(wavelength_range)
  wave_loc1=where (element_data_list.wavelength ge wave_min and element_data_list.wavelength le wave_max and element_data_list.case1 eq case1)
  temp=size(wave_loc1,/DIMENSIONS) 
  if temp[0] lt 0 then return, 0
  wave_size=temp[0]
  rc_element_template={Wavelength: float(0.0), Aeff:fltarr(16,25)}
  rc_data=replicate(rc_element_template, wave_size)
   
  Extension1=element_data_list[wave_loc1].Extension
  Wavelength1=element_data_list[wave_loc1].wavelength
  
  if keyword_set(wavelength) eq 1 then begin
       rc_wave_template={Wavelength: float(0.0), lower_term:'',  upper_term: ''}
       rc_wave=replicate(rc_wave_template, wave_size)
       rc_wave.Wavelength=element_data_list[wave_loc1].wavelength
       rc_wave.lower_term=element_data_list[wave_loc1].lower_term
       rc_wave.upper_term=element_data_list[wave_loc1].upper_term
       return, rc_wave
  endif
  for i=0, wave_size-1 do begin 
    fits_read,Atom_RC_file,rc_aeff,header1,EXTEN_NO =Extension1[i]
    rc_data[i].Wavelength=Wavelength1[i]
    rc_data[i].Aeff[*,*]=rc_aeff[*,*]
  endfor
  
  return, rc_data
end
