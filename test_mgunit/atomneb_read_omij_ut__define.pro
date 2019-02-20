; docformat = 'rst'

function atomneb_read_omij_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_read_omij_ut__define', /source)).path))
  data_dir = ['atomic-data', 'collection']
  Atom_Omij_file = filepath('AtomOmij.fits', root_dir=base_dir, subdir=data_dir )
  atom='o'
  ion='iii'
  reference='SSB14'
  oiii_omij_data=atomneb_read_omij(Atom_Omij_file, atom, ion, reference=reference)
  result= round(oiii_omij_data[0].strength[2])
  assert, result eq 158, 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_read_omij_ut__define
  compile_opt strictarr
  
  define = { atomneb_read_omij_ut, inherits MGutLibTestCase }
end
