orig_quiet = !quiet
!quiet = 1
@atomneb__compile_all
!quiet = orig_quiet

profiler
profiler, /system

; You need to have IDLdoc (https://github.com/mgalloy/idldoc)
idldoc, root='pro/', output='docs/doc/', $
  title='API Documentation for AtomNeb-idl', $
  subtitle='IDL Library for Atomic Data of Ionized Nebulae', index_level=1, /nosource, $
  overview='docs/overview', footer='docs/footer', /embed, $
  format_style='rst', markup_style='rst'

exit
