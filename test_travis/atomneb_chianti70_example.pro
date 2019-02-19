; --- Begin $MAIN$ program. ---------------
; 

; Use Atomic Data from the CHIANTI atomic database version 7.0

; Locate datasets
;base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
base_dir='/home/travis/build/atomneb/AtomNeb-idl/'
data_dir = ['atomic-data', 'chianti70']
Atom_Elj_file = filepath('AtomElj.fits', root_dir=base_dir, subdir=data_dir )
Atom_Omij_file = filepath('AtomOmij.fits', root_dir=base_dir, subdir=data_dir )
Atom_Aij_file = filepath('AtomAij.fits', root_dir=base_dir, subdir=data_dir )

; read Energy Levels (Ej) list
elj_data_list=atomneb_read_elj_list(Atom_Elj_file)
; read Collision Strengths (Omegaij) list
omij_data_list=atomneb_read_omij_list(Atom_Omij_file)
; read Transition Probabilities (Aij) list
aij_data_list=atomneb_read_aij_list(Atom_Aij_file)

; read Energy Levels (Ej) references
elj_data_reference=atomneb_read_elj_references(Atom_Elj_file)
; read Collision Strengths (Omegaij) references
omij_data_reference=atomneb_read_omij_references(Atom_Omij_file)
; read Transition Probabilities (Aij) references
aij_data_reference=atomneb_read_aij_references(Atom_Aij_file)

atom='o'
ion='iii'
; read Energy Levels (Ej) of O III upto level number 6
oiii_elj_data=atomneb_read_elj(Atom_Elj_file, atom, ion, level_num=6)
; print Levels of O III
print,oiii_elj_data.J_v
; print Energy Levels (cm-1) of O III
print,oiii_elj_data.Ej

; get citations for Energy Levels (Ej) Reference o_iii_elj
citation=atomneb_get_elj_reference_citation(Atom_Elj_file, 'o_iii_elj')
; print citations for Energy Levels (Ej) Reference o_iii_elj
print,citation

atom='o'
ion='iii'
; read Collision Strengths (Omegaij) of O III
oiii_omij_data=atomneb_read_omij(Atom_Omij_file, atom, ion)
; print Level 1 of Collision Strengths (Omegaij) of O III
print,oiii_omij_data.level1
; print Level 2 of Collision Strengths (Omegaij) of O III
print,oiii_omij_data.level2
; print Strength[1] of Collision Strengths (Omegaij) of O III
print,oiii_omij_data[0].strength

atom='o'
ion='iii'
; list all Collision Strengths (Omegaij) data for O III
list_oiii_omij_data=atomneb_search_omij(Atom_Omij_file, atom, ion)
; print all Collision Strengths (Omegaij) of O III
print,list_oiii_omij_data

atom='o'
ion='iii'
; list all Collision Strengths (Omegaij) references for O III
list_oiii_omij_reference=atomneb_list_omij_references(Atom_Omij_file, atom, ion)
; print all Collision Strengths (Omegaij) References for O III
print,list_oiii_omij_reference

atom='o'
ion='iii'
reference='CHI70'
; get citations for Collision Strengths (Omegaij) of O III with reference CHI70
citation=atomneb_get_omij_reference_citation(Atom_Omij_file, atom, ion, reference)
; print citations for Collision Strengths (Omegaij) of O III with reference CHI70
print,citation

atom='o'
ion='iii'
reference='CHI70'
; read Transition Probabilities (Aij) of O III with reference CHI52
oiii_aij_data=atomneb_read_aij(Atom_Aij_file, atom, ion)
; print Transition Probabilities (Aij) of O III with reference CHI52
print,oiii_aij_data.Aij[*,*]

atom='o'
ion='iii'
reference='CHI70'
; get citations for Transition Probabilities (Aij) of O III with reference CHI70
citation=atomneb_get_aij_reference_citation(Atom_Aij_file, atom, ion, reference)
; print citations for Transition Probabilities (Aij) of O III with reference CHI70
print,citation

atom='o'
ion='iii'
; list all Transition Probabilities (Aij) data for O III
list_oiii_aij_data=atomneb_search_aij(Atom_Aij_file, atom, ion)
; print all Transition Probabilities (Aij) data for O III
print,list_oiii_aij_data

atom='o'
ion='iii'
; list all Transition Probabilities (Aij) references for O III
list_oiii_aij_reference=atomneb_list_aij_references(Atom_Aij_file, atom, ion)
; print all Transition Probabilities (Aij) references for O III
print,list_oiii_aij_reference


; --- End $MAIN$ program. ---------------
exit

