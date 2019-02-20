; docformat = 'rst'

function atomneb_get_aeff_he_i_pfsd12_reference_citation_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_get_aeff_he_i_pfsd12_reference_citation_ut__define', /source)).path))
  data_rc_dir = ['atomic-data-rc']
  Atom_RC_file= filepath('rc_he_ii_PFSD12.fits', root_dir=base_dir, subdir=data_rc_dir )
  atom='he'
  ion='ii' ; He I
  reference='PFSD13'
  citation=atomneb_get_aeff_he_i_pfsd12_reference_citation(Atom_RC_file, atom, ion, reference=reference)
  temp=STRSPLIT(citation, ',', /EXTRACT)
  result= temp[0]
  assert, result eq 'Porter', 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_get_aeff_he_i_pfsd12_reference_citation_ut__define
  compile_opt strictarr
  
  define = { atomneb_get_aeff_he_i_pfsd12_reference_citation_ut, inherits MGutLibTestCase }
end
