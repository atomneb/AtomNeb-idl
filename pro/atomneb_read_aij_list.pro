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
;            Extension:0}
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
;   0.2.0
;
; :History:
;     24/12/2015, IDL code by A. Danehkar
;-
  element_template={Aij_Data:'', Extension:0}
  
  ftab_ext,Atom_Aij_file,[1,2],Aij_Data,Extension,EXTEN_NO =1
  temp=size(Aij_Data,/DIMENSIONS)
  element_length=temp[0]
  
  element_data=replicate(element_template, element_length)
  for i=0, element_length-1 do begin 
     element_data[i].Aij_Data=strtrim(Aij_Data[i])
     element_data[i].Extension=Extension[i]
  endfor
  return, element_data
end

