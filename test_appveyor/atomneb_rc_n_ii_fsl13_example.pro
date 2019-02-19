; --- Begin $MAIN$ program. ---------------
; 

; Use Atomic Data Collection from Fang, Storey and Liu (2011) and (2013)
; 2011A&A...530A..18F and 2013A&A...550C...2F

; Locate datasets
;base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
base_dir='/home/appveyor/projects/atomneb-idl/'
data_dir = ['atomic-data-rc']
Atom_RC_file= filepath('rc_n_iii_FSL13.fits', root_dir=base_dir, subdir=data_dir )

atom='n'
ion='iii' ; N II
; read Recombination Coefficients (Aeff) of N II
wavelength_range=[4400.0, 7100.0] 
nii_rc_data=atomneb_read_aeff_n_ii_fsl13(Atom_RC_file, atom, ion, wavelength_range)
nii_rc_data_wave=atomneb_read_aeff_n_ii_fsl13(Atom_RC_file, atom, ion, wavelength_range, /wavelength)
; print information needed for Recombination Coefficients (Aeff) of N II
print,nii_rc_data[0].Aeff
temp=size(nii_rc_data_wave.Wavelength,/DIMENSIONS)
n_line=temp[0]
for i=0,n_line-1 do print,nii_rc_data_wave[i].Wavelength, nii_rc_data_wave[i].Tr, nii_rc_data_wave[i].Trans

atom='n'
ion='iii' ; N II
; list all Recombination Coefficients (Aeff) data for N II
wavelength=5679.56
list_nii_aeff_data=atomneb_search_aeff_n_ii_fsl13(Atom_RC_file, atom, ion, wavelength)
; print all Recombination Coefficients (Aeff) of N II
print,list_nii_aeff_data.Wavelength
print,list_nii_aeff_data.Aeff

atom='n'
ion='iii' ; N II
; list all Recombination Coefficients (Aeff) references for N II
list_nii_aeff_reference=atomneb_list_aeff_n_ii_fsl13_references(Atom_RC_file, atom, ion)
; print all Recombination Coefficients (Aeff) References for N II
print,list_nii_aeff_reference

atom='n'
ion='iii' ; N II
reference='FSL13'
; get citations for Recombination Coefficients (Aeff) of N II
citation=atomneb_get_aeff_n_ii_fsl13_reference_citation(Atom_RC_file, atom, ion)
; print citations for Recombination Coefficients (Aeff) of N II
print,citation

end
