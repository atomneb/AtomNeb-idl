---
title: 'AtomNeb: IDL Library for Atomic Data of Ionized Nebulae'
tags:
  - astrophysics
  - atomic data
  - gaseous nebulae
  - spectral analysis
  - IDL
  - GDL
authors:
  - name: Ashkbiz Danehkar
    orcid: 0000-0003-4552-5997
    affiliation: "1, 2, 3"
affiliations:
 - name: Department of Physics and Astronomy, Macquarie University, Sydney, NSW 2109, Australia
   index: 1
 - name: Harvard-Smithsonian Center for Astrophysics, 60 Garden Street, Cambridge, MA 02138, USA 
   index: 2
 - name: Department of Astronomy, University of Michigan, Ann Arbor, MI 48109, USA 
   index: 3
date: 30 June 2018
bibliography: paper.bib
---

# Summary

An ionized gaseous nebula can be used as an astrophysical tool to trace of the chemical 
composition of the interstellar medium in the Milky Way and other galaxies, 
and to understand stellar mixing processes. Temperatures, densities, and ionic 
abundances can be determined from _collisionally excited lines_ (CEL) by solving statistical 
equilibrium equations using collision strengths and transition probabilities of ions. 
Moreover, physical conditions and ionic abundances can be calculated from 
_recombination lines_ (RL) using recombination coefficients of ions. Hence, the 
atomic data for collisional excitation and recombination process are 
necessary to determine physical conditions and elemental abundances of ionized 
nebulae from collisionally excited lines and recombination 
lines (see e.g. @Danehkar:2013; @Danehkar:2014; @Danehkar:2014b; @Danehkar:2016; @Danehkar:2018a).
Additionally, atomic data are essential for calculations of level populations and line emissivities 
in photoionization codes (e.g. @Ferland:1998; @Kallman:2001; @Ercolano:2003; @Ercolano:2005). 

``AtomNeb`` is a database containing atomic data stored in the Flexible Image 
Transport System (FITS) file format produced for nebular spectral analysis, 
plasma diagnostics, and chemical abundance analysis. FITS tables 
provide easy access to atomic data for spectral analysis tools. Specifically, 
``AtomNeb`` includes the atomic data for both the _collisional excitation_ and 
_recombination_ process of ions typically observed in nebular astrophysics. 
The ``AtomNeb-idl`` IDL library is equipped with several application programming 
interface (API) functions written in the Interactive Data Language (IDL) 
for reading the atomic data from ``AtomNeb`` FITS files. This IDL library 
can also be employed in the GNU Data Language (GDL) (@Arabas:2010; @Coulais:2010), 
an open-source free compiler for IDL codes.

- The API functions for the _CEL atomic data_ developed in the IDL programming 
language were designed to easily read _collision strengths_ 
and _transition probabilities_ of given ions, which can be used to derive electron 
temperatures, electron densities, and ionic abundances from measured fluxes of 
collisionally excited lines in spectral analysis tools, and to simulate line emissivities 
in photoionization codes. The CEL data include energy levels, 
collision strengths, and transition probabilities from the CHIANTI database 
version 5.2 (@Landi:2006), version 6.0 (@Dere:2009), and version 7.0 (@Landi:2012), 
which were compiled according to the atomic data used in the FORTRAN program ``MOCASSIN`` 
(@Ercolano:2003; @Ercolano:2005). The CEL data also include a collection compiled based on 
the atomic data used in the Python package ``pyNeb`` (@Luridiana:2015).

- The API functions for the _RL atomic data_ developed in IDL were designed to provide easy access to 
_recombination coefficients_ and _branching ratios_ of recombination lines 
of given ions. The RL data include effective recombination 
coefficients for C II (@Davey:2000), N II (@Escalante:1990), 
O II (@Storey:1994; @Liu:1995), and Ne II (@Kisielius:1998), which were 
compiled based on the atomic data in ``MOCASSIN``. The RL data also include
hydrogenic ions for Z=1 to 8 (@Storey:1995), effective recombination 
coefficients for H, He, C, N, O, and Ne ions (@Pequignot:1991), 
effective recombination coefficients for He I (@Porter:2012; @Porter:2013), 
effective recombination coefficients for N II (@Fang:2011; @Fang:2013), 
and effective recombination coefficients for O II (@Storey:2017).

The ``AtomNeb-idl`` IDL/GDL library uses the FITS file related IDL procedures from the IDL Astronomy 
User's library (@Landsman:1993; @Landsman:1995) to read the atomic data stored in 
``AtomNeb`` FITS files. The API functions of this IDL/GDL library, together with 
the ``proEQUIB`` IDL/GDL library (@Danehkar:2018b), can be used to perform plasma 
diagnostics and abundance analysis of nebular spectra emitted from ionized gaseous nebulae.

# Acknowledgements

A.D. acknowledges the receipt of a Macquarie University Research Excellence Scholarship.

# References
