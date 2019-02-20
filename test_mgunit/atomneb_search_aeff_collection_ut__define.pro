; docformat = 'rst'

function atomneb_search_aeff_collection_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_search_aeff_collection_ut__define', /source)).path))
  data_rc_dir = ['atomic-data-rc']
  Atom_RC_file= filepath('rc_collection.fits', root_dir=base_dir, subdir=data_rc_dir )
  atom='c'
  ion='iii' ; C III
  list_cii_aeff_data=atomneb_search_aeff_collection(Atom_RC_file, atom, ion)
  result= list_cii_aeff_data[0]
  assert, result eq 'c_iii_aeff', 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_search_aeff_collection_ut__define
  compile_opt strictarr
  
  define = { atomneb_search_aeff_collection_ut, inherits MGutLibTestCase }
end
