; docformat = 'rst'

function atomneb_read_aeff_o_ii_ssb17_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_read_aeff_o_ii_ssb17_ut__define', /source)).path))
  data_rc_dir = ['atomic-data-rc']
  Atom_RC_file= filepath('rc_o_iii_SSB17.fits', root_dir=base_dir, subdir=data_rc_dir )
  atom='o'
  ion='iii' ; O II
  case1='B'
  wavelength_range=[5320.0, 5330.0] 
  oii_rc_data=atomneb_read_aeff_o_ii_ssb17(Atom_RC_file, atom, ion, case1, wavelength_range)
  oii_rc_data_wave=atomneb_read_aeff_o_ii_ssb17(Atom_RC_file, atom, ion, case1, wavelength_range, /wavelength)
  result= round(oii_rc_data[0].Aeff[0]*1.e+32)
  assert, result eq 164, 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_read_aeff_o_ii_ssb17_ut__define
  compile_opt strictarr
  
  define = { atomneb_read_aeff_o_ii_ssb17_ut, inherits AtomNebUTTestCase}
end
