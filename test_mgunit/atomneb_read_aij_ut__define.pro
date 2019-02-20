; docformat = 'rst'

function atomneb_read_aij_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_read_aij_ut__define', /source)).path))
  data_dir = ['atomic-data', 'collection']
  Atom_Aij_file = filepath('AtomAij.fits', root_dir=base_dir, subdir=data_dir )
  atom='o'
  ion='iii'
  reference='FFT04'
  oiii_aij_data=atomneb_read_aij(Atom_Aij_file, atom, ion, reference=reference)
  result= round(oiii_aij_data.Aij[1,0]*1e8)
  assert, result eq 2596, 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_read_aij_ut__define
  compile_opt strictarr
  
  define = { atomneb_read_aij_ut, inherits MGutLibTestCase }
end
