; --- Begin $MAIN$ program. ---------------
; 

; Use Atomic Data Collection from Storey, Sochi and Bastin (2017)
; 2017MNRAS.470..379S

; Locate datasets
base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
data_dir = ['atomic-data-rc']
Atom_RC_file= filepath('rc_o_iii_SSB17.fits', root_dir=base_dir, subdir=data_dir )

atom='o'
ion='iii' ; O II
case1='B'
; read Recombination Coefficients (Aeff) of O II
wavelength_range=[5320.0, 5330.0] 
oii_rc_data=atomneb_read_aeff_o_ii_ssb17(Atom_RC_file, atom, ion, case1, wavelength_range)
oii_rc_data_wave=atomneb_read_aeff_o_ii_ssb17(Atom_RC_file, atom, ion, case1, wavelength_range, /wavelength)
; print information needed for Recombination Coefficients (Aeff) of O II
print,oii_rc_data[0].Aeff
temp=size(oii_rc_data_wave.Wavelength,/DIMENSIONS)
n_line=temp[0]
for i=0,n_line-1 do print,oii_rc_data_wave[i].Wavelength, oii_rc_data_wave[i].lower_term, oii_rc_data_wave[i].upper_term

atom='o'
ion='iii' ; O II
case1='B'
; list all Recombination Coefficients (Aeff) data for O II
wavelength=5325.42
list_oii_aeff_data=atomneb_search_aeff_o_ii_ssb17(Atom_RC_file, atom, ion, case1, wavelength)
; print all Recombination Coefficients (Aeff) of O II
print,list_oii_aeff_data.Wavelength
print,list_oii_aeff_data.Aeff

atom='o'
ion='iii' ; O II
; list all Recombination Coefficients (Aeff) references for O II
list_oii_aeff_reference=atomneb_list_aeff_o_ii_ssb17_references(Atom_RC_file, atom, ion)
; print all Recombination Coefficients (Aeff) References for O II
print,list_oii_aeff_reference

atom='o'
ion='iii' ; O II
reference='SSB17'
; get citations for Recombination Coefficients (Aeff) of O II
citation=atomneb_get_aeff_o_ii_ssb17_reference_citation(Atom_RC_file, atom, ion)
; print citations for Recombination Coefficients (Aeff) of O II
print,citation

end
