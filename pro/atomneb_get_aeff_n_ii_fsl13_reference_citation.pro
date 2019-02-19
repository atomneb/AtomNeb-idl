; docformat = 'rst'

function atomneb_get_aeff_n_ii_fsl13_reference_citation, Atom_RC_file, atom, ion, reference=reference
;+
;     This function returns the reference citation for a recombination coefficient (Aeff)
;     from the 2nd binary table extension of the FITS data file ('rc_n_iii_FSL13.fits').
;
; :Returns:
;    type=string. This function returns the Citation.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_n_iii_FSL13.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'n'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Keywords:
;     reference     : in, type=string
;                     set for the reference e.g. 'FSL13',  may not necessary
;
; :Examples:
;    For example::
;
;     IDL> base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     IDL> data_dir = ['atomic-data-rc']
;     IDL> Atom_RC_file= filepath('rc_n_iii_FSL13.fits', root_dir=base_dir, subdir=data_dir )
;     IDL> atom='n'
;     IDL> ion='iii' ; N II
;     IDL> reference='FSL13'
;     IDL> citation=atomneb_get_aeff_n_ii_fsl13_reference_citation(Atom_RC_file, atom, ion)
;     IDL> print, citation
;        Fang X., Storey P.J., and Liu X.-W., R. 2011, Astron.Astrophys. 530, A18; 2013, Astron.Astrophys. 550, C2
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
;   0.0.1
;
; :History:
;     03/07/2017, IDL code by A. Danehkar
;-

;+
; NAME:
;     atomneb_get_aeff_n_ii_fsl13_reference_citation
;
; PURPOSE:
;     This function returns the reference citation for a recombination coefficient (Aeff)
;     from the 2nd binary table extension of the FITS data file ('rc_n_iii_FSL13.fits').
;
; CALLING SEQUENCE:
;     citation=atomneb_get_aeff_n_ii_fsl13_reference_citation(Atom_RC_file, atom, ion, reference=reference)
;
; INPUTS:
;     Atom_RC_file  : in, required, type=string, the FITS data file name ('rc_n_iii_FSL13.fits')
;     Atom          : in, required, type=string, atom name e.g. 'n'
;     Ion           : in, required, type=string, ionic level e.g 'iii'
;
; KEYWORD PARAMETERS:
;     REFERENCE     : in, type=string, set for the reference e.g. 'FSL13', may not necessary
;  
; OUTPUTS:  This function returns a string as the Citation.
;
; PROCEDURE: This function calls atomneb_read_aeff_n_ii_fsl13_references and 
;            ftab_ext from IDL Astronomy User's library (../externals/astron/pro).
;
; EXAMPLE:
;     base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     data_dir = ['atomic-data-rc']
;     Atom_RC_file= filepath('rc_n_iii_FSL13.fits', root_dir=base_dir, subdir=data_dir )
;     atom='n'
;     ion='iii' ; N II
;     reference='FSL13'
;     citation=atomneb_get_aeff_n_ii_fsl13_reference_citation(Atom_RC_file, atom, ion)
;     print, citation
;     > Fang X., Storey P.J., and Liu X.-W., R. 2011, Astron.Astrophys. 530, A18; 2013, Astron.Astrophys. 550, C2
;
; MODIFICATION HISTORY:
;     03/07/2017, IDL code by A. Danehkar
;-
  reference_template={Reference:'', Citation: ''}
  
  element_data_reference=atomneb_read_aeff_n_ii_fsl13_references(Atom_RC_file)
  atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_aeff'
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
