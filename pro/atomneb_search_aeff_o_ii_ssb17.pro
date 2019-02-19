; docformat = 'rst'

function atomneb_search_aeff_o_ii_ssb17, Atom_RC_file, atom, ion, case1, wavelength
;+
;     This function searches effective recombination coefficients (Aeff) for given element
;     and ionic levels in the FITS data file ('rc_o_iii_SSB17.fits'), and returns the data entry.
;
; :Returns:
;    type=array of data. This function returns the Aeff_Data.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_o_iii_SSB17.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'o'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;     case1            : in, type=string
;                        set for the case 'a' or 'b', defualt 'b'
;     wavelength    : in, type=float
;                     set the wavelengths
;
; :Examples:
;    For example::
;
;     IDL> base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     IDL> data_rc_dir = ['atomic-data-rc']
;     IDL> Atom_RC_file= filepath('rc_o_iii_SSB17.fits', root_dir=base_dir, subdir=data_rc_dir )
;     IDL> atom='o'
;     IDL> ion='iii' ; O II
;     IDL> case1='B'
;     IDL> wavelength=5325.42
;     IDL> list_oii_aeff_data=atomneb_search_aeff_o_ii_ssb17(Atom_RC_file, atom, ion, case1, wavelength)
;     IDL> print,list_oii_aeff_data.Wavelength
;        5325.42
;     IDL> print,list_oii_aeff_data.Aeff
;        3.41800e-32  3.33300e-32  3.25700e-32  3.20900e-32  3.16800e-32 ...
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
;     atomneb_search_aeff_o_ii_ssb17
;     
; PURPOSE:
;     This function searches effective recombination coefficients (Aeff) for given element
;     and ionic levels in the FITS data file ('rc_o_iii_SSB17.fits'), and returns the data entry.
;
; CALLING SEQUENCE:
;     list_aeff_data=atomneb_search_aeff_o_ii_ssb17(Atom_RC_file, atom, ion, case1, wavelength)
; 
; INPUTS:
;     Atom_RC_file  : in, required, type=string, the FITS data file name ('rc_o_iii_SSB17.fits')
;     Atom          : in, required, type=string, atom name e.g. 'o'
;     Ion           : in, required, type=string, ionic level e.g 'iii'
;     case1            : in, type=string, set for the case 'a' or 'b', defualt 'b'
;     Wavelength    : in, type=float, set the wavelengths
; 
; OUTPUTS:  This function returns an array of data as the Aeff_Data.
; 
; PROCEDURE: This function calls atomneb_read_aeff_o_ii_ssb17_list and 
;            fits_read from IDL Astronomy User's library (../externals/astron/pro).
; 
; EXAMPLE:
;     base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     data_rc_dir = ['atomic-data-rc']
;     Atom_RC_file= filepath('rc_o_iii_SSB17.fits', root_dir=base_dir, subdir=data_rc_dir )
;     atom='o'
;     ion='iii' ; O II
;     case1='B'
;     wavelength=5325.42
;     list_oii_aeff_data=atomneb_search_aeff_o_ii_ssb17(Atom_RC_file, atom, ion, case1, wavelength)
;     print,list_oii_aeff_data.Wavelength
;     > 5325.42
;     print,list_oii_aeff_data.Aeff
;     > 3.41800e-32  3.33300e-32  3.25700e-32  3.20900e-32  3.16800e-32 ...
;
; MODIFICATION HISTORY:
;     03/07/2017, IDL code by A. Danehkar
;-  
  element_data_list=atomneb_read_aeff_o_ii_ssb17_list(Atom_RC_file)
  
  ii=where(abs(element_data_list.wavelength-wavelength) le 0.02 and element_data_list.case1 eq case1) 
  temp=size(ii,/DIMENSIONS)
  ii_length=temp[0]
  if ii_length eq 1 then begin
    if ii eq -1 then begin
      print, 'could not find the given wavelength'
      exit
    endif
  endif else begin
     if ii_length gt 1 then begin
       ii_min=min(abs(element_data_list[ii].wavelength-wavelength))
       ii=where(abs(element_data_list.wavelength-wavelength) eq ii_min and element_data_list.case1 eq case1) 
       temp=size(ii,/DIMENSIONS)
       ii_length=temp[0]
     endif
  endelse
  Extention1=element_data_list[ii].Extention
  Wavelength1=element_data_list[ii].wavelength
  
  rc_element_template={Wavelength: float(0.0), Aeff:fltarr(16,25)}
  Select_Aeff_Data=replicate(rc_element_template, ii_length)
  for i=0, ii_length-1 do begin 
    fits_read,Atom_RC_file,rc_aeff,header1,EXTEN_NO =Extention1[ii]
    Select_Aeff_Data[i].Wavelength=Wavelength1[ii]
    Select_Aeff_Data[i].Aeff[*,*]=rc_aeff[*,*]
  endfor
  return, Select_Aeff_Data
end
