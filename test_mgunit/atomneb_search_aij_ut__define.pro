; docformat = 'rst'

function atomneb_search_aij_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_search_aij_ut__define', /source)).path))
  data_dir = ['atomic-data', 'collection']
  Atom_Aij_file = filepath('AtomAij.fits', root_dir=base_dir, subdir=data_dir )
  atom='o'
  ion='iii'
  list_oiii_aij_data=atomneb_search_aij(Atom_Aij_file, atom, ion)
  result= list_oiii_aij_data[0]
  assert, result eq 'o_iii_aij_FFT04-SZ00', 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_search_aij_ut__define
  compile_opt strictarr
  
  define = { atomneb_search_aij_ut, inherits MGutLibTestCase }
end
