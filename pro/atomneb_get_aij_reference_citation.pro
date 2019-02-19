; docformat = 'rst'

function atomneb_get_aij_reference_citation, Atom_Aij_file, atom, ion, reference
;+
;     This function returns the reference citation for a transition probability (Aij) 
;     from the 2nd binary table extension of the FITS data file ('AtoAij.fits')
;
; :Returns:
;    type=string. This function returns the Citation.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('AtoAij.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'o'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;     reference     : in, type=string
;                     set for the reference e.g. 'FFT04'
;
; :Examples:
;    For example::
;
;     IDL> base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     IDL> data_dir = ['atomic-data', 'collection']
;     IDL> Atom_Aij_file = filepath('AtomAij.fits', root_dir=base_dir, subdir=data_dir )
;     IDL> atom='o'
;     IDL> ion='iii'
;     IDL> reference='FFT04'
;     IDL> citation=atomneb_get_aij_reference_citation(Atom_Aij_file, atom, ion, reference)
;     IDL> print,citation
;        Froese Fischer et al 2004, ADNDT 87, 1
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
;     atomneb_get_aij_reference_citation
;
; PURPOSE:
;     This function returns the reference citation for a transition probability (Aij) 
;     from the 2nd binary table extension of the FITS data file ('AtoAij.fits')
;
; CALLING SEQUENCE:
;     citation=atomneb_get_aij_reference_citation(Atom_Aij_file, atom, ion, reference)
;
; INPUTS:
;     Atom_Aij_file : in, required, type=string, the FITS data file name ('AtoAij.fits')
;     Atom          : in, required, type=string, atom name e.g. 'o'
;     Ion           : in, required, type=string, ionic level e.g 'iii'
;     Reference     : in, type=string, set for the reference e.g. 'FFT04'
;
; OUTPUTS:  This function returns a string as the Citation.
;
; PROCEDURE: This function calls atomneb_read_aij_references and 
;            ftab_ext from IDL Astronomy User's library (../externals/astron/pro).
;
; EXAMPLE:
;     base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     data_dir = ['atomic-data', 'collection']
;     Atom_Aij_file = filepath('AtomAij.fits', root_dir=base_dir, subdir=data_dir )
;     atom='o'
;     ion='iii'
;     reference='FFT04'
;     citation=atomneb_get_aij_reference_citation(Atom_Aij_file, atom, ion, reference)
;     print,citation
;     > Froese Fischer et al 2004, ADNDT 87, 1
;
; MODIFICATION HISTORY:
;     24/12/2015, IDL code by A. Danehkar
;- 
  reference_template={Reference:'', Citation: ''}
  
  element_data_reference=atomneb_read_aij_references(Atom_Aij_file)
  atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_aij_'+strupcase(reference)
  ii=where(element_data_reference.Reference eq atom_ion_name);
  if ii eq -1 then begin
    print, 'could not find the given reference'
    exit
  endif
  Citation=element_data_reference[ii].Citation
  
  return, Citation
end
