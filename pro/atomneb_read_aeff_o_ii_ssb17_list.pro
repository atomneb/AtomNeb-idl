; docformat = 'rst'

function atomneb_read_aeff_o_ii_ssb17_list, Atom_RC_file
;+
;     This function returns the list of effective recombination coefficients (Aeff) from the 1st binary table extension
;     of the FITS data file ('rc_o_iii_SSB17.fits')
;
; :Private:
;
; :Returns:
;    type=an array of data. This function returns the aeff_data_list: 
;          {Aeff_Data:'',  Extention:0, $
;           IND:long(0), Wavelength: float(0.0), $
;           Case1:'',  lower_term: '', upper_term: ''}
;
; :Params:
;     Atom_RC_file  : in, required, type=string
;                     the FITS data file name ('rc_o_iii_SSB17.fits')
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
;     03/07/2017, IDL code by A. Danehkar
;-
  element_template={Aeff_Data:'',  Extention:0, $
              IND:long(0), Wavelength: float(0.0), Case1: '', lower_term:'', upper_term:''}
                                  
  ftab_ext,Atom_RC_file,[1,2,3,4,5,6,7],Aeff_Data,Extention,IND,Wavelength,Case1,lower_term,upper_term,EXTEN_NO =1
  temp=size(Aeff_Data,/DIMENSIONS)
  element_length=temp[0]
  
  element_data=replicate(element_template, element_length)
  for i=0, element_length-1 do begin 
     element_data[i].Aeff_Data=strtrim(Aeff_Data[i],2)
     element_data[i].Extention=Extention[i]
     element_data[i].IND=IND[i]
     element_data[i].Wavelength=Wavelength[i]
     element_data[i].Case1=strtrim(Case1[i],2)
     element_data[i].lower_term=strtrim(lower_term[i],2)
     element_data[i].upper_term=strtrim(upper_term[i],2)
  endfor
  return, element_data
end

