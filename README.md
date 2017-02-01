## AtomNeb (IDL version)
[![GitHub license](https://img.shields.io/aur/license/yaourt.svg)](https://github.com/https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc/blob/master/LICENSE)

**Atomic Data for Ionized Nebulae**


### Description

The **AtomNeb** database for ***collisionally excited lines*** contains sets of [atomic datasets](https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data), which were generated for use in [proEQUIB](https://github.com/equib/proEQUIB), [pyEQUIB](https://github.com/equib/pyEQUIB), and other nebular spectral analysis tools. They include energy levels (Ej), collision strengths (Ωij), and transition probabilities (Aij) of the most ions commonly observed in ionized nebulae.

The atomic datasets for collisionally excited lines are as follows:

* **[Collection](https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data/collection)** from the [National Institute of Standards and Technology (NIST) Atomic Spectra Database](https://www.nist.gov/pml/atomic-spectra-database), the [CHIANTI atomic database](http://www.chiantidatabase.org/), and some improved atomic data from Cloudy v13.04 and pyNeb v1.0.

* **[Chianti52](https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data/chianti52)** from the [CHIANTI atomic database](http://www.chiantidatabase.org/) version 5.2.

* **[Chianti60](https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data/chianti60)** from the [CHIANTI atomic database](http://www.chiantidatabase.org/) version 6.0.

* **[Chianti70](https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data/chianti70)** from the [CHIANTI atomic database](http://www.chiantidatabase.org/) version 7.0.

Each dataset contains the following [atomic data FITS files](https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data/chianti70):

* **AtomElj.fits** contains *Energy Levels* (Ej).

* **AtomOmij.fits** contains *Collision Strengths* (Ωij).

* **AtomAij.fits** contains *Transition Probabilities* (Aij).

The **AtomNeb** database for ***recombination lines*** contains sets of [recombination coefficients] (https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc), which were generated for use in [proEQUIB](https://github.com/equib/proEQUIB), [pyEQUIB](https://github.com/equib/pyEQUIB), and other nebular spectral analysis tools. They include effective recombination coefficient (αeff) of recombination lines of H I, He I, He II, C I, C II, C III, C VI, N II, N III, N IV, N V, N VI, N VII, O II, O III, O IV, O V, O VI, O VIII, and Ne II ions typically observed in ionized nebulae, as well as Branching ratios (Br) of O II and N II lines.

The atomic datasets for recombination lines are as follows:

* **[RC Collection](https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc)**, effective recombination coefficients for C II ([Davey et al. 2000](http://adsabs.harvard.edu/abs/2000A%26AS..142...85D)), N II ([Escalante and Victor 1990](http://adsabs.harvard.edu/abs/1990ApJS...73..513E)), O II ([Storey 1994](http://adsabs.harvard.edu/abs/1994A%26A...282..999S); [Liu et al. 1995](http://adsabs.harvard.edu/abs/1995MNRAS.272..369L)), and Ne II ions ([Kisielius et al. 1998](http://adsabs.harvard.edu/abs/1998A%26AS..133..257K)), including Branching ratios (Br) for O II and N II ions.

* **[SH95 Collection](https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc)**, hydrogenic ions for Z=1 to 8, namely H I, He II, Li III, Be IV, B V, C VI, N VII, and O VIII ions from [Storey and Hummer (1995)](http://adsabs.harvard.edu/abs/1995MNRAS.272...41S).

* **[PPB91 Collection](https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc)**, effective recombination coefficients for H, He, C, N, O, Ne ions from [Pequignot, Petitjean and Boisson (1991)](http://adsabs.harvard.edu/abs/1991A%26A...251..680P).

* **[PFSD12 He I data](https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc)**, effective He I recombination coefficients from [Porter et al (2012)](
http://adsabs.harvard.edu/abs/2012MNRAS.425L..28P) and [(2013)](http://adsabs.harvard.edu/abs/2013MNRAS.433L..89P).

Website: [physics.mq.edu.au/~ashkbiz/atomneb](http://physics.mq.edu.au/~ashkbiz/atomneb/)
