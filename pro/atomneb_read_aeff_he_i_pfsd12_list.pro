; docformat = 'rst'

function atomneb_read_aeff_he_i_pfsd12_list, Atom_RC_file
;+
;     This function returns the list of effective recombination coefficients (Aeff) from the 1st binary table extension
;     of the FITS data file ('rc_he_ii_PFSD12.fits')
;
; :Private:
;
; :Returns:
;    type=an array of data. This function returns the aeff_data_list: 
;           { Aeff_Data:'',
;             Extention:0.0}
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_he_ii_PFSD12.fits')
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
;     atomneb_read_aeff_he_i_pfsd12_list
;
; PURPOSE:
;     This function returns the list of effective recombination coefficients (Aeff) from the 1st binary table extension
;     of the FITS data file ('rc_he_ii_PFSD12.fits')
;
; CALLING SEQUENCE:
;     aeff_data=atomneb_read_aeff_he_i_pfsd12_list(Atom_RC_file)
;
; INPUTS:
;     Atom_RC_file  : in, required, type=string, the FITS data file name ('rc_he_ii_PFSD12.fits')
;
; OUTPUTS:  This function returns an array data of the aeff_data_list: 
;           { Aeff_Data:'',
;             Extention:0.0}
;
; PROCEDURE: This function is called by atomneb_read_aeff_he_i_pfsd12. This function calls 
;            ftab_ext from IDL Astronomy User's library (../externals/astron/pro).
;
; MODIFICATION HISTORY:
;     15/01/2017, IDL code by A. Danehkar
;-
  element_template={Aeff_Data:'', Extention:0}
  
  ftab_ext,Atom_RC_file,[1,2],Aeff_Data,Extention,EXTEN_NO =1
  temp=size(Aeff_Data,/DIMENSIONS)
  element_length=temp[0]
  
  element_data=replicate(element_template, element_length)
  for i=0, element_length-1 do begin 
     element_data[i].Aeff_Data=strtrim(Aeff_Data[i])
     element_data[i].Extention=Extention[i]
  endfor
  return, element_data
end

