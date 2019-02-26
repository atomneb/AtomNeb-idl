; docformat = 'rst'

function atomneb_read_aeff_ppb91_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_read_aeff_ppb91_ut__define', /source)).path))
  data_rc_dir = ['atomic-data-rc']
  Atom_RC_file= filepath('rc_PPB91.fits', root_dir=base_dir, subdir=data_rc_dir )
  atom='c'
  ion='iii'
  cii_rc_data=atomneb_read_aeff_ppb91(Atom_RC_file, atom, ion)
  result= round(cii_rc_data[0].Wavelength)
  assert, result eq 9903, 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_read_aeff_ppb91_ut__define
  compile_opt strictarr
  
  define = { atomneb_read_aeff_ppb91_ut, inherits AtomNebUTTestCase}
end
