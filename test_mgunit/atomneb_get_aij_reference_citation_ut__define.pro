; docformat = 'rst'

function atomneb_get_aij_reference_citation_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_get_aij_reference_citation_ut__define', /source)).path))
  data_dir = ['atomic-data', 'collection']
  Atom_Aij_file = filepath('AtomAij.fits', root_dir=base_dir, subdir=data_dir )
  atom='o'
  ion='iii'
  reference='FFT04'
  citation=atomneb_get_aij_reference_citation(Atom_Aij_file, atom, ion, reference)
  temp=STRSPLIT(citation, ' ', /EXTRACT)
  result= temp[0]
  assert, result eq 'Froese', 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_get_aij_reference_citation_ut__define
  compile_opt strictarr
  
  define = { atomneb_get_aij_reference_citation_ut, inherits MGutLibTestCase }
end
