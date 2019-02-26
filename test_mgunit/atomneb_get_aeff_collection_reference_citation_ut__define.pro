; docformat = 'rst'

function atomneb_get_aeff_collection_reference_citation_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_get_aeff_collection_reference_citation_ut__define', /source)).path))
  data_rc_dir = ['atomic-data-rc']
  Atom_RC_file= filepath('rc_collection.fits', root_dir=base_dir, subdir=data_rc_dir )
  atom='c'
  ion='iii' ; C III
  citation=atomneb_get_aeff_collection_reference_citation(Atom_RC_file, atom, ion)
  temp=STRSPLIT(citation, ',', /EXTRACT)
  result= temp[0]
  assert, result eq 'Davey', 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_get_aeff_collection_reference_citation_ut__define
  compile_opt strictarr
  
  define = { atomneb_get_aeff_collection_reference_citation_ut, inherits AtomNebUTTestCase}
end
