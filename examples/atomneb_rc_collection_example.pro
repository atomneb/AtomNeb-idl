; --- Begin $MAIN$ program. ---------------
; 

; Use Atomic Data Collection for C II (Davey et al. 2000 2000A&AS..142...85D), 
; N II (Escalante and Victor 1990 1990ApJS...73..513E), 
; O II (Storey 1994 1994A&A...282..999S; Liu et al. 1995 1995MNRAS.272..369L), 
; and Ne II ions (Kisielius et al. 1998 1998A&AS..133..257K)

; Update paths!
Atom_RC_file='/home/atomic_data/atomneb/atomic-data-rc/rc_collection.fits'

atom='c'
ion='iii' ; C II
; read Recombination Coefficients (Aeff) of C II
cii_rc_data=atomneb_read_aeff_collection(Atom_RC_file, atom, ion)
temp=size(cii_rc_data.Wavelength,/DIMENSIONS)
n_line=temp[0]
; print information needed for Recombination Coefficients (Aeff) of C II
for i=0,n_line-1 do print,cii_rc_data[i].Wavelength, cii_rc_data[i].a, $
                          cii_rc_data[i].b, cii_rc_data[i].c, $
                          cii_rc_data[i].d, cii_rc_data[i].f

atom='n'
ion='iii' ; N II
; read Recombination Coefficients (Aeff) of N II
nii_rc_data=atomneb_read_aeff_collection(Atom_RC_file, atom, ion)
nii_rc_data_br=atomneb_read_aeff_collection(Atom_RC_file, atom, ion, /br)
temp=size(nii_rc_data.a,/DIMENSIONS)
n_line=temp[0]
; print information needed for Recombination Coefficients (Aeff) of N II
for i=0,n_line-1 do print,nii_rc_data[i].a, nii_rc_data[i].b,  nii_rc_data[i].c
temp=size(nii_rc_data_br.Wavelength,/DIMENSIONS)
n_line=temp[0]
; print forBranching ratios (Br) of N II
for i=0,n_line-1 do print,nii_rc_data_br[i].Wavelength, nii_rc_data_br[i].br, $
                          nii_rc_data_br[i].g1,nii_rc_data_br[i].g2, $
                          nii_rc_data_br[i].Mult1, $
                          nii_rc_data_br[i].LowerTerm,nii_rc_data_br[i].UpperTerm
                          
atom='o'
ion='iii' ; O II
; read Recombination Coefficients (Aeff) of O II
oii_rc_data=atomneb_read_aeff_collection(Atom_RC_file, atom, ion)
oii_rc_data_br=atomneb_read_aeff_collection(Atom_RC_file, atom, ion, /br)
temp=size(oii_rc_data.a2,/DIMENSIONS)
n_line=temp[0]
; print information needed for Recombination Coefficients (Aeff) of O II
for i=0,n_line-1 do print,oii_rc_data[i].Term,oii_rc_data[i].Case1, $
                        oii_rc_data[i].a2,oii_rc_data[i].a4,oii_rc_data[i].a5,oii_rc_data[i].a6, $
                        oii_rc_data[i].b,oii_rc_data[i].c,oii_rc_data[i].d
temp=size(oii_rc_data_br.Wavelength,/DIMENSIONS)
n_line=temp[0] 
; print forBranching ratios (Br) of O II
for i=0,n_line-1 do print,oii_rc_data_br[i].Wavelength, $
                        oii_rc_data_br[i].Br_A,oii_rc_data_br[i].Br_B,oii_rc_data_br[i].Br_C, $
                        oii_rc_data_br[i].g1,oii_rc_data_br[i].g2, $
                        oii_rc_data_br[i].Mult1,oii_rc_data_br[i].LowerTerm,oii_rc_data_br[i].UpperTerm
                          
atom='ne'
ion='iii' ; Ne II
; read Recombination Coefficients (Aeff) of Ne II
neii_rc_data=atomneb_read_aeff_collection(Atom_RC_file, atom, ion)
temp=size(neii_rc_data.Wavelength,/DIMENSIONS)
n_line=temp[0]
; print information needed for Recombination Coefficients (Aeff) of Ne II
for i=0,n_line-1 do print,neii_rc_data[i].Wavelength, neii_rc_data[i].a, $
                          neii_rc_data[i].b, neii_rc_data[i].c, $
                          neii_rc_data[i].d, neii_rc_data[i].f, neii_rc_data[i].br
                                                
atom='c'
ion='iii' ; C III
; list all Recombination Coefficients (Aeff) data for C III
list_cii_aeff_data=atomneb_search_aeff_collection(Atom_RC_file, atom, ion)
; print all Recombination Coefficients (Aeff) of C III
print,list_cii_aeff_data

atom='c'
ion='iii' ; C III
; list all Recombination Coefficients (Aeff) references for C III
list_cii_aeff_reference=atomneb_list_aeff_collection_references(Atom_RC_file, atom, ion)
; print all Recombination Coefficients (Aeff) References for C III
print,list_cii_aeff_reference

atom='c'
ion='iii' ; C III
; get citations for Recombination Coefficients (Aeff) of C III with reference SSB14
citation=atomneb_get_aeff_collection_reference_citation(Atom_RC_file, atom, ion)
; print citations for Recombination Coefficients (Aeff) of C III with reference SSB14
print,citation

end
