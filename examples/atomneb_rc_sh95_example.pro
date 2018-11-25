; --- Begin $MAIN$ program. ---------------
; 

; Use Atomic Data Collection from Storey and Hummer (1995) 1995MNRAS.272...41S

; Locate datasets
base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
data_dir = ['atomic-data-rc']
Atom_RC_file= filepath('rc_SH95.fits', root_dir=base_dir, subdir=data_dir )

atom='h'
ion='ii' ; H I
; read Recombination Coefficients (Aeff) of H I
hi_rc_data=atomneb_read_aeff_sh95(Atom_RC_file, atom, ion)
; print information needed for Recombination Coefficients (Aeff) of He I
print,hi_rc_data[0].Aeff

atom='h'
ion='ii' ; H I
; list all Recombination Coefficients (Aeff) data for H I
list_hi_aeff_data=atomneb_search_aeff_sh95(Atom_RC_file, atom, ion)
; print all Recombination Coefficients (Aeff) of H I
print,list_hi_aeff_data

atom='h'
ion='ii' ; H I
; list all Recombination Coefficients (Aeff) references for H I
list_hi_aeff_reference=atomneb_list_aeff_sh95_references(Atom_RC_file, atom, ion)
; print all Recombination Coefficients (Aeff) References for H I
print,list_hi_aeff_reference

atom='h'
ion='ii' ; H I
; get citations for Recombination Coefficients (Aeff) of H I
citation=atomneb_get_aeff_sh95_reference_citation(Atom_RC_file, atom, ion)
; print citations for Recombination Coefficients (Aeff) of H I
print,citation

end
