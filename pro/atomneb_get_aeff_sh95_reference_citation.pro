; docformat = 'rst'

function atomneb_get_aeff_sh95_reference_citation, Atom_RC_file, atom, ion, reference=reference, case1=case1
;+
;     This function returns the reference citation for a recombination coefficient (Aeff)
;     from the 2nd binary table extension of the FITS data file ('rc_SH95.fits').
;
; :Returns:
;    type=string. This function returns the Citation.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_SH95.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'h'
;     ion           : in, required, type=string
;                     ionic level e.g 'ii'
;
; :Keywords:
;     reference     : in, type=string
;                     set for the reference,  not necessary
;     case1         : in, type=string
;                     set for the case 'a' or 'b', defualt 'b'
;
; :Examples:
;    For example::
;   
;     IDL> base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     IDL> data_dir = ['atomic-data-rc']
;     IDL> Atom_RC_file= filepath('rc_SH95.fits', root_dir=base_dir, subdir=data_dir )
;     IDL> atom='h'
;     IDL> ion='ii' ; H I
;     IDL> citation=atomneb_get_aeff_sh95_reference_citation(Atom_RC_file, atom, ion)
;     IDL> print, citation
;        Storey, P. J. and Hummer, D. G., MNRAS, 272, 41S, 1995
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
;   0.2.0
;
; :History:
;     15/01/2017, IDL code by A. Danehkar
;-
  reference_template={Reference:'', Citation: ''}
  
  element_data_reference=atomneb_read_aeff_sh95_references(Atom_RC_file)
  atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_aeff'
  if keyword_set(case1) eq 1 then begin
    atom_ion_name=atom_ion_name+'_'+case1
  endif else begin
    atom_ion_name=atom_ion_name+'_b'
  endelse
  if keyword_set(reference) eq 1 then begin
    atom_ion_name=atom_ion_name+'_'+strupcase(reference)
  endif 
  
  ii=where(element_data_reference.Reference eq atom_ion_name);
  if ii eq -1 then begin
    print, 'could not find the given reference'
    exit
  endif
  Citation=element_data_reference[ii].Citation
  
  return, Citation
end
