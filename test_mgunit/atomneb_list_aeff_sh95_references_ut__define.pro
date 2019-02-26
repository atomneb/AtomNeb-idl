; docformat = 'rst'

function atomneb_list_aeff_sh95_references_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_list_aeff_sh95_references_ut__define', /source)).path))
  data_rc_dir = ['atomic-data-rc']
  Atom_RC_file= filepath('rc_SH95.fits', root_dir=base_dir, subdir=data_rc_dir )
  atom='h'
  ion='ii' ; H I
  list_hi_aeff_reference=atomneb_list_aeff_sh95_references(Atom_RC_file, atom, ion)
  result= list_hi_aeff_reference[0]
  assert, result eq '', 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_list_aeff_sh95_references_ut__define
  compile_opt strictarr
  
  define = { atomneb_list_aeff_sh95_references_ut, inherits AtomNebUTTestCase}
end
