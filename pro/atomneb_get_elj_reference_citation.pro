; docformat = 'rst'

function atomneb_get_elj_reference_citation, Atom_Elj_file, reference
;+
;     This function returns the reference citation for energy levels (Ej)
;     from the 2nd binary table extension of the FITS data file ('AtomElj.fits').
;
; :Returns:
;    type=string. This function returns the Citation.
;
; :Params:
;     Atom_Elj_file  : in, required, type=string
;                     the FITS data file name ('AtomElj.fits')
;     reference     : in, type=string
;                     set for the reference e.g. 'L7288'
;
; :Examples:
;    For example::
;
;     IDL> base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     IDL> data_dir = ['atomic-data', 'collection']
;     IDL> Atom_Elj_file = filepath('AtomElj.fits', root_dir=base_dir, subdir=data_dir )
;     IDL> reference='L7288'
;     IDL> citation=atomneb_get_elj_reference_citation(Atom_Elj_file, reference)
;     IDL> print,citation
;        C. E. Moore, in CRC Series in Evaluated Data in Atomic Physics, 339 pp. (CRC Press, Boca Raton, FL, 1993)
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
;     atomneb_get_elj_reference_citation
;
; PURPOSE:
;     This function returns the reference citation for energy levels (Ej)
;     from the 2nd binary table extension of the FITS data file ('AtomElj.fits').
;
; CALLING SEQUENCE:
;     citation=atomneb_get_elj_reference_citation(Atom_Elj_file, reference)
;
; INPUTS:
;     Atom_Elj_file : in, required, type=string, the FITS data file name ('AtomElj.fits')
;     Reference     : in, type=string, set for the reference e.g. 'L7288'
;
; OUTPUTS:  This function returns a string as the Citation.
;
; PROCEDURE: This function calls atomneb_read_elj_references and 
;            ftab_ext from IDL Astronomy User's library (../externals/astron/pro).
;
; EXAMPLE:
;     base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     data_dir = ['atomic-data', 'collection']
;     Atom_Elj_file = filepath('AtomElj.fits', root_dir=base_dir, subdir=data_dir )
;     reference='L7288'
;     citation=atomneb_get_elj_reference_citation(Atom_Elj_file, reference)
;     print,citation
;     > C. E. Moore, in CRC Series in Evaluated Data in Atomic Physics, 339 pp. (CRC Press, Boca Raton, FL, 1993)
;
; MODIFICATION HISTORY:
;     24/12/2015, IDL code by A. Danehkar
;-
  reference_template={Reference:'', Citation: ''}
  
  element_data_reference=atomneb_read_elj_references(Atom_Elj_file)
  ii=where(element_data_reference.Reference eq reference);
  if ii eq -1 then begin
    print, 'could not find the given reference'
    exit
  endif
  Citation=element_data_reference[ii].Citation
  
  return, Citation
end
