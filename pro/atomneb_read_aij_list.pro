; docformat = 'rst'

function atomneb_read_aij_list, Atom_Aij_file
;+
;     This function returns the list of transition probabilities (Aij) from the 1st binary table extension
;     of the FITS data file ('AtomAij.fits').
;
; :Private:
;
; :Returns:
;    type=an array of data. This function returns the aij_data_list: 
;          { Aij_Data:'', 
;            Extention:0.0}
;
; :Params:
;     Atom_Aij_file  : in, required, type=string
;                     the FITS data file name ('AtomAij.fits')
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
;     atomneb_read_aij_list
;
; PURPOSE:
;     This function returns the list of transition probabilities (Aij) from the 1st binary table extension
;     of the FITS data file ('AtomAij.fits').
;
; CALLING SEQUENCE:
;     aij_data_list=atomneb_read_aij_list(Atom_Aij_file)
;
; INPUTS:
;     Atom_Aij_file  : in, required, type=string, the FITS data file name ('AtomAij.fits')
;
; OUTPUTS:  This function returns an array data of the aij_data_list: 
;          { Aij_Data:'', 
;            Extention:0.0}
;
; PROCEDURE: This function is called by atomneb_read_aij. This function calls 
;            ftab_ext from IDL Astronomy User's library (../externals/astron/pro).
;
; MODIFICATION HISTORY:
;     24/12/2015, IDL code by A. Danehkar
;-
  element_template={Aij_Data:'', Extention:0}
  
  ftab_ext,Atom_Aij_file,[1,2],Aij_Data,Extention,EXTEN_NO =1
  temp=size(Aij_Data,/DIMENSIONS)
  element_length=temp[0]
  
  element_data=replicate(element_template, element_length)
  for i=0, element_length-1 do begin 
     element_data[i].Aij_Data=strtrim(Aij_Data[i])
     element_data[i].Extention=Extention[i]
  endfor
  return, element_data
end

