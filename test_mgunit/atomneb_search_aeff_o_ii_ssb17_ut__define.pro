; docformat = 'rst'

function atomneb_search_aeff_o_ii_ssb17_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_search_aeff_o_ii_ssb17_ut__define', /source)).path))
  data_rc_dir = ['atomic-data-rc']
  Atom_RC_file= filepath('rc_o_iii_SSB17.fits', root_dir=base_dir, subdir=data_rc_dir )
  atom='o'
  ion='iii' ; O II
  case1='B'
  wavelength=5325.42
  list_oii_aeff_data=atomneb_search_aeff_o_ii_ssb17(Atom_RC_file, atom, ion, case1, wavelength)
  result= round(list_oii_aeff_data.Aeff[0]*1e33)
  assert, result eq 34, 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_search_aeff_o_ii_ssb17_ut__define
  compile_opt strictarr
  
  define = { atomneb_search_aeff_o_ii_ssb17_ut, inherits AtomNebUTTestCase}
end
