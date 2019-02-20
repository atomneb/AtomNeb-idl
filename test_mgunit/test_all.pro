; --- Begin $MAIN$ program. ---------------
; 
; 

mgunit, ['atomneb_get_aeff_collection_reference_citation_ut', $
        'atomneb_get_aeff_he_i_pfsd12_reference_citation_ut', $
        'atomneb_get_aeff_n_ii_fsl13_reference_citation_ut', $
        'atomneb_get_aeff_o_ii_ssb17_reference_citation_ut', $ ; unpack *.fits.tar.gz in atomic-data-rc
        'atomneb_get_aeff_ppb91_reference_citation_ut', $
        'atomneb_get_aeff_sh95_reference_citation_ut', $
        'atomneb_get_aij_reference_citation_ut',$
        'atomneb_get_elj_reference_citation_ut',$
        'atomneb_get_omij_reference_citation_ut',$
        'atomneb_list_aeff_collection_references_ut',$
        'atomneb_list_aeff_he_i_pfsd12_references_ut',$
        'atomneb_list_aeff_n_ii_fsl13_references_ut',$
        'atomneb_list_aeff_o_ii_ssb17_references_ut',$ ; unpack *.fits.tar.gz in atomic-data-rc
        'atomneb_list_aeff_ppb91_references_ut',$
        'atomneb_list_aeff_sh95_references_ut',$
        'atomneb_list_aij_references_ut',$
        'atomneb_list_omij_references_ut',$
        'atomneb_read_aeff_collection_ut',$
        'atomneb_read_aeff_he_i_pfsd12_ut',$
        'atomneb_read_aeff_n_ii_fsl13_ut',$
;        'atomneb_read_aeff_o_ii_ssb17_ut',$ ; very slow! ~30 sec!  unpack *.fits.tar.gz in atomic-data-rc
        'atomneb_read_aeff_ppb91_ut',$
        'atomneb_read_aeff_sh95_ut',$
        'atomneb_read_aij_ut',$
        'atomneb_read_elj_ut',$
        'atomneb_read_omij_ut',$
        'atomneb_search_aeff_collection_ut',$
        'atomneb_search_aeff_he_i_pfsd12_ut',$
        'atomneb_search_aeff_n_ii_fsl13_ut',$
        'atomneb_search_aeff_o_ii_ssb17_ut',$ ; unpack *.fits.tar.gz in atomic-data-rc
        'atomneb_search_aeff_ppb91_ut',$
        'atomneb_search_aeff_sh95_ut',$
        'atomneb_search_aij_ut',$
        'atomneb_search_omij_ut'], $
        filename='test-results.html', /html

; --- End $MAIN$ program. ---------------
exit
