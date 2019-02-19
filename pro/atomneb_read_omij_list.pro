; docformat = 'rst'

function atomneb_read_omij_list, Atom_Omij_file
;+
;     This function returns the list of collision strengths (omega_ij) from the 1st binary table extension
;     of the FITS data file ('AtomOmij.fits').
;
; :Private:
;
; :Returns:
;    type=an array of data. This function returns the omij_data_list: 
;          { Omij_Data:'', 
;            Extention:0.0}
;
; :Params:
;     Atom_Omij_file  : in, required, type=string
;                     the FITS data file name ('AtomOmij.fits')
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
;     24/12/2015, IDL code by A. Danehkar
;-

;+
; NAME:
;     atomneb_read_omij_list
;
; PURPOSE:
;     This function returns the list of collision strengths (omega_ij) from the 1st binary table extension
;     of the FITS data file ('AtomOmij.fits').
;
; CALLING SEQUENCE:
;     omij_data_list=atomneb_read_omij_list(Atom_Omij_file)
;
; INPUTS:
;     Atom_Omij_file  : in, required, type=string, the FITS data file name ('AtomOmij.fits')
;
; OUTPUTS:  This function returns an array data of the omij_data_list: 
;          { Omij_Data:'', 
;            Extention:0.0}
;
; PROCEDURE: This function is called by atomneb_read_omij. This function calls 
;            ftab_ext from IDL Astronomy User's library (../externals/astron/pro).
;
; MODIFICATION HISTORY:
;     24/12/2015, IDL code by A. Danehkar
;-
  element_template={Omij_Data:'', Extention:0}
  
  ftab_ext,Atom_Omij_file,[1,2],Omij_Data,Extention,EXTEN_NO =1
  temp=size(Omij_Data,/DIMENSIONS)
  element_length=temp[0]
  
  element_data=replicate(element_template, element_length)
  for i=0, element_length-1 do begin 
     element_data[i].Omij_Data=strtrim(Omij_Data[i])
     element_data[i].Extention=Extention[i]
  endfor
  return, element_data
end

