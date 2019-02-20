; docformat = 'rst'

function atomneb_search_aeff_n_ii_fsl13_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_search_aeff_n_ii_fsl13_ut__define', /source)).path))
  data_rc_dir = ['atomic-data-rc']
  Atom_RC_file= filepath('rc_n_iii_FSL13.fits', root_dir=base_dir, subdir=data_rc_dir )
  atom='n'
  ion='iii' ; N II
  wavelength=5679.56
  list_nii_aeff_data=atomneb_search_aeff_n_ii_fsl13(Atom_RC_file, atom, ion, wavelength)
  result= round(list_nii_aeff_data.Aeff[0,0])
  assert, result eq 7810, 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_search_aeff_n_ii_fsl13_ut__define
  compile_opt strictarr
  
  define = { atomneb_search_aeff_n_ii_fsl13_ut, inherits MGutLibTestCase }
end
