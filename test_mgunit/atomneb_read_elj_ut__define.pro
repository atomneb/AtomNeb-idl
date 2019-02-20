; docformat = 'rst'

function atomneb_read_elj_ut::test_basic
  compile_opt strictarr
  
  base_dir = file_dirname(file_dirname((routine_info('atomneb_read_elj_ut__define', /source)).path))
  data_dir = ['atomic-data', 'collection']
  Atom_Elj_file = filepath('AtomElj.fits', root_dir=base_dir, subdir=data_dir )
  atom='o'
  ion='iii
  oiii_elj_data=atomneb_read_elj(Atom_Elj_file, atom, ion, level_num=6)
  result= round(oiii_elj_data[1].Ej)
  assert, result eq 113, 'incorrect result: %d', result
  
  return, 1
end

pro atomneb_read_elj_ut__define
  compile_opt strictarr
  
  define = { atomneb_read_elj_ut, inherits MGutLibTestCase }
end
