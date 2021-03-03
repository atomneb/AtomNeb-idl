; --- Begin $MAIN$ program. ---------------
; 

; Use Atomic Data from the CHIANTI atomic database version 5.2

atm=obj_new('atomneb')
atm->set_data_cel,'chianti52'

; read Energy Levels (Ej) list
elj_data_list=atm->read_elj_list()
; read Collision Strengths (Omegaij) list
omij_data_list=atm->read_omij_list()
; read Transition Probabilities (Aij) list
aij_data_list=atm->read_aij_list()

; read Energy Levels (Ej) references
elj_data_reference=atm->read_elj_references()
; read Collision Strengths (Omegaij) references
omij_data_reference=atm->read_omij_references()
; read Transition Probabilities (Aij) references
aij_data_reference=atm->read_aij_references()

atom='o'
ion='iii'
; read Energy Levels (Ej) of O III upto level number 6
oiii_elj_data=atm->read_elj(atom, ion, level_num=6)
; print Levels of O III
print,oiii_elj_data.J_v
; print Energy Levels (cm-1) of O III
print,oiii_elj_data.Ej

; get citations for Energy Levels (Ej) Reference o_iii_elj
citation=atm->get_elj_reference_citation('o_iii_elj')
; print citations for Energy Levels (Ej) Reference o_iii_elj
print,citation

atom='o'
ion='iii'
; read Collision Strengths (Omegaij) of O III
oiii_omij_data=atm->read_omij(atom, ion)
; print Level 1 of Collision Strengths (Omegaij) of O III
print,oiii_omij_data.level1
; print Level 2 of Collision Strengths (Omegaij) of O III
print,oiii_omij_data.level2
; print Strength[1] of Collision Strengths (Omegaij) of O III
print,oiii_omij_data[0].strength

atom='o'
ion='iii'
; list all Collision Strengths (Omegaij) data for O III
list_oiii_omij_data=atm->search_omij(atom, ion)
; print all Collision Strengths (Omegaij) of O III
print,list_oiii_omij_data

atom='o'
ion='iii'
; list all Collision Strengths (Omegaij) references for O III
list_oiii_omij_reference=atm->list_omij_references(atom, ion)
; print all Collision Strengths (Omegaij) References for O III
print,list_oiii_omij_reference

atom='o'
ion='iii'
reference='CHI52'
; get citations for Collision Strengths (Omegaij) of O III with reference CHI52
citation=atm->get_omij_reference_citation(atom, ion, reference)
; print citations for Collision Strengths (Omegaij) of O III with reference CHI52
print,citation

atom='o'
ion='iii'
reference='CHI52'
; read Transition Probabilities (Aij) of O III with reference CHI52
oiii_aij_data=atm->read_aij(atom, ion)
; print Transition Probabilities (Aij) of O III with reference CHI52
print,oiii_aij_data.Aij[*,*]

atom='o'
ion='iii'
reference='CHI52'
; get citations for Transition Probabilities (Aij) of O III with reference CHI52
citation=atm->get_aij_reference_citation(atom, ion, reference)
; print citations for Transition Probabilities (Aij) of O III with reference CHI52
print,citation

atom='o'
ion='iii'
; list all Transition Probabilities (Aij) data for O III
list_oiii_aij_data=atm->search_aij(atom, ion)
; print all Transition Probabilities (Aij) data for O III
print,list_oiii_aij_data

atom='o'
ion='iii'
; list all Transition Probabilities (Aij) references for O III
list_oiii_aij_reference=atm->list_aij_references(atom, ion)
; print all Transition Probabilities (Aij) references for O III
print,list_oiii_aij_reference

exit
