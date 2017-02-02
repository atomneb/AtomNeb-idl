function atomneb_read_aeff_ppb91, Atom_RC_file, atom, ion, reference=reference
;+
; NAME:
;     atomneb_read_aeff_ppb91
; PURPOSE:
;     read the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file (./rc_PPB91.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     atom='c'
;     ion='iii'
;     cii_aeff_data=atomneb_read_aeff_ppb91(Atom_RC_file, atom, ion)
;     for i=0,n_line-1 do print,cii_aeff_data[i].Ion,cii_aeff_data[i].Case1, $
;                          cii_aeff_data[i].Wavelength, cii_aeff_data[i].a, $
;                          cii_aeff_data[i].b, cii_aeff_data[i].c, $
;                          cii_aeff_data[i].d, cii_aeff_data[i].br, $
;                          cii_aeff_data[i].Q, cii_aeff_data[i].y
;
; INPUTS:
;     fits_file - the MGFIT line data (./rc_PPB91.fits)
;     atom - atom name e.g. 'o'
;     ion - ionic level e.g 'iii'
;     reference - reference, not necessary
; RETURN:  aeff_data
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
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 15/01/2017
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

  Extention=element_data_list[ii].Extention
 
  ftab_ext,Atom_RC_file,[1,2,3,4,5,6,7,8,9,10],Ion,Case1,Wavelength,a,b,c,d,br,Q,y,EXTEN_NO =Extention
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
