; docformat = 'rst'

function atomneb_read_aeff_ppb91, Atom_RC_file, atom, ion, reference=reference
;+
;     This function returns the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file ('rc_PPB91.fits').
;
; :Returns:
;    type=an array of data. This function returns the effective recombination coefficients:
;          { Ion: ' '
;            Case1:''
;            Wavelength:0.0, 
;            a: 0.0, 
;            b: 0.0, 
;            c: 0.0, 
;            d: 0.0, 
;            br: 0.0, 
;            y: 0.0}
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_PPB91.fits')
;     atom          : in, required, type=string
;                     atom name e.g. 'c'
;     ion           : in, required, type=string
;                     ionic level e.g 'iii'  
;
; :Keywords:
;     reference     : in, type=string
;                     set for the reference,  not necessary
;
; :Examples:
;    For example::
;
;     IDL> base_dir = file_dirname(file_dirname((routine_info('$MAIN$', /source)).path))
;     IDL> data_rc_dir = ['atomic-data-rc']
;     IDL> Atom_RC_file= filepath('rc_PPB91.fits', root_dir=base_dir, subdir=data_dir )
;     IDL> atom='c'
;     IDL> ion='iii' ; C II
;     IDL> cii_rc_data=atomneb_read_aeff_ppb91(Atom_RC_file, atom, ion)
;     IDL> temp=size(cii_rc_data.Wavelength,/DIMENSIONS)
;     IDL> n_line=temp[0]
;     IDL> for i=0,n_line-1 do print,cii_rc_data[i].Ion,cii_rc_data[i].Case1, $
;     IDL>                           cii_rc_data[i].Wavelength, cii_rc_data[i].a, $
;     IDL>                           cii_rc_data[i].b, cii_rc_data[i].c, $
;     IDL>                           cii_rc_data[i].d, cii_rc_data[i].br, $
;     IDL>                           cii_rc_data[i].Q, cii_rc_data[i].y
;        C2+A       9903.4600      0.69700000     -0.78400000      ...
;        C2+A       4267.1500       1.0110000     -0.75400000      ...
;        ...
;
; :Categories:
;   Recombination Lines
;
; :Dirs:
;  ./
;      Main routines
;
; :Author:
;   Ashkbiz Danehkar
;
; :Copyright:
;   This library is released under a GNU General Public License.
;
; :Version:
;   0.2.0
;
; :History:
;     15/01/2017, IDL code by A. Danehkar
;-
  element_data_list=atomneb_read_aeff_ppb91_list(Atom_RC_file)
  if keyword_set(reference) eq 1 then begin
    atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_aeff_'+strupcase(reference)
    ii=where(element_data_list.Aeff_Data eq atom_ion_name);
    if ii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
  endif else begin
    atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+'_aeff*'
    iii=where(strmatch(element_data_list.Aeff_Data, atom_ion_name, /FOLD_CASE) eq 1)
    if iii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
    ii=min(iii)
  endelse

  Extension=element_data_list[ii].Extension
 
  ftab_ext,Atom_RC_file,[1,2,3,4,5,6,7,8,9,10],Ion,Case1,Wavelength,a,b,c,d,br,Q,y,EXTEN_NO =Extension
  rc_template={Ion:'', Case1: '', Wavelength: double(0.0), a: double(0.0), b:double(0.0), c: double(0.0), d:double(0.0), br:double(0.0), Q:'', Y:double(0.0)}
  
  temp=size(Wavelength,/DIMENSIONS)
  n_line=temp[0]
  
  rc_data=replicate(rc_template, n_line)
  ;for i=0, n_line-1 do begin
  rc_data[*].Ion=Ion[*]
  rc_data[*].Case1=Case1[*] 
  rc_data[*].Wavelength=Wavelength[*]
  rc_data[*].a=a[*]
  rc_data[*].b=b[*]
  rc_data[*].c=c[*]
  rc_data[*].d=d[*]
  rc_data[*].br=br[*]
  rc_data[*].y=y[*]
  ;endfor
  return, rc_data
end
