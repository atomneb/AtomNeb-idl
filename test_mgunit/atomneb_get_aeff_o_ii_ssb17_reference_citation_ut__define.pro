; docformat = 'rst'

function atomneb_get_aeff_o_ii_ssb17_reference_citation_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_get_aeff_o_ii_ssb17_reference_citation_ut__define', /source)).path))
  data_rc_dir = ['atomic-data-rc']
  Atom_RC_file= filepath('rc_o_iii_SSB17.fits', root_dir=base_dir, subdir=data_rc_dir )
  atom='o'
  ion='iii' ; O II
  reference='SSB17'
  citation=atomneb_get_aeff_o_ii_ssb17_reference_citation(Atom_RC_file, atom, ion)
  temp=STRSPLIT(citation, ',', /EXTRACT)
  result= temp[0]
  assert, result eq 'Storey', 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_get_aeff_o_ii_ssb17_reference_citation_ut__define
  compile_opt strictarr
  
  define = { atomneb_get_aeff_o_ii_ssb17_reference_citation_ut, inherits AtomNebUTTestCase}
end
