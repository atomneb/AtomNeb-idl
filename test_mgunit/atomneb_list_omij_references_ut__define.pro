; docformat = 'rst'

function atomneb_list_omij_references_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_list_omij_references_ut__define', /source)).path))
  data_dir = ['atomic-data', 'collection']
  Atom_Omij_file = filepath('AtomOmij.fits', root_dir=base_dir, subdir=data_dir )
  atom='o'
  ion='iii'
  list_oiii_omij_reference=atomneb_list_omij_references(Atom_Omij_file, atom, ion)
  result= list_oiii_omij_reference[0]
  assert, result eq 'AK99', 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_list_omij_references_ut__define
  compile_opt strictarr
  
  define = { atomneb_list_omij_references_ut, inherits AtomNebUTTestCase}
end
