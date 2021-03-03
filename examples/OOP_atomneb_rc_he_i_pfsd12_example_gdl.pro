; --- Begin $MAIN$ program. ---------------
; 

; Use Atomic Data Collection from Porter et al (2012) and (2013)
; 2012MNRAS.425L..28P and 2013MNRAS.433L..89P

atm=obj_new('atomneb')

atom='he'
ion='ii' ; He I
; read Recombination Coefficients (Aeff) of He I
hei_rc_data=atm->read_aeff_he_i_pfsd12(atom, ion)
hei_rc_data_wave=atm->read_aeff_he_i_pfsd12(atom, ion, /wavelength)
; print information needed for Recombination Coefficients (Aeff) of He I
print,hei_rc_data[0].Aeff
temp=size(hei_rc_data_wave.Wavelength,/DIMENSIONS)
n_line=temp[0]
for i=0,n_line-1 do print,hei_rc_data_wave[i].Wavelength, hei_rc_data_wave[i].LowerTerm, hei_rc_data_wave[i].UpperTerm

atom='he'
ion='ii' ; He I
; list all Recombination Coefficients (Aeff) data for He I
list_hei_aeff_data=atm->search_aeff_he_i_pfsd12(atom, ion)
; print all Recombination Coefficients (Aeff) of He I
print,list_hei_aeff_data

atom='he'
ion='ii' ; He I
; list all Recombination Coefficients (Aeff) references for He I
list_hei_aeff_reference=atm->list_aeff_he_i_pfsd12_references(atom, ion)
; print all Recombination Coefficients (Aeff) References for He I
print,list_hei_aeff_reference

atom='he'
ion='ii' ; He I
reference='PFSD13'
; get citations for Recombination Coefficients (Aeff) of He I
citation=atm->get_aeff_he_i_pfsd12_reference_citation(atom, ion, reference=reference)
; print citations for Recombination Coefficients (Aeff) of He I
print,citation

exit
