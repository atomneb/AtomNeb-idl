; docformat = 'rst'

function atomneb_read_aeff_n_ii_fsl13_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_read_aeff_n_ii_fsl13_ut__define', /source)).path))
  data_rc_dir = ['atomic-data-rc']
  Atom_RC_file= filepath('rc_n_iii_FSL13.fits', root_dir=base_dir, subdir=data_rc_dir )
  atom='n'
  ion='iii' ; N II
  wavelength_range=[4400.0, 7100.0] 
  nii_rc_data=atomneb_read_aeff_n_ii_fsl13(Atom_RC_file, atom, ion, wavelength_range)
  nii_rc_data_wave=atomneb_read_aeff_n_ii_fsl13(Atom_RC_file, atom, ion, wavelength_range, /wavelength)
  result= nii_rc_data[0].Aeff[0]
  assert, result eq 255.000, 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_read_aeff_n_ii_fsl13_ut__define
  compile_opt strictarr
  
  define = { atomneb_read_aeff_n_ii_fsl13_ut, inherits MGutLibTestCase }
end
