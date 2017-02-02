function atomneb_read_aeff_he_i_pfsd12, Atom_RC_file, atom, ion, wavelength=wavelength, reference=reference
;+
; NAME:
;     atomneb_read_aeff_he_i_pfsd12
; PURPOSE:
;     read the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file (./rc_he_ii_PFSD12.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     atom='he'
;     ion='ii'
;     hei_aeff_data=atomneb_read_aeff_he_i_pfsd12(Atom_RC_file, atom, ion)
;     print,hei_aeff_data[0].Aeff
;
; INPUTS:
;     fits_file - the MGFIT line data (./rc_he_ii_PFSD12.fits)
;     atom - atom name e.g. 'he'
;     ion - ionic level e.g 'ii'
;     reference - reference, not necessary
; RETURN:  aeff_data: array
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 15/01/2017
;-  
  element_data_list=atomneb_read_aeff_he_i_pfsd12_list(Atom_RC_file)
  if keyword_set(wavelength) eq 1 then prefix='_wavelength' else prefix='_aeff
  if keyword_set(reference) eq 1 then begin
    atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+prefix+'_'+strupcase(reference)
    ii=where(element_data_list.Aeff_Data eq atom_ion_name);
    if ii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
  endif else begin
    reference='PFSD13'
    if keyword_set(wavelength) eq 1 then begin
      atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+prefix
    endif else begin
      atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+prefix+'_'+strupcase(reference)
    endelse
    iii=where(strmatch(element_data_list.Aeff_Data, atom_ion_name, /FOLD_CASE) eq 1)
    if iii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
    ii=min(iii)
  endelse

  Extention=element_data_list[ii].Extention
 
  atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+prefix
  case atom_ion_name of
     'he_ii_aeff': begin
        fits_read,Atom_RC_file,rc_aeff,header1,EXTEN_NO =Extention 
        temp=size(rc_aeff,/DIMENSIONS)
        col1=temp[0]
        row1=temp[1]
        aeff_template={Aeff:dblarr(col1,row1)}
        rc_data=replicate(aeff_template, 1)
        rc_data.Aeff[*,*]=rc_aeff[*,*]
      end
    'he_ii_wavelength': begin
        ftab_ext,Atom_RC_file,[1,2,3],Wavelength,LowerTerm,UpperTerm,EXTEN_NO =Extention
        rc_template={Wavelength: double(0.0), LowerTerm:'', UpperTerm:''}
        
        temp=size(Wavelength,/DIMENSIONS)
        n_line=temp[0]
        
        rc_data=replicate(rc_template, n_line)
        
        rc_data[*].Wavelength=Wavelength[*]
        rc_data[*].LowerTerm=LowerTerm[*]
        rc_data[*].UpperTerm=UpperTerm[*]
      end
  endcase
  return, rc_data
end
