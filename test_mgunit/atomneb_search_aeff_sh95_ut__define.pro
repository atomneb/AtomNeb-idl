; docformat = 'rst'

function atomneb_search_aeff_sh95_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_search_aeff_sh95_ut__define', /source)).path))
  data_rc_dir = ['atomic-data-rc']
  Atom_RC_file= filepath('rc_SH95.fits', root_dir=base_dir, subdir=data_rc_dir )
  atom='h'
  ion='ii' ; H I
  list_hi_aeff_data=atomneb_search_aeff_sh95(Atom_RC_file, atom, ion)
  result= list_hi_aeff_data[0]
  assert, result eq 'h_ii_aeff_a', 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_search_aeff_sh95_ut__define
  compile_opt strictarr
  
  define = { atomneb_search_aeff_sh95_ut, inherits MGutLibTestCase }
end
