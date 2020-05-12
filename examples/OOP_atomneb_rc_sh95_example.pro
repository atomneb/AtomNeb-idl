; --- Begin $MAIN$ program. ---------------
; 

; Use Atomic Data Collection from Storey and Hummer (1995) 1995MNRAS.272...41S

atm=obj_new('atomneb')

atom='h'
ion='ii' ; H I
; read Recombination Coefficients (Aeff) of H I
hi_rc_data=atm->read_aeff_sh95(atom, ion)
; print information needed for Recombination Coefficients (Aeff) of He I
print,hi_rc_data[0].Aeff

atom='h'
ion='ii' ; H I
; list all Recombination Coefficients (Aeff) data for H I
list_hi_aeff_data=atm->search_aeff_sh95(atom, ion)
; print all Recombination Coefficients (Aeff) of H I
print,list_hi_aeff_data

atom='h'
ion='ii' ; H I
; list all Recombination Coefficients (Aeff) references for H I
list_hi_aeff_reference=atm->list_aeff_sh95_references(atom, ion)
; print all Recombination Coefficients (Aeff) References for H I
print,list_hi_aeff_reference

atom='h'
ion='ii' ; H I
; get citations for Recombination Coefficients (Aeff) of H I
citation=atm->get_aeff_sh95_reference_citation(atom, ion)
; print citations for Recombination Coefficients (Aeff) of H I
print,citation

end
