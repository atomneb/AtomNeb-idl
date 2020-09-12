; docformat = 'rst'

function atomneb_read_aeff_sh95_list, Atom_RC_file
;+
;     This function returns the list of effective recombination coefficients (Aeff) from the 1st binary table extension
;     of the FITS data file ('rc_SH95.fits')
;
; :Private:
;
; :Returns:
;    type=an array of data. This function returns the aeff_data_list: 
;          { Aeff_Data:'', 
;            Extension:0.0}
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_SH95.fits')
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
;     15/01/2017, IDL code by A. Danehkar
;-
  element_template={Aeff_Data:'', Extension:0}
  
  ftab_ext,Atom_RC_file,[1,2],Aeff_Data,Extension,EXTEN_NO =1
  temp=size(Aeff_Data,/DIMENSIONS)
  element_length=temp[0]
  
  element_data=replicate(element_template, element_length)
  for i=0, element_length-1 do begin 
     element_data[i].Aeff_Data=strtrim(Aeff_Data[i])
     element_data[i].Extension=Extension[i]
  endfor
  return, element_data
end

