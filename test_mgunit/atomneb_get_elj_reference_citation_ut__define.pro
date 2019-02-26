; docformat = 'rst'

function atomneb_get_elj_reference_citation_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_get_elj_reference_citation_ut__define', /source)).path))
  data_dir = ['atomic-data', 'collection']
  Atom_Elj_file = filepath('AtomElj.fits', root_dir=base_dir, subdir=data_dir )
  reference='L7288'
  citation=atomneb_get_elj_reference_citation(Atom_Elj_file, reference)
  temp=STRSPLIT(citation, ',', /EXTRACT)
  result= temp[0]
  assert, result eq 'C. E. Moore', 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_get_elj_reference_citation_ut__define
  compile_opt strictarr
  
  define = { atomneb_get_elj_reference_citation_ut, inherits AtomNebUTTestCase}
end
