; docformat = 'rst'

;+
;     "Unit for AtomNeb IDL Library": 
;     This obejct library can be used
;     to read atomic data from AtomNeb, which is a database 
;     containing atomic data stored in the Flexible Image 
;     Transport System (FITS) file format for collisionally 
;     excited lines and recombination lines typically 
;     observed in spectra of ionized gaseous nebulae. 
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atm->set_data_cel,'chianti70'
;          
;
; :Categories:
;   Collisionally Excited Lines, Recombination Lines
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
;
;     12/05/2020, A. Danehkar, Create object-oriented programming (OOP).
;-
function atomneb::init
  self.base_dir = file_dirname(file_dirname((routine_info('atomneb__define', /source)).path))
  self.data_dir = 'atomic-data'
  self.data_cel_dir = 'chianti70'
  self.data_rc_dir = 'atomic-data-rc'
  self.Atom_Elj_file = filepath('AtomElj.fits', root_dir=self.base_dir, subdir=[self.data_dir , self.data_cel_dir] )
  self.Atom_Omij_file = filepath('AtomOmij.fits', root_dir=self.base_dir, subdir=[self.data_dir , self.data_cel_dir] )
  self.Atom_Aij_file = filepath('AtomAij.fits', root_dir=self.base_dir, subdir=[self.data_dir , self.data_cel_dir] )
  
  self.Atom_RC_Collection_file= filepath('rc_collection.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  self.Atom_RC_PPB91_file= filepath('rc_PPB91.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  self.Atom_RC_SH95_file= filepath('rc_SH95.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  self.Atom_RC_PFSD12_file= filepath('rc_he_ii_PFSD12.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  self.Atom_RC_N_III_FSL13_file= filepath('rc_n_iii_FSL13.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  ;self.Atom_RC_O_III_SSB17_file= filepath('rc_o_iii_SSB17.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  self.Atom_RC_O_III_SSB17_file= filepath('rc_o_iii_SSB17_orl_case_b.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  return,1
end

function atomneb::free
  ;ptr_free, self.hi_rc_data
  ;hi_rc_data=ptr_new(/ALLOCATE_HEAP)
  return,1
end
;-------------
function atomneb::read_elj_list
;+
;     This function returns the list of energy levels (Ej) from the 1st binary table extension
;     of the FITS data file ('AtomElj.fits')
;
; :Private:
;
; :Returns:
;    type=an array of data. This function returns the elj_data_list:
;          { Elj_Data:'',
;            Extension:0.0}
;
; :Params:
;     Atom_Elj_file  : in, required, type=string
;                     the FITS data file name ('AtomElj.fits')
;
; :Categories:
;   Collisionally Excited Lines
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
;     24/12/2015, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  elj_data_list=atomneb_read_elj_list(self.Atom_Elj_file)
  return, elj_data_list
end

function atomneb::read_omij_list
;+
;     This function returns the list of collision strengths (omega_ij) from the 1st binary table extension
;     of the FITS data file ('AtomOmij.fits').
;
; :Private:
;
; :Returns:
;    type=an array of data. This function returns the omij_data_list:
;          { Omij_Data:'',
;            Extension:0.0}
;
; :Params:
;     Atom_Omij_file  : in, required, type=string
;                     the FITS data file name ('AtomOmij.fits')
;
; :Categories:
;   Collisionally Excited Lines
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
;     24/12/2015, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  omij_data_list=atomneb_read_omij_list(self.Atom_Omij_file)
  return, omij_data_list
end

function atomneb::read_aij_list
;+
;     This function returns the list of transition probabilities (Aij) from the 1st binary table extension
;     of the FITS data file ('AtomAij.fits').
;
; :Private:
;
; :Returns:
;    type=an array of data. This function returns the aij_data_list:
;          { Aij_Data:'',
;            Extension:0.0}
;
; :Params:
;     Atom_Aij_file  : in, required, type=string
;                     the FITS data file name ('AtomAij.fits')
;
; :Categories:
;   Collisionally Excited Lines
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
;     24/12/2015, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  aij_data_list=atomneb_read_aij_list(self.Atom_Aij_file)
  return, aij_data_list
end

function atomneb::read_elj_references
;+
;     This function returns the reference list of energy levels (Ej) from the 2nd binary table extension
;     of the FITS data file ('AtomElj.fits').
;
; :Private:
;
; :Returns:
;    type=an array of data. This function returns the aij_data_reference:
;          { Reference:'',
;            Citation:''}
;
; :Params:
;     Atom_Elj_file  : in, required, type=string
;                      the FITS data file name ('AtomElj.fits')
;
; :Categories:
;   Collisionally Excited Lines
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
;     24/12/2015, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  elj_data_reference=atomneb_read_elj_references(self.Atom_Elj_file)
  return, elj_data_reference
end

function atomneb::read_omij_references
;+
;     This function returns the reference list of collision strengths (omega_ij) from the 2nd binary table extension
;     of the FITS data file ('AtomOmij.fits').
;
; :Private:
;
; :Returns:
;    type=an array of data. This function returns the aij_data_reference:
;          { Reference:'',
;            Citation:''}
;
; :Params:
;     Atom_Omij_file  : in, required, type=string
;                       the FITS data file name ('AtomOmij.fits')
;
; :Categories:
;   Collisionally Excited Lines
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
;     24/12/2015, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  omij_data_reference=atomneb_read_omij_references(self.Atom_Omij_file)
  return, omij_data_reference
end

function atomneb::read_aij_references
;+
;     This function returns the reference list of transition probabilities (Aij) from the 1nd binary table extension
;     of the FITS data file ('AtomAij.fits').
;
; :Private:
;
; :Returns:
;    type=an array of data. This function returns the aij_data_reference:
;          { Reference:'',
;            Citation:''}
;
; :Params:
;     Atom_Aij_file  : in, required, type=string
;                     the FITS data file name ('AtomAij.fits')
;
; :Categories:
;   Collisionally Excited Lines
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
;     24/12/2015, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  aij_data_reference=atomneb_read_aij_references(self.Atom_Aij_file)
  return, aij_data_reference
end

function atomneb::read_elj, atom, ion, level_num=level_num
;+
;     This function returns the energy levels (Ej) from the table extensions
;     of the FITS data file ('AtomElj.fits').
;
; :Returns:
;    type=an array of data. This function returns the elj_data:
;          { Configuration:'', 
;            Term:'', 
;            J:'', 
;            J_v:0.0, 
;            Ej:0.0, 
;            Reference:''}.
;
; :Params:
;     Atom_Elj_file  : in, required, type=string
;                     the FITS data file name ('AtomElj.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'o'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Keywords:
;     level_num     : in, type=string
;                     set for the maximum level number.
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atm->set_data_cel,'collection'
;     IDL> atom='o'
;     IDL> ion='iii'
;     IDL> oiii_elj_data=atm->read_elj(atom, ion, level_num=6)
;     IDL> print,oiii_elj_data.J_v
;        0.00000      1.00000      2.00000      2.00000      0.00000      2.00000
;     IDL> print,oiii_elj_data.Ej
;        0.0000000       113.17800       306.17400       20273.270       43185.740       60324.790
;
; :Categories:
;   Collisionally Excited Lines
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
;     24/12/2015, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  elj_data=atomneb_read_elj(self.Atom_Elj_file, atom, ion, level_num=level_num)
  return, elj_data
end

function atomneb::get_elj_reference_citation, reference
;+
;     This function returns the reference citation for energy levels (Ej)
;     from the 2nd binary table extension of the FITS data file ('AtomElj.fits').
;
; :Returns:
;    type=string. This function returns the Citation.
;
; :Params:
;     Atom_Elj_file  : in, required, type=string
;                     the FITS data file name ('AtomElj.fits')
;     reference     : in, type=string
;                     set for the reference e.g. 'L7288'
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atm->set_data_cel,'collection'
;     IDL> reference='L7288'
;     IDL> citation=atm->get_elj_reference_citation(reference)
;     IDL> print,citation
;        C. E. Moore, in CRC Series in Evaluated Data in Atomic Physics, 339 pp. (CRC Press, Boca Raton, FL, 1993)
;
; :Categories:
;   Collisionally Excited Lines
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
;     24/12/2015, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  citation=atomneb_get_elj_reference_citation(self.Atom_Elj_file, reference)
  return, citation
end

function atomneb::read_omij, atom, ion, reference=reference, level_num=level_num
;+
;     This function returns the collision strengths (omega_ij) from the table extensions
;     of the FITS data file ('AtomOmij.fits').
;
; :Returns:
;    type=an array of data. This function returns the omij_data:
;          { level1:0, 
;            level2:0, 
;            strength:dblarr(temp_steps)}.
;
; :Params:
;     Atom_Omij_file  : in, required, type=string
;                     the FITS data file name ('AtomOmij.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'o'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Keywords:
;     reference     : in, type=string
;                     set for the reference e.g. 'SSB14'
;     level_num     : in, type=string
;                     set for the maximum level number.
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atm->set_data_cel,'collection'
;     IDL> atom='o'
;     IDL> ion='iii'
;     IDL> reference='SSB14'
;     IDL> oiii_omij_data=atm->read_omij(atom, ion, reference=reference)
;     IDL> print,oiii_omij_data.level1
;        0       1       1       1       1       2       2       2       3       3       4
;     IDL> print,oiii_omij_data.level2
;        0       2       3       4       5       3       4       5       4       5       5
;     IDL> print,oiii_omij_data[0].strength
;        100.00000       125.89254       158.48932       199.52623       251.18864       ...
;
; :Categories:
;   Collisionally Excited Lines
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
;     24/12/2015, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  omij_data=atomneb_read_omij(self.Atom_Omij_file, atom, ion, reference=reference, level_num=level_num)
  return, omij_data
end

function atomneb::search_omij, atom, ion
;+
;     This function searches collision strengths (omega_ij) for given element
;     and ionic levels in the FITS data file ('AtomOmij.fits'), and returns the data entry.
;
; :Returns:
;    type=array of data. This function returns the Omij_Data.
;
; :Params:
;     Atom_Omij_file  : in, required, type=string
;                     the FITS data file name ('AtomOmij.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'o'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atm->set_data_cel,'collection'
;     IDL> atom='o'
;     IDL> ion='iii'
;     IDL> list_oiii_omij_data=atm->search_omij(atom, ion)
;     IDL> print,list_oiii_omij_data
;        o_iii_omij_AK99 o_iii_omij_LB94 o_iii_omij_Pal12-AK99 o_iii_omij_SSB14
;
; :Categories:
;   Collisionally Excited Lines
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
;     24/12/2015, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  list_omij_data=atomneb_search_omij(self.Atom_Omij_file, atom, ion)
  return, list_omij_data
end

function atomneb::list_omij_references, atom, ion
;+
;     This function returns a list for all references of collision strengths (Omega_ij)
;     for given element and ionic level from the FITS data file ('AtomOmij.fits').
;
; :Returns:
;    type=an array of strings. This function returns the references.
;
; :Params:
;     Atom_Omij_file  : in, required, type=string
;                     the FITS data file name ('AtomOmij.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'o'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atm->set_data_cel,'collection'
;     IDL> atom='o'
;     IDL> ion='iii'
;     IDL> list_oiii_omij_reference=atm->list_omij_references(atom, ion)
;     IDL> print,list_oiii_omij_reference
;        AK99 LB94 Pal12-AK99 SSB14
;
; :Categories:
;   Collisionally Excited Lines
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
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  list_omij_reference=atomneb_list_omij_references(self.Atom_Omij_file, atom, ion)
  return, list_omij_reference
end

function atomneb::get_omij_reference_citation, atom, ion, reference
;+
;     This function returns the reference citation for collision strengths (Omega_ij)
;     from the 2nd binary table extension of the FITS data file ('AtomOmij.fits').
;
; :Returns:
;    type=string. This function returns the Citation.
;
; :Params:
;     Atom_Omij_file  : in, required, type=string
;                     the FITS data file name ('AtomOmij.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'o'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;     reference     : in, type=string
;                     set for the reference e.g. 'SSB14'
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atm->set_data_cel,'collection'
;     IDL> atom='o'
;     IDL> ion='iii'
;     IDL> reference='SSB14'
;     IDL> citation=atm->get_omij_reference_citation(atom, ion, reference)
;     IDL> print,citation
;        Storey, P. J., Sochi, T., and Badnell, N. R. 2014, Astron.Astrophys., 441, 3028
;
; :Categories:
;   Collisionally Excited Lines
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
;     24/12/2015, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  citation=atomneb_get_omij_reference_citation(self.Atom_Omij_file, atom, ion, reference)
  return, citation
end

function atomneb::read_aij, atom, ion, reference=reference, level_num=level_num
;+
;     This function returns the transition probabilities (Aij) from the table extensions
;     of the FITS data file ('AtomAij.fits').
;
; :Returns:
;    type=an array of data. This function returns the aij_data:
;          { Aij:dblarr(n_level,n_level) }.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('AtoAij.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'o'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Keywords:
;     reference     : in, type=string
;                     set for the reference,  not necessary
;     level_num     : in, type=string
;                     set for the maximum level number.
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atm->set_data_cel,'collection'
;     IDL> atom='o'
;     IDL> ion='iii'
;     IDL> reference='FFT04'
;     IDL> oiii_aij_data=atm->read_aij(atom, ion, reference=reference)
;     IDL> print,oiii_aij_data.Aij[*,*]
;        0.0000000   2.5960000e-05   3.0300000e-11   2.3220000e-06       0.0000000    0.0021910000
;        0.0000000       0.0000000   9.6320000e-05    0.0069510000      0.22550000       230.80000
;        0.0000000       0.0000000       0.0000000     0.020290000   0.00069980000       576.50000
;        0.0000000       0.0000000       0.0000000       0.0000000       1.6850000    0.0057770000
;        0.0000000       0.0000000       0.0000000       0.0000000       0.0000000   3.7600000e-11
;        0.0000000       0.0000000       0.0000000       0.0000000       0.0000000       0.0000000
;
; :Categories:
;   Collisionally Excited Lines
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
;     24/12/2015, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  aij_data=atomneb_read_aij(self.Atom_Aij_file, atom, ion, reference=reference, level_num=level_num)
  return, aij_data
end

function atomneb::get_aij_reference_citation, atom, ion, reference
;+
;     This function returns the reference citation for a transition probability (Aij) 
;     from the 2nd binary table extension of the FITS data file ('AtoAij.fits')
;
; :Returns:
;    type=string. This function returns the Citation.
;
; :Params:
;     Atom_Aij_file : in, required, type=string
;                     the FITS data file name ('AtoAij.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'o'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;     reference     : in, type=string
;                     set for the reference e.g. 'FFT04'
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atm->set_data_cel,'collection'
;     IDL> atom='o'
;     IDL> ion='iii'
;     IDL> reference='FFT04'
;     IDL> citation=atm->get_aij_reference_citation(atom, ion, reference)
;     IDL> print,citation
;        Froese Fischer et al 2004, ADNDT 87, 1
;
; :Categories:
;   Collisionally Excited Lines
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
;     24/12/2015, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  citation=atomneb_get_aij_reference_citation(self.Atom_Aij_file, atom, ion, reference)
  return, citation
end

function atomneb::search_aij, atom, ion
;+
;     This function searches transition probabilities (Aij) for given element
;     and ionic levels in the FITS data file ('AtomAij.fits'), and returns the data entry.
;
; :Returns:
;    type=array of data. This function returns the Aij_Data.
;
; :Params:
;     Atom_Aij_file  : in, required, type=string
;                     the FITS data file name ('AtoAij.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'o'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atm->set_data_cel,'collection'
;     IDL> atom='o'
;     IDL> ion='iii'
;     IDL> list_oiii_aij_data=atm->search_aij(atom, ion)
;     IDL> print,list_oiii_aij_data
;        o_iii_aij_FFT04-SZ00 o_iii_aij_FFT04 o_iii_aij_GMZ97-WFD96 o_iii_aij_SZ00-WFD96
;
; :Categories:
;   Collisionally Excited Lines
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
;     24/12/2015, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  list_aij_data=atomneb_search_aij(self.Atom_Aij_file, atom, ion)
  return, list_aij_data
end

function atomneb::list_aij_references, atom, ion
;+
;     This function returns a list for all references of transition probabilities (Aij)
;     for given element and ionic level from the FITS data file ('AtoAij.fits').
;
; :Returns:
;    type=an array of strings. This function returns the references.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('AtoAij.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'o'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atm->set_data_cel,'collection'
;     IDL> atom='o'
;     IDL> ion='iii'
;     IDL> list_oiii_aij_reference=atm->list_aij_references(atom, ion)
;     IDL> print,list_oiii_aij_reference
;        FFT04-SZ00 FFT04 GMZ97-WFD96 SZ00-WFD96
;
; :Categories:
;   Collisionally Excited Lines
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
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  list_aij_reference=atomneb_list_aij_references(self.Atom_Aij_file, atom, ion)
  return, list_aij_reference
end
;-------------
function atomneb::read_aeff_collection, atom, ion, br=br, reference=reference
;+
;     This function returns the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file ('rc_collection.fits').
;
; :Returns: 
;    type=an array of data. This function returns the effective recombination coefficients.
;           aeff_data (c_iii_aeff)
;           { Wavelength:0.0,
;             a: 0.0,
;             b: 0.0,
;             c: 0.0,
;             d: 0.0,
;             f: 0.0}
;
;           aeff_data (n_iii_aeff)
;           { a: 0.0,
;             b: 0.0,
;             c: 0.0}
;
;           aeff_data (n_iii_br)
;           {Wavelength: 0.0,
;            BR: 0.0, $
;            g1:0,
;            g2:0,
;            Mult1:'',
;            LowerTerm:'',
;            UpperTerm:'' }
;
;           aeff_data (o_iii_aeff)
;           {Term: '',
;            Case1: '',
;            a2: 0.0,
;            a4: 0.0,
;            a5: 0.0,
;            a6: 0.0,
;            b: 0.0,
;            c: 0.0,
;            d: 0.0}
;
;           aeff_data (o_iii_br)
;           {Wavelength:double(0.0),
;            Br_A: 0.0,
;            Br_B: 0.0,
;            Br_C: 0.0,
;            g1: 0,
;            g2: 0,
;            Mult1: '',
;            LowerTerm: '',
;            UpperTerm: ''}
;
;            aeff_data (ne_iii_aeff)
;            {Wavelength:0.0,
;             a: 0.0,
;             b: 0.0,
;             c: 0.0,
;             d: 0.0,
;             f: 0.0,
;             br: 0.0}
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_collection.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'c'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Keywords:
;     br            : in, type=boolean
;                     set for the branching ratios (Br), may not necessary
;     reference     : in, type=string
;                     set for the reference, not necessary
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='c'
;     IDL> ion='iii' ; C III
;     IDL> cii_rc_data=atm->read_aeff_collection(atom, ion)
;     IDL> temp=size(cii_rc_data.Wavelength,/DIMENSIONS)
;     IDL> n_line=temp[0]
;     IDL> for i=0,n_line-1 do print,cii_rc_data[i].Wavelength, cii_rc_data[i].a, $
;     IDL>                           cii_rc_data[i].b, cii_rc_data[i].c, $
;     IDL>                           cii_rc_data[i].d, cii_rc_data[i].f
;        914.00000      0.69280000     0.021400000    -0.016300000     -0.24310000     -0.88000000
;        962.00000       1.0998000   -0.0042000000    -0.027900000     -0.22940000     -0.96560000
;        ...
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
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  rc_data=atomneb_read_aeff_collection(self.Atom_RC_Collection_file, atom, ion, br=br, reference=reference)
  return, rc_data
end

function atomneb::search_aeff_collection, atom, ion, br=br
;+
;     This function searches effective recombination coefficients (Aeff) for given element
;     and ionic levels in the FITS data file ('rc_collection.fits'), and returns the data entry.
;
; :Returns:
;    type=array of data. This function returns the Aeff_Data.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_collection.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'c'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Keywords:
;     br            : in, type=boolean
;                     set for the branching ratios (Br), may not necessary
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='c'
;     IDL> ion='iii' ; C III
;     IDL> list_cii_aeff_data=atm->search_aeff_collection(atom, ion)
;     IDL> print,list_cii_aeff_data
;        c_iii_aeff
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
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  list_aeff_data=atomneb_search_aeff_collection(self.Atom_RC_Collection_file, atom, ion, br=br)
  return, list_aeff_data
end

function atomneb::list_aeff_collection_references, atom, ion, br=br
;+
;     This function returns a list for all references of recombination coefficients (Aeff)
;     for given element and ionic level from the FITS data file ('rc_collection.fits').
;
; :Returns:
;    type=an array of strings. This function returns the references.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_collection.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'c'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Keywords:
;     br            : in, type=boolean
;                     set for the branching ratios (Br), may not necessary
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='c'
;     IDL> ion='iii' ; C III
;     IDL> list_cii_aeff_reference=atm->list_aeff_collection_references(atom, ion)
;     IDL> print,list_cii_aeff_reference
;         
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
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  list_aeff_reference=atomneb_list_aeff_collection_references(self.Atom_RC_Collection_file,atom, ion, br=br)
  return, list_aeff_reference
end

function atomneb::get_aeff_collection_reference_citation, atom, ion, br=br, reference=reference
;+
;     This function returns the reference citation for a recombination coefficient (Aeff)
;     from the 2nd binary table extension of the FITS data file ('rc_collection.fits').
;
; :Returns:
;    type=string. This function returns the Citation.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_collection.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'c'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Keywords:
;     br            : in, type=boolean
;                     set for the branching ratios (Br), may not necessary
;     reference     : in, type=string
;                     set for the reference, not necessary
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='c'
;     IDL> ion='iii' ; C III
;     IDL> citation=atm->get_aeff_collection_reference_citation(atom, ion)
;     IDL> print, citation
;        Davey, A. R., Storey, P. J. and Kisielius, R., Astron.Astrophys.Suppl., 142, 85, 2000
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
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  citation=atomneb_get_aeff_collection_reference_citation(self.Atom_RC_Collection_file, atom, ion, br=br, reference=reference)
  return, citation
end

function atomneb::read_aeff_ppb91, atom, ion, reference=reference
;+
;     This function returns the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file ('rc_PPB91.fits').
;
; :Returns:
;    type=an array of data. This function returns the effective recombination coefficients:
;          { Ion: ' '
;            Case1:''
;            Wavelength:0.0, 
;            a: 0.0, 
;            b: 0.0, 
;            c: 0.0, 
;            d: 0.0, 
;            br: 0.0, 
;            y: 0.0}
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_PPB91.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'c'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'  
;
; :Keywords:
;     reference     : in, type=string
;                     set for the reference,  not necessary
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='c'
;     IDL> ion='iii' ; C II
;     IDL> cii_rc_data=atm->read_aeff_ppb91(atom, ion)
;     IDL> temp=size(cii_rc_data.Wavelength,/DIMENSIONS)
;     IDL> n_line=temp[0]
;     IDL> for i=0,n_line-1 do print,cii_rc_data[i].Ion,cii_rc_data[i].Case1, $
;     IDL>                           cii_rc_data[i].Wavelength, cii_rc_data[i].a, $
;     IDL>                           cii_rc_data[i].b, cii_rc_data[i].c, $
;     IDL>                           cii_rc_data[i].d, cii_rc_data[i].br, $
;     IDL>                           cii_rc_data[i].Q, cii_rc_data[i].y
;        C2+A       9903.4600      0.69700000     -0.78400000      ...
;        C2+A       4267.1500       1.0110000     -0.75400000      ...
;        ...
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
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  rc_data=atomneb_read_aeff_ppb91(self.Atom_RC_PPB91_file, atom, ion, reference=reference)
  return, rc_data
end

function atomneb::search_aeff_ppb91, atom, ion
;+
;     This function searches effective recombination coefficients (Aeff) for given element
;     and ionic levels in the FITS data file ('rec_PPB91.fits'), and returns the data entry.
;
; :Returns:
;    type=array of data. This function returns the Aeff_Data.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_PPB91.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'c'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='c'
;     IDL> ion='iii'
;     IDL> list_cii_aeff_data=atm->search_aeff_ppb91(atom, ion)
;     IDL> print,list_cii_aeff_data
;        c_iii_aeff
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
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  list_aeff_data=atomneb_search_aeff_ppb91(self.Atom_RC_PPB91_file, atom, ion)
  return, list_aeff_data
end

function atomneb::list_aeff_ppb91_references, atom, ion
;+
;     This function returns a list for all references of recombination coefficients (Aeff)
;     for given element and ionic level from the FITS data file ('rc_PPB91.fits').
;
; :Returns:
;    type=an array of strings. This function returns the references.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_PPB91.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'c'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='c'
;     IDL> ion='iii'
;     IDL> list_cii_aeff_reference=atm->list_aeff_ppb91_references(atom, ion)
;     IDL> print,list_cii_aeff_reference
;        
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
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  list_aeff_reference=atomneb_list_aeff_ppb91_references(self.Atom_RC_PPB91_file, atom, ion)
  return, list_aeff_reference
end

function atomneb::get_aeff_ppb91_reference_citation, atom, ion, reference=reference
;+
;     This function returns the reference citation for a recombination coefficient (Aeff)
;     from the 2nd binary table extension of the FITS data file ('rc_PPB91.fits').
;
; :Returns:
;    type=string. This function returns the Citation.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_PPB91.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'c'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Keywords:
;     reference     : in, type=string
;                     set for the reference,  not necessary
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='c'
;     IDL> ion='iii'
;     IDL> citation=atm->get_aeff_ppb91_reference_citation(atom, ion)
;     IDL> print, citation
;        Pequignot, D., Petitjean, P. and Boisson, C. Astron.Astrophys., 251, 680, 1991
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
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  citation=atomneb_get_aeff_ppb91_reference_citation(self.Atom_RC_PPB91_file, atom, ion, reference=reference)
  return, citation
end

function atomneb::read_aeff_sh95, atom, ion, reference=reference, case1=case1
;+
;     This function returns the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file ('rc_SH95.fits').
;
; :Returns:
;    type=an array of data. This function returns the effective recombination coefficients.
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
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='h'
;     IDL> ion='ii' ; H I
;     IDL> hi_rc_data=atm->read_aeff_sh95(atom, ion)
;     IDL> print,hi_rc_data[0].Aeff
;        100.00000       500.00000       0.0000000   4.2140000e-27    1.7560000e-27  ...
;        ...
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
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  rc_data=atomneb_read_aeff_sh95(self.Atom_RC_SH95_file, atom, ion, reference=reference, case1=case1)
  return, rc_data
end

function atomneb::search_aeff_sh95, atom, ion
;+
;     This function searches effective recombination coefficients (Aeff) for given element
;     and ionic levels in the FITS data file ('rec_SH95.fits'), and returns the data entry.
;
; :Returns:
;    type=array of data. This function returns the Aeff_Data.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_SH95.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'h'
;     ion           : in, required, type=string
;                     ionic level e.g 'ii'
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='h'
;     IDL> ion='ii' ; H I
;     IDL> list_hi_aeff_data=atm->search_aeff_sh95(atom, ion)
;     IDL> print,list_hi_aeff_data
;        h_ii_aeff_a h_ii_aeff_b
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
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  list_aeff_data=atomneb_search_aeff_sh95(self.Atom_RC_SH95_file, atom, ion)
  return, list_aeff_data
end

function atomneb::list_aeff_sh95_references, atom, ion
;+
;     This function returns a list for all references of recombination coefficients (Aeff)
;     for given element and ionic level from the FITS data file ('rc_SH95.fits').
;
; :Returns:
;    type=an array of strings. This function returns the references.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_SH95.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'h'
;     ion           : in, required, type=string
;                     ionic level e.g 'ii'
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='h'
;     IDL> ion='ii' ; H I
;     IDL> list_hi_aeff_reference=atm->list_aeff_sh95_references(atom, ion)
;     IDL> print,list_hi_aeff_reference
;
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
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  list_aeff_reference=atomneb_list_aeff_sh95_references(self.Atom_RC_SH95_file, atom, ion)
  return, list_aeff_reference
end

function atomneb::get_aeff_sh95_reference_citation, atom, ion, reference=reference, case1=case1
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
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='h'
;     IDL> ion='ii' ; H I
;     IDL> citation=atm->get_aeff_sh95_reference_citation(atom, ion)
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
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  citation=atomneb_get_aeff_sh95_reference_citation(self.Atom_RC_SH95_file, atom, ion, reference=reference, case1=case1)
  return, citation
end

function atomneb::read_aeff_he_i_pfsd12, atom, ion, wavelength=wavelength, reference=reference
;+
;     This function returns the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file ('rc_he_ii_PFSD12.fits').
;
; :Returns:
;    type=an array of data. This function returns the effective recombination coefficients.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_he_ii_PFSD12.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'he'
;     ion           : in, required, type=string
;                     ionic level e.g 'ii'
;
; :Keywords:
;     wavelength    : in, type=boolean
;                     set for returning the wavelengths
;     reference     : in, type=string
;                     set for the reference, not necessary
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='he'
;     IDL> ion='ii' ; He I
;     IDL> hei_rc_data=atm->read_aeff_he_i_pfsd12(atom, ion)
;     IDL> hei_rc_data_wave=atm->read_aeff_he_i_pfsd12(atom, ion, /wavelength)
;     IDL> print,hei_rc_data[0].Aeff
;        5000.0000       10.000000      -25.379540      -25.058970      -25.948440      ...
;     IDL> temp=size(hei_rc_data_wave.Wavelength,/DIMENSIONS)
;     IDL> n_line=temp[0]
;     IDL> for i=0,n_line-1 do print,hei_rc_data_wave[i].Wavelength, hei_rc_data_wave[i].LowerTerm, hei_rc_data_wave[i].UpperTerm
;        2945.00005p^{3}P2s^{3}S
;        3188.00004p^{3}P2s^{3}S
;        3614.00005p^{1}P2s^{1}S
;        ...
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
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  rc_data=atomneb_read_aeff_he_i_pfsd12(self.Atom_RC_PFSD12_file, atom, ion, wavelength=wavelength, reference=reference)
  return, rc_data
end

function atomneb::search_aeff_he_i_pfsd12, atom, ion
;+
;     This function searches effective recombination coefficients (Aeff) for given element
;     and ionic levels in the FITS data file ('rec_he_ii_PFSD12.fits'), and returns the data entry.
;
; :Returns:
;    type=array of data. This function returns the Aeff_Data.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_he_ii_PFSD12.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'he'
;     ion           : in, required, type=string
;                     ionic level e.g 'ii'
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='he'
;     IDL> ion='ii' ; He I
;     IDL> list_hei_aeff_data=atm->search_aeff_he_i_pfsd12(atom, ion)
;     IDL> print,list_hei_aeff_data
;        he_ii_aeff_PFSD12 he_ii_aeff_PFSD13
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
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  list_aeff_data=atomneb_search_aeff_he_i_pfsd12(self.Atom_RC_PFSD12_file, atom, ion)
  return, list_aeff_data
end

function atomneb::list_aeff_he_i_pfsd12_references, atom, ion
;+
;     This function returns a list for all references of recombination coefficients (Aeff)
;     for given element and ionic level from the FITS data file ('rc_he_ii_PFSD12.fits').
;
; :Returns:
;    type=an array of strings. This function returns the references.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_he_ii_PFSD12.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'he'
;     ion           : in, required, type=string
;                     ionic level e.g 'ii'
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='he'
;     IDL> ion='ii' ; He I
;     IDL> list_hei_aeff_reference=atm->list_aeff_he_i_pfsd12_references(atom, ion)
;     IDL> print,list_hei_aeff_reference
;        PFSD12 PFSD13
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
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  list_aeff_reference=atomneb_list_aeff_he_i_pfsd12_references(self.Atom_RC_PFSD12_file, atom, ion)
  return, list_aeff_reference
end

function atomneb::get_aeff_he_i_pfsd12_reference_citation, atom, ion, reference=reference
;+
;     This function returns the reference citation for a recombination coefficient (Aeff)
;     from the 2nd binary table extension of the FITS data file ('rc_he_ii_PFSD12.fits').
;
; :Returns:
;    type=string. This function returns the Citation.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_he_ii_PFSD12.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'he'
;     ion           : in, required, type=string
;                     ionic level e.g 'ii'
;
; :Keywords:
;     reference     : in, type=string
;                     set for the reference e.g. 'PFSD13',  may not necessary
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='he'
;     IDL> ion='ii' ; He I
;     IDL> reference='PFSD13'
;     IDL> citation=atm->get_aeff_he_i_pfsd12_reference_citation(atom, ion, reference=reference)
;     IDL> print, citation
;        Porter, R. L., Ferland, G. J., Storey, P. J. and Detisch, M. J., MNRAS, 433L, 89, 2013
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
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  citation=atomneb_get_aeff_he_i_pfsd12_reference_citation(self.Atom_RC_PFSD12_file, atom, ion, reference=reference)
  return, citation
end

function atomneb::read_aeff_n_ii_fsl13, atom, ion, wavelength_range, wavelength=wavelength, reference=reference
;+
;     This function returns the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file ('rc_n_iii_FSL13.fits').
;
; :Returns:
;    type=an array of data. This function returns the effective recombination coefficients.
;
; :Params:
;     Atom_RC_file     : in, required, type=string
;                        the FITS data file name ('rc_n_iii_FSL13.fits')
;     atom             : in, required, type=string
;                        atom name e.g. 'n'
;     ion              : in, required, type=string
;                        ionic level e.g 'iii'
;     wavelength_range : in, required, type=array
;                        wavelength range e.g. [4400.0, 7100.0]    
; 
; :Keywords:
;     wavelength    : in, type=boolean
;                     set for returning the wavelengths
;     reference     : in, type=string
;                     set for the reference, not necessary
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='n'
;     IDL> ion='iii' ; N II
;     IDL> wavelength_range=[4400.0, 7100.0] 
;     IDL> nii_rc_data=atm->read_aeff_n_ii_fsl13(atom, ion, wavelength_range)
;     IDL> nii_rc_data_wave=atm->read_aeff_n_ii_fsl13(atom, ion, wavelength_range, /wavelength)
;     IDL> print,nii_rc_data[0].Aeff
;        255.000      79.5000      47.3000      12.5000      ...
;     IDL> temp=size(nii_rc_data_wave.Wavelength,/DIMENSIONS)
;     IDL> n_line=temp[0]
;     IDL> for i=0,n_line-1 do print,nii_rc_data_wave[i].Wavelength, nii_rc_data_wave[i].Tr, nii_rc_data_wave[i].Trans
;        6413.236g - 4f2p6g G[9/2]o4 - 2p4f F[7/2]e3
;        6556.326g - 4f2p6g G[9/2]o5 - 2p4f G[7/2]e4
;        6456.976g - 4f2p6g G[9/2]o5 - 2p4f F[7/2]e4
;        ...
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
;     03/07/2017, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  nii_data=atomneb_read_aeff_n_ii_fsl13(self.Atom_RC_N_III_FSL13_file, atom, ion, wavelength_range, wavelength=wavelength, reference=reference)
  return, nii_data
end

function atomneb::search_aeff_n_ii_fsl13, atom, ion, wavelength
;+
;     This function searches effective recombination coefficients (Aeff) for given element
;     and ionic levels in the FITS data file ('rc_n_iii_FSL13.fits'), and returns the data entry.
;
; :Returns:
;    type=array of data. This function returns the Aeff_Data.
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
;     wavelength    : in, type=float
;                     set the wavelengths
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='n'
;     IDL> ion='iii' ; N II
;     IDL> wavelength=5679.56
;     IDL> list_nii_aeff_data=atm->search_aeff_n_ii_fsl13(atom, ion, wavelength)
;     IDL> print,list_nii_aeff_data.Wavelength
;        5679.56
;     IDL> print,list_nii_aeff_data.Aeff
;        7810.00      1780.00      850.000      151.000      74.4000      53.1000      47.4000
;        7370.00      1700.00      886.000      206.000      110.000      80.1000      70.8000
;        7730.00      1680.00      900.000      239.000      138.000      103.000      92.9000
;        8520.00      1710.00      905.000      244.000      142.000      107.000      97.0000
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
;     03/07/2017, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  list_aeff_data=atomneb_search_aeff_n_ii_fsl13(self.Atom_RC_N_III_FSL13_file, atom, ion, wavelength)
  return, list_aeff_data
end

function atomneb::list_aeff_n_ii_fsl13_references, atom, ion
;+
;     This function returns a list for all references of recombination coefficients (Aeff)
;     for given element and ionic level from the FITS data file ('rc_n_iii_FSL13.fits').
;
; :Returns:
;    type=an array of strings. This function returns the references.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_n_iii_FSL13.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'n'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='n'
;     IDL> ion='iii' ; N II
;     IDL> list_nii_aeff_reference=atm->list_aeff_n_ii_fsl13_references(atom, ion)
;     IDL> print,list_nii_aeff_reference
;        
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
;     03/07/2017, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  list_aeff_reference=atomneb_list_aeff_n_ii_fsl13_references(self.Atom_RC_N_III_FSL13_file, atom, ion)
  return, list_aeff_reference
end

function atomneb::get_aeff_n_ii_fsl13_reference_citation, atom, ion, reference=reference
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
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='n'
;     IDL> ion='iii' ; N II
;     IDL> reference='FSL13'
;     IDL> citation=atm->get_aeff_n_ii_fsl13_reference_citation(atom, ion)
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
;   0.2.0
;
; :History:
;     03/07/2017, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  citation=atomneb_get_aeff_n_ii_fsl13_reference_citation(self.Atom_RC_N_III_FSL13_file, atom, ion)
  return, citation
end

function atomneb::read_aeff_o_ii_ssb17, atom, ion, case1, wavelength_range, wavelength=wavelength, reference=reference
;+
;     This function returns the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file ('rc_o_iii_SSB17.fits').
;
; :Returns:
;    type=an array of data. This function returns the effective recombination coefficients.
;
; :Params:
;     Atom_RC_file     : in, required, type=string
;                        the FITS data file name ('rc_o_iii_SSB17.fits')
;     atom             : in, required, type=string
;                        atom name e.g. 'o'
;     ion              : in, required, type=string
;                        ionic level e.g 'iii'
;     case1            : in, type=string
;                        set for the case 'a' or 'b', defualt 'b'
;     wavelength_range : in, required, type=array
;                        wavelength range e.g. [5320.0, 5330.0]    
;
; :Keywords:
;     wavelength    : in, type=boolean
;                     set for returning the wavelengths
;     reference     : in, type=string
;                     set for the reference, not necessary
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='o'
;     IDL> ion='iii' ; O II
;     IDL> case1='B'
;     IDL> wavelength_range=[5320.0, 5330.0] 
;     IDL> oii_rc_data=atm->read_aeff_o_ii_ssb17(atom, ion, case1, wavelength_range)
;     IDL> oii_rc_data_wave=atm->read_aeff_o_ii_ssb17(atom, ion, case1, wavelength_range, /wavelength)
;     IDL> print,oii_rc_data[0].Aeff
;        1.64100e-30  1.60000e-30  1.56400e-30  1.54100e-30 ...
;     IDL> temp=size(oii_rc_data_wave.Wavelength,/DIMENSIONS)
;     IDL> n_line=temp[0]
;     IDL> for i=0,n_line-1 do print,oii_rc_data_wave[i].Wavelength, oii_rc_data_wave[i].lower_term, oii_rc_data_wave[i].upper_term
;        5327.172s22p2(1S)3p 2Po
;        5325.422s22p2(1S)3p 2Po
;        5327.182s22p2(1D)3d 2Ge
;        ...
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
;     03/07/2017, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  rc_data=atomneb_read_aeff_o_ii_ssb17(self.Atom_RC_O_III_SSB17_file, atom, ion, case1, wavelength_range, wavelength=wavelength, reference=reference)
  return, rc_data
end

function atomneb::search_aeff_o_ii_ssb17, atom, ion, case1, wavelength
;+
;     This function searches effective recombination coefficients (Aeff) for given element
;     and ionic levels in the FITS data file ('rc_o_iii_SSB17.fits'), and returns the data entry.
;
; :Returns:
;    type=array of data. This function returns the Aeff_Data.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_o_iii_SSB17.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'o'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;     case1            : in, type=string
;                        set for the case 'a' or 'b', defualt 'b'
;     wavelength    : in, type=float
;                     set the wavelengths
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='o'
;     IDL> ion='iii' ; O II
;     IDL> case1='B'
;     IDL> wavelength=5325.42
;     IDL> list_oii_aeff_data=atm->search_aeff_o_ii_ssb17(atom, ion, case1, wavelength)
;     IDL> print,list_oii_aeff_data.Wavelength
;        5325.42
;     IDL> print,list_oii_aeff_data.Aeff
;        3.41800e-32  3.33300e-32  3.25700e-32  3.20900e-32  3.16800e-32 ...
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
;     03/07/2017, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  list_aeff_data=atomneb_search_aeff_o_ii_ssb17(self.Atom_RC_O_III_SSB17_file, atom, ion, case1, wavelength)
  return, list_aeff_data
end

function atomneb::list_aeff_o_ii_ssb17_references, atom, ion
;+
;     This function returns a list for all references of recombination coefficients (Aeff)
;     for given element and ionic level from the FITS data file ('rc_o_iii_SSB17.fits').
;
; :Returns:
;    type=an array of strings. This function returns the references.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_o_iii_SSB17.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'o'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='o'
;     IDL> ion='iii' ; O II
;     IDL> list_oii_aeff_reference=atm->list_aeff_o_ii_ssb17_references(atom, ion)
;     IDL> print,list_oii_aeff_reference
;        
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
;     03/07/2017, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  list_aeff_reference=atomneb_list_aeff_o_ii_ssb17_references(self.Atom_RC_O_III_SSB17_file, atom, ion)
  return, list_aeff_reference
end

function atomneb::get_aeff_o_ii_ssb17_reference_citation, atom, ion, reference=reference
;+
;     This function returns the reference citation for a recombination coefficient (Aeff)
;     from the 2nd binary table extension of the FITS data file ('rc_o_iii_SSB17.fits').
;
; :Returns:
;    type=string. This function returns the Citation.
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_o_iii_SSB17.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'o'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'
;
; :Keywords:
;     reference     : in, type=string
;                     set for the reference e.g. 'SSB17',  may not necessary
;
; :Examples:
;    For example::
;
;     IDL> atm=obj_new('atomneb')
;     IDL> atom='o'
;     IDL> ion='iii' ; O II
;     IDL> reference='SSB17'
;     IDL> citation=atm->get_aeff_o_ii_ssb17_reference_citation(atom, ion)
;     IDL> print, citation
;        Storey, P.J., Sochi, T. and Bastin, R. 2017, MNRAS, 470, 379; VizieR On-line Data Catalog: VI/150
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
;     03/07/2017, IDL code by A. Danehkar
;     
;     12/05/2020, A. Danehkar, Move to object-oriented programming (OOP).
;-
  citation=atomneb_get_aeff_o_ii_ssb17_reference_citation(self.Atom_RC_O_III_SSB17_file, atom, ion, reference=reference)
  return, citation
end
;-------------
pro atomneb::set_data_dir, data_dir
  if data_dir ne '' then self.data_dir=data_dir else print, 'Error: data_dir is not given'
  self.Atom_Elj_file = filepath('AtomElj.fits', root_dir=self.base_dir, subdir=[self.data_dir , self.data_cel_dir] )
  self.Atom_Omij_file = filepath('AtomOmij.fits', root_dir=self.base_dir, subdir=[self.data_dir , self.data_cel_dir] )
  self.Atom_Aij_file = filepath('AtomAij.fits', root_dir=self.base_dir, subdir=[self.data_dir , self.data_cel_dir] )
  return
end

function atomneb::get_data_dir
  if self.data_dir ne '' then data_dir=self.data_dir else print, 'Error: data_dir is not given'
  return, data_dir
end
;-------------
pro atomneb::set_base_dir, base_dir
  if base_dir ne '' then self.base_dir=base_dir else print, 'Error: base_dir is not given'
  self.Atom_Elj_file = filepath('AtomElj.fits', root_dir=self.base_dir, subdir=[self.data_dir , self.data_cel_dir] )
  self.Atom_Omij_file = filepath('AtomOmij.fits', root_dir=self.base_dir, subdir=[self.data_dir , self.data_cel_dir] )
  self.Atom_Aij_file = filepath('AtomAij.fits', root_dir=self.base_dir, subdir=[self.data_dir , self.data_cel_dir] )
  return
end

function atomneb::get_base_dir
  if self.base_dir ne '' then base_dir=self.base_dir else print, 'Error: base_dir is not given'
  return, base_dir
end
;-------------
pro atomneb::set_data_cel_dir, data_cel_dir
  if data_cel_dir ne '' then self.data_cel_dir=data_cel_dir else print, 'Error: data_cel_dir is not given'
  self.Atom_Elj_file = filepath('AtomElj.fits', root_dir=self.base_dir, subdir=[self.data_dir , self.data_cel_dir] )
  self.Atom_Omij_file = filepath('AtomOmij.fits', root_dir=self.base_dir, subdir=[self.data_dir , self.data_cel_dir] )
  self.Atom_Aij_file = filepath('AtomAij.fits', root_dir=self.base_dir, subdir=[self.data_dir , self.data_cel_dir] )
  return
end

function atomneb::get_data_cel_dir
  if self.data_cel_dir ne '' then data_cel_dir=self.data_cel_dir else print, 'Error: data_cel_dir is not given'
  return, data_cel_dir
end
;-------------
pro atomneb::set_data_cel, data_cel
  if data_cel ne '' then self.data_cel_dir=data_cel else print, 'Error: data_cel is not given'
  self.Atom_Elj_file = filepath('AtomElj.fits', root_dir=self.base_dir, subdir=[self.data_dir , self.data_cel_dir] )
  self.Atom_Omij_file = filepath('AtomOmij.fits', root_dir=self.base_dir, subdir=[self.data_dir , self.data_cel_dir] )
  self.Atom_Aij_file = filepath('AtomAij.fits', root_dir=self.base_dir, subdir=[self.data_dir , self.data_cel_dir] )
  return
end

function atomneb::get_data_cel
  if self.data_cel_dir ne '' then data_cel=self.data_cel_dir else print, 'Error: data_cel_dir is not given'
  return, data_cel
end
;-------------
pro atomneb::set_data_rc_dir, data_rc_dir
  if data_rc_dir ne '' then self.data_rc_dir=data_rc_dir else print, 'Error: data_rc_dir is not given'
  self.Atom_RC_Collection_file= filepath('rc_collection.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  self.Atom_RC_PFSD12_file= filepath('rc_he_ii_PFSD12.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  self.Atom_RC_N_III_FSL13_file= filepath('rc_n_iii_FSL13.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  self.Atom_RC_O_III_SSB17_file= filepath('rc_o_iii_SSB17.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  self.Atom_RC_PPB91_file= filepath('rc_PPB91.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  self.Atom_RC_SH95_file= filepath('rc_SH95.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  return
end

function atomneb::get_data_rc_dir
  if self.data_rc_dir ne '' then data_rc_dir=self.data_rc_dir else print, 'Error: data_rc_dir is not given'
  return, data_rc_dir
end
;-------------
pro atomneb::set_Atom_Elj_file, Atom_Elj_file
if Atom_Elj_file ne '' then self.Atom_Elj_file=Atom_Elj_file else print, 'Error: Atom_Elj_file is not given'
return
end

function atomneb::get_Atom_Elj_file
  if self.Atom_Elj_file ne '' then Atom_Elj_file=self.Atom_Elj_file else print, 'Error: Atom_Elj_file is not given'
  return, Atom_Elj_file
end
;-------------
pro atomneb::set_Atom_Omij_file, Atom_Omij_file
  if Atom_Omij_file ne '' then self.Atom_Omij_file=Atom_Omij_file else print, 'Error: Atom_Omij_file is not given'
  return
end

function atomneb::get_Atom_Omij_file
  if self.Atom_Omij_file ne '' then Atom_Omij_file=self.Atom_Omij_file else print, 'Error: Atom_Omij_file is not given'
  return, Atom_Omij_file
end
;-------------
pro atomneb::set_Atom_Aij_file, Atom_Aij_file
  if Atom_Aij_file ne '' then self.Atom_Aij_file=Atom_Aij_file else print, 'Error: Atom_Aij_file is not given'
  return
end

function atomneb::get_Atom_Aij_file
  if self.Atom_Aij_file ne '' then Atom_Aij_file=self.Atom_Aij_file else print, 'Error: Atom_Aij_file is not given'
  return, Atom_Aij_file
end
;-------------
pro atomneb::set_Atom_RC_Collection_file, Atom_RC_Collection_file
  if Atom_RC_Collection_file ne '' then self.Atom_RC_Collection_file=Atom_RC_Collection_file else print, 'Error: Atom_RC_Collection_file is not given'
  self.Atom_RC_Collection_file= filepath('rc_collection.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  return
end

function atomneb::get_Atom_RC_Collection_file
  if self.Atom_RC_Collection_file ne '' then Atom_RC_Collection_file=self.Atom_RC_Collection_file else print, 'Error: Atom_RC_Collection_file is not given'
  return, Atom_RC_Collection_file
end
;-------------
pro atomneb::set_Atom_RC_PPB91_file, Atom_RC_PPB91_file
  if Atom_RC_PPB91_file ne '' then self.Atom_RC_PPB91_file=Atom_RC_PPB91_file else print, 'Error: Atom_RC_PPB91_file is not given'
  self.Atom_RC_PPB91_file= filepath('rc_PPB91.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  return
end

function atomneb::get_Atom_RC_PPB91_file
  if self.Atom_RC_PPB91_file ne '' then Atom_RC_PPB91_file=self.Atom_RC_PPB91_file else print, 'Error: Atom_RC_PPB91_file is not given'
  return, Atom_RC_PPB91_file
end
;-------------
pro atomneb::set_Atom_RC_SH95_file, Atom_RC_SH95_file
  if Atom_RC_SH95_file ne '' then self.Atom_RC_SH95_file=Atom_RC_SH95_file else print, 'Error: Atom_RC_SH95_file is not given'
  self.Atom_RC_SH95_file= filepath('rc_SH95.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  return
end

function atomneb::get_Atom_RC_SH95_file
  if self.Atom_RC_SH95_file ne '' then Atom_RC_SH95_file=self.Atom_RC_SH95_file else print, 'Error: Atom_RC_SH95_file is not given'
  return, Atom_RC_SH95_file
end
;-------------
pro atomneb::set_Atom_RC_PFSD12_file, Atom_RC_PFSD12_file
  if Atom_RC_PFSD12_file ne '' then self.Atom_RC_PFSD12_file=Atom_RC_PFSD12_file else print, 'Error: Atom_RC_PFSD12_file is not given'
  self.Atom_RC_PFSD12_file= filepath('rc_he_ii_PFSD12.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  return
end

function atomneb::get_Atom_RC_PFSD12_file
  if self.Atom_RC_PFSD12_file ne '' then Atom_RC_PFSD12_file=self.Atom_RC_PFSD12_file else print, 'Error: Atom_RC_PFSD12_file is not given'
  return, Atom_RC_PFSD12_file
end
;-------------
pro atomneb::set_Atom_RC_N_III_FSL13_file, Atom_RC_N_III_FSL13_file
  if Atom_RC_N_III_FSL13_file ne '' then self.Atom_RC_N_III_FSL13_file=Atom_RC_N_III_FSL13_file else print, 'Error: Atom_RC_N_III_FSL13_file is not given'
  self.Atom_RC_N_III_FSL13_file= filepath('rc_n_iii_FSL13.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  return
end

function atomneb::get_Atom_RC_N_III_FSL13_file
  if self.Atom_RC_N_III_FSL13_file ne '' then Atom_RC_N_III_FSL13_file=self.Atom_RC_N_III_FSL13_file else print, 'Error: Atom_RC_N_III_FSL13_file is not given'
  return, Atom_RC_N_III_FSL13_file
end
;-------------
pro atomneb::set_Atom_RC_O_III_SSB17_file, Atom_RC_O_III_SSB17_file, full_data=full_data
  if Atom_RC_O_III_SSB17_file ne '' then self.Atom_RC_O_III_SSB17_file=Atom_RC_O_III_SSB17_file else print, 'Error: Atom_RC_O_III_SSB17_file is not given'
  if keyword_set(full_data) then begin
    self.Atom_RC_O_III_SSB17_file= filepath('rc_o_iii_SSB17.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  endif else begin
    self.Atom_RC_O_III_SSB17_file= filepath('rc_o_iii_SSB17_orl_case_b.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  endelse
  return
end

pro atomneb::set_Atom_RC_O_III_SSB17, full_data=full_data
  if keyword_set(full_data) then begin
    self.Atom_RC_O_III_SSB17_file= filepath('rc_o_iii_SSB17.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  endif else begin
    self.Atom_RC_O_III_SSB17_file= filepath('rc_o_iii_SSB17_orl_case_b.fits', root_dir=self.base_dir, subdir=[self.data_rc_dir] )
  endelse
  return
end

function atomneb::get_Atom_RC_O_III_SSB17_file
  if self.Atom_RC_O_III_SSB17_file ne '' then Atom_RC_O_III_SSB17_file=self.Atom_RC_O_III_SSB17_file else print, 'Error: Atom_RC_O_III_SSB17_file is not given'
  return, Atom_RC_O_III_SSB17_file
end
;------------------------------------------------------------------
pro atomneb__define
  void={atomneb, data_dir:'', base_dir:'', data_cel_dir:'', data_rc_dir:'', $
          Atom_Elj_file:'', Atom_Omij_file:'', Atom_Aij_file:'', $
          Atom_RC_Collection_file:'', Atom_RC_PFSD12_file:'', $
          Atom_RC_N_III_FSL13_file:'', Atom_RC_O_III_SSB17_file:'', $
          Atom_RC_PPB91_file:'', Atom_RC_SH95_file:'' }
  return 
end

