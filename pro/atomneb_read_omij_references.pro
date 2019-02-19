; docformat = 'rst'

function atomneb_read_omij_references, Atom_Omij_file
;+
;     This function returns the reference list of collision strengths (omega_ij) from the 2nd binary table extension
;     of the FITS data file ('AtomOmij.fits').
;
; :Private:
;
; :Returns:
;    type=an array of data. This function returns the aij_data_reference: 
;          { Reference:'',
;            Citation:''}
;
; :Params:
;     Atom_Omij_file  : in, required, type=string
;                       the FITS data file name ('AtomOmij.fits')
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
;     atomneb_read_omij_references
;
; PURPOSE:
;     This function returns the reference list of energy levels (Ej) from the 2nd binary table extension
;     of the FITS data file ('AtomElj.fits').
;
; CALLING SEQUENCE:
;     omij_data_reference=atomneb_read_omij_references(Atom_Omij_file)
;
; INPUTS:
;     Atom_Omij_file  : in, required, type=string, the FITS data file name ('AtomOmij.fits')
;
; OUTPUTS:  This function returns an array data of the aij_data_reference
;          { Reference:'',
;            Citation:''}
;
; PROCEDURE: This function is called by atomneb_get_omij_reference_citation. 
;            This function calls ftab_ext from IDL Astronomy User's library (../externals/astron/pro).
;
; MODIFICATION HISTORY:
;     24/12/2015, IDL code by A. Danehkar
;-

  reference_template={Reference:'', Citation: ''}
  
  ftab_ext,Atom_Omij_file,[1,2],Reference,Citation,EXTEN_NO =2
  temp=size(Reference,/DIMENSIONS)
  reference_length=temp[0]
  
  reference_data=replicate(reference_template, reference_length)
  for i=0, reference_length-1 do begin 
     reference_data[i].Reference=strtrim(Reference[i])
     reference_data[i].Citation=strtrim(Citation[i])
  endfor
  return, reference_data
end

