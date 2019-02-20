; docformat = 'rst'

function atomneb_read_aeff_he_i_pfsd12_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_read_aeff_he_i_pfsd12_ut__define', /source)).path))
  data_rc_dir = ['atomic-data-rc']
  Atom_RC_file= filepath('rc_he_ii_PFSD12.fits', root_dir=base_dir, subdir=data_rc_dir )
  atom='he'
  ion='ii' ; He I
  hei_rc_data=atomneb_read_aeff_he_i_pfsd12(Atom_RC_file, atom, ion)
  hei_rc_data_wave=atomneb_read_aeff_he_i_pfsd12(Atom_RC_file, atom, ion, /wavelength)
  result= hei_rc_data[0].Aeff[0]
  assert, result eq 5000.0000, 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_read_aeff_he_i_pfsd12_ut__define
  compile_opt strictarr
  
  define = { atomneb_read_aeff_he_i_pfsd12_ut, inherits MGutLibTestCase }
end
