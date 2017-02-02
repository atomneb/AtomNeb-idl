function atomneb_read_aeff_collection, Atom_RC_file, atom, ion, br=br, reference=reference
;+
; NAME:
;     atomneb_read_aeff_collection
; PURPOSE:
;     read the effective recombination coefficients (Aeff) from the table extensions
;     of the FITS data file (./rc_collection.fits)
; EXPLANATION:
;
; CALLING SEQUENCE:
;     atom='c'
;     ion='iii'
;     ciii_aeff_data=atomneb_read_aeff_collection(Atom_RC_file, atom, ion)
;     for i=0,n_line-1 do print,rc_data[i].Wavelength, $
;                               rc_data[i].a, $
;                               rc_data[i].b, $
;                               rc_data[i].c, $
;                               rc_data[i].d, $
;                               rc_data[i].f
;
; INPUTS:
;     fits_file - the MGFIT line data (./rc_collection.fits)
;     atom - atom name e.g. 'c'
;     ion - ionic level e.g 'iii'
;     reference - reference, not necessary
; RETURN:  aeff_data (c_iii_aeff)
;          { Wavelength:0.0, 
;            a: 0.0, 
;            b: 0.0, 
;            c: 0.0, 
;            d: 0.0, 
;            f: 0.0}
;            
; RETURN:  aeff_data (n_iii_aeff)
;          { a: 0.0, 
;            b: 0.0, 
;            c: 0.0}
;            
; RETURN:  aeff_data (n_iii_br)
;          {Wavelength: 0.0, 
;           BR: 0.0, $
;           g1:0, 
;           g2:0, 
;           Mult1:'', 
;           LowerTerm:'', 
;           UpperTerm:'' } 
;           
; RETURN:  aeff_data (o_iii_aeff)
;          {Term: '', 
;           Case1: '', 
;           a2: 0.0, 
;           a4: 0.0, 
;           a5: 0.0, 
;           a6: 0.0, 
;           b: 0.0, 
;           c: 0.0, 
;           d: 0.0}
;           
; RETURN:  aeff_data (o_iii_br)
;          {Wavelength:double(0.0), 
;           Br_A: 0.0, 
;           Br_B: 0.0, 
;           Br_C: 0.0, 
;           g1: 0, 
;           g2: 0, 
;           Mult1: '', 
;           LowerTerm: '', 
;           UpperTerm: ''}
;            
; RETURN:  aeff_data (ne_iii_aeff)
;          { Wavelength:0.0, 
;            a: 0.0, 
;            b: 0.0, 
;            c: 0.0, 
;            d: 0.0, 
;            f: 0.0,
;            br: 0.0}
;
; REQUIRED EXTERNAL LIBRARY:
;     ftab_ext from IDL Astronomy User's library (../externals/astron/pro)
;
; REVISION HISTORY:
;     IDL code by A. Danehkar, 15/01/2017
;-  
  element_data_list=atomneb_read_aeff_collection_list(Atom_RC_file)

  if keyword_set(br) eq 1 then prefix='_br' else prefix='_aeff'
  if keyword_set(reference) eq 1 then begin
    atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+prefix+'_'+strupcase(reference)
    ii=where(element_data_list.Aeff_Data eq atom_ion_name);
    if ii eq -1 then begin
      print, 'could not find the given element or ion'
      exit
    endif
  endif else begin
    atom_ion_name=strlowcase(atom)+'_'+strlowcase(ion)+prefix+'*'
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
   'c_iii_aeff': begin
        ftab_ext,Atom_RC_file,[1,2,3,4,5,6],Wavelength,a,b,c,d,f,EXTEN_NO =Extention
        rc_template={Wavelength: double(0.0), a: double(0.0), b:double(0.0), c: double(0.0), d:double(0.0), f:double(0.0)}
        
        temp=size(Wavelength,/DIMENSIONS)
        n_line=temp[0]
        
        rc_data=replicate(rc_template, n_line)
        ;for i=0, n_line-1 do begin 
        rc_data[*].Wavelength=Wavelength[*]
        rc_data[*].a=a[*]
        rc_data[*].b=b[*]
        rc_data[*].c=c[*]
        rc_data[*].d=d[*]
        rc_data[*].f=f[*]
      end
   'n_iii_aeff': begin
        ftab_ext,Atom_RC_file,[1,2,3],a,b,c,EXTEN_NO =Extention
        rc_template={a:double(0.0), b:double(0.0), c:double(0.0)}  
        
        temp=size(a,/DIMENSIONS)
        n_line=temp[0]
        
        rc_data=replicate(rc_template, n_line)
        ;for i=0, n_line-1 do begin 
        rc_data[*].a=a[*]
        rc_data[*].b=b[*]
        rc_data[*].c=c[*]
      end
   'n_iii_br': begin
        ftab_ext,Atom_RC_file,[1,2,3,4,5,6,7],Wavelength,br,g1,g2,Mult1,LowerTerm,UpperTerm,EXTEN_NO =Extention
        rc_template={Wavelength:double(0.0), BR:double(0.0), $
              g1:long(0), g2:long(0), $ ;INTEGER
              Mult1:'', LowerTerm:'', UpperTerm:'' $ ;CHARACTER*9
              } 
              
        temp=size(Wavelength,/DIMENSIONS)
        n_line=temp[0]
        
        rc_data=replicate(rc_template, n_line)
        ;for i=0, n_line-1 do begin 
        rc_data[*].Wavelength=Wavelength[*]
        rc_data[*].br=br[*]
        rc_data[*].g1=g1[*]
        rc_data[*].g2=g2[*]
        rc_data[*].Mult1=Mult1[*]
        rc_data[*].LowerTerm=LowerTerm[*]
        rc_data[*].UpperTerm=UpperTerm[*]
      end
   'o_iii_aeff': begin
        ftab_ext,Atom_RC_file,[1,2,3,4,5,6,7,8,9],Term,Case1,a2,a4,a5,a6,b,c,d,EXTEN_NO =Extention
        rc_template={Term:'', Case1: '', a2:double(0.0), a4:double(0.0), a5:double(0.0), a6:double(0.0), b:double(0.0), c:double(0.0), d:double(0.0)}  
        
        temp=size(a2,/DIMENSIONS)
        n_line=temp[0]
        
        rc_data=replicate(rc_template, n_line)
        ;for i=0, n_line-1 do begin 
        rc_data[*].Term=Term[*]
        rc_data[*].Case1=Case1[*]
        rc_data[*].a2=a2[*]
        rc_data[*].a4=a4[*]
        rc_data[*].a5=a5[*]
        rc_data[*].a6=a6[*]
        rc_data[*].b=b[*]
        rc_data[*].c=c[*]
        rc_data[*].d=d[*]
      end
   'o_iii_br': begin
        ftab_ext,Atom_RC_file,[1,2,3,4,5,6,7,8,9], Wavelength,Br_A,Br_B,Br_C,g1,g2,Mult1,LowerTerm,UpperTerm,EXTEN_NO =Extention
        rc_template={Wavelength:double(0.0), Br_A:double(0.0), Br_B:double(0.0), Br_C:double(0.0), $
              g1:long(0), g2:long(0), Mult1:'', LowerTerm:'', UpperTerm:'' } 
          
        temp=size(Br_A,/DIMENSIONS)
        n_line=temp[0]
        
        rc_data=replicate(rc_template, n_line)
        ;for i=0, n_line-1 do begin 
        rc_data[*].Wavelength=Wavelength[*]
        rc_data[*].Br_A=Br_A[*]
        rc_data[*].Br_B=Br_B[*]
        rc_data[*].Br_C=Br_C[*]
        rc_data[*].g1=g1[*]
        rc_data[*].g2=g2[*]
        rc_data[*].Mult1=Mult1[*]
        rc_data[*].LowerTerm=LowerTerm[*]
        rc_data[*].UpperTerm=UpperTerm[*]
        
      end
   'ne_iii_aeff': begin
        ftab_ext,Atom_RC_file,[1,2,3,4,5,6,7],Wavelength,a,b,c,d,f,br,EXTEN_NO =Extention
        rc_template={Wavelength: double(0.0), a: double(0.0), b:double(0.0), c: double(0.0), d:double(0.0), f:double(0.0), br:double(0.0)}
        
        temp=size(Wavelength,/DIMENSIONS)
        n_line=temp[0]
        
        rc_data=replicate(rc_template, n_line)
        ;for i=0, n_line-1 do begin 
        rc_data[*].Wavelength=Wavelength[*]
        rc_data[*].a=a[*]
        rc_data[*].b=b[*]
        rc_data[*].c=c[*]
        rc_data[*].d=d[*]
        rc_data[*].f=f[*]
        rc_data[*].br=br[*]
      end
  endcase
  ;endfor
  return, rc_data
end
