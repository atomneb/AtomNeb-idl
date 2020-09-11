; docformat = 'rst'

function atomneb_read_aij_references, Atom_Aij_file
;+
;     This function returns the reference list of transition probabilities (Aij) from the 1nd binary table extension
;     of the FITS data file ('AtomAij.fits').
;
; :Private:
;
; :Returns:
;    type=an array of data. This function returns the aij_data_reference: 
;          { Reference:'',
;            Citation:''}
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
  reference_template={Reference:'', Citation: ''}
  
  ftab_ext,Atom_Aij_file,[1,2],Reference,Citation,EXTEN_NO =2
  temp=size(Reference,/DIMENSIONS)
  reference_length=temp[0]
  
  reference_data=replicate(reference_template, reference_length)
  for i=0, reference_length-1 do begin 
     reference_data[i].Reference=strtrim(Reference[i])
     reference_data[i].Citation=strtrim(Citation[i])
  endfor
  return, reference_data
end
