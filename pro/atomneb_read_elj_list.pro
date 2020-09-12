; docformat = 'rst'

function atomneb_read_elj_list, Atom_Elj_file
;+
;     This function returns the list of energy levels (Ej) from the 1st binary table extension
;     of the FITS data file ('AtomElj.fits')
;
; :Private:
;
; :Returns:
;    type=an array of data. This function returns the elj_data_list: 
;          { Elj_Data:'', 
;            Extension:0.0}
;
; :Params:
;     Atom_Elj_file  : in, required, type=string
;                     the FITS data file name ('AtomElj.fits')
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
  element_template={Elj_Data:'', Extension:0}
  
  ftab_ext,Atom_Elj_file,[1,2],Elj_Data,Extension,EXTEN_NO =1
  temp=size(Elj_Data,/DIMENSIONS)
  element_length=temp[0]
  
  element_data=replicate(element_template, element_length)
  for i=0, element_length-1 do begin 
     element_data[i].Elj_Data=strtrim(Elj_Data[i])
     element_data[i].Extension=Extension[i]
  endfor
  return, element_data
end

