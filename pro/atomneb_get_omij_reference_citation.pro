; docformat = 'rst'

function atomneb_get_omij_reference_citation, Atom_Omij_file, atom, ion, reference
;+
;     This function returns the reference citation for collision strengths (Omega_ij)
;     from the 2nd binary table extension of the FITS data file ('AtomOmij.fits').
;
; :Returns:
;    type=string. This function returns the Citation.
;
; :Params:
;     Atom_Omij_file  : in, required, type=string
;                     the FITS data file name ('AtomOmij.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'o'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;     reference     : in, type=string
;                     set for the reference e.g. 'SSB14'
;
; :Examples:
;    For example::
;
;     IDL> base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     IDL> data_dir = ['atomic-data', 'collection']
;     IDL> Atom_Omij_file = filepath('AtomOmij.fits', root_dir=base_dir, subdir=data_dir )
;     IDL> atom='o'
;     IDL> ion='iii'
;     IDL> reference='SSB14'
;     IDL> citation=atomneb_get_omij_reference_citation(Atom_Omij_file, atom, ion, reference)
;     IDL> print,citation
;        Storey, P. J., Sochi, T., and Badnell, N. R. 2014, Astron.Astrophys., 441, 3028
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
  
  element_data_reference=atomneb_read_omij_references(Atom_Omij_file)
  atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_omij_'+strupcase(reference)
  ii=where(element_data_reference.Reference eq atom_ion_name);
  if ii eq -1 then begin
    print, 'could not find the given reference'
    exit
  endif
  Citation=element_data_reference[ii].Citation
  
  return, Citation
end
