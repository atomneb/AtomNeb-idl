; docformat = 'rst'

function atomneb_search_aeff_he_i_pfsd12_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_search_aeff_he_i_pfsd12_ut__define', /source)).path))
  data_rc_dir = ['atomic-data-rc']
  Atom_RC_file= filepath('rc_he_ii_PFSD12.fits', root_dir=base_dir, subdir=data_rc_dir )
  atom='he'
  ion='ii' ; He I
  list_hei_aeff_data=atomneb_search_aeff_he_i_pfsd12(Atom_RC_file, atom, ion)
  result= list_hei_aeff_data[0]
  assert, result eq 'he_ii_aeff_PFSD12', 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_search_aeff_he_i_pfsd12_ut__define
  compile_opt strictarr
  
  define = { atomneb_search_aeff_he_i_pfsd12_ut, inherits AtomNebUTTestCase}
end
