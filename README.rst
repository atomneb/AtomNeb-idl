===================
AtomNeb IDL Library
===================
    
.. image:: https://app.travis-ci.com/atomneb/AtomNeb-idl.svg?branch=master
    :target: https://app.travis-ci.com/github/atomneb/AtomNeb-idl
    :alt: Build Status

.. image:: https://ci.appveyor.com/api/projects/status/gi4ok3wy7jjn1ekb?svg=true
    :target: https://ci.appveyor.com/project/danehkar/atomneb-idl
    :alt: Build Status

.. image:: http://mybinder.org/badge.svg
    :target: http://mybinder.org/repo/atomneb/atomneb-idl
    :alt: Binder

.. image:: https://img.shields.io/badge/license-GPL-blue.svg
    :target: https://github.com/atomneb/AtomNeb-idl/blob/master/LICENSE
    :alt: GitHub license

.. image:: https://img.shields.io/badge/DOI-10.5281/zenodo.2584419-blue.svg
    :target: https://doi.org/10.5281/zenodo.2584419
    :alt: Zenodo

.. image:: http://joss.theoj.org/papers/10.21105/joss.00898/status.svg
    :target: https://doi.org/10.21105/joss.00898
    :alt: JOSS
    
.. image:: https://mybinder.org/badge_logo.svg
 :target: https://mybinder.org/v2/gh/atomneb/AtomNeb-idl/HEAD?labpath=Notebooks.ipynb

Description
============

**AtomNeb-idl** is a library written in `Interactive Data Language <http://www.harrisgeospatial.com/ProductsandSolutions/GeospatialProducts/IDL.aspx>`_ (IDL)/`GNU Data Language <http://gnudatalanguage.sourceforge.net/>`_ (GDL) for reading atomic data from **AtomNeb**, which is a database containing atomic data stored in the Flexible Image Transport System (FITS) file format for *collisionally excited lines* and *recombination lines* typically observed in spectra of ionized gaseous nebulae. The AtomNeb database were generated for use in `proEQUIB <https://github.com/equib/proEQUIB>`_, `pyEQUIB <https://github.com/equib/pyEQUIB>`_, and other nebular spectral analysis tools. 


Collisionally Excited Lines
---------------------------

*AtomNeb for collisionally excited lines*  contains sets of `atomic datasets <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data>`_, which include energy levels (Ej), collision strengths (Ωij), and transition probabilities (Aij) of the most ions commonly observed in ionized nebulae.

The atomic datasets for collisionally excited lines are as follows:

* `Collection <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data/collection>`_ from the `National Institute of Standards and Technology (NIST) Atomic Spectra Database <https://www.nist.gov/pml/atomic-spectra-database>`_, the `CHIANTI atomic database <http://www.chiantidatabase.org/>`_, and some improved atomic data from `Cloudy v13.04 <https://www.nublado.org/>`_ and pyNeb v1.0. This collection was compiled according to the atomic data used in `pyNeb v1.0 <http://www.iac.es/proyecto/PyNeb/>`_.

* `Chianti52 <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data/chianti52>`_ from the `CHIANTI atomic database <http://www.chiantidatabase.org/>`_ version 5.2. This dataset was compiled according to the atomic data used in `MOCASSIN <https://github.com/mocassin/MOCASSIN-2.0>`_.

* `Chianti60 <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data/chianti60>`_ from the `CHIANTI atomic database <http://www.chiantidatabase.org/>`_ version 6.0. This dataset was compiled according to the atomic data used in `MOCASSIN <https://github.com/mocassin/MOCASSIN-2.0>`_.

* `Chianti70 <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data/chianti70>`_ from the `CHIANTI atomic database <http://www.chiantidatabase.org/>`_ version 7.0. This dataset was compiled according to the atomic data used in `MOCASSIN <https://github.com/mocassin/MOCASSIN-2.0>`_.

* `Chianti90 <https://github.com/atomneb/AtomNeb-py/tree/master/atomic-data/chianti90>`_ from the `CHIANTI atomic database <http://www.chiantidatabase.org/>`_ version 9.0. This dataset was compiled according to the atomic data used in `NEAT <https://github.com/rwesson/NEAT>`_.

Each dataset contains the following `atomic data FITS files <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data/chianti70>`_: ``AtomElj.fits`` for *Energy Levels* (Ej), ``AtomOmij.fits`` for *Collision Strengths* (Ωij), and ``AtomAij.fits`` for *Transition Probabilities* (Aij).


Recombination Lines
-------------------

*AtomNeb for recombination lines* contains sets of `effective recombination coefficients <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_ (αeff) of recombination lines of H I, He I, He II, C I, C II, C III, C VI, N II, N III, N IV, N V, N VI, N VII, O II, O III, O IV, O V, O VI, O VIII, and Ne II ions typically observed in ionized nebulae, as well as Branching ratios (Br) of O II and N II lines.

The atomic datasets for recombination lines are as follows:

* `RC Collection <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_, effective recombination coefficients for C II (`Davey et al. 2000 <http://adsabs.harvard.edu/abs/2000A%26AS..142...85D>`_), N II (`Escalante and Victor 1990 <http://adsabs.harvard.edu/abs/1990ApJS...73..513E>`_), O II (`Storey 1994 <http://adsabs.harvard.edu/abs/1994A%26A...282..999S>`_; `Liu et al. 1995 <http://adsabs.harvard.edu/abs/1995MNRAS.272..369L>`_), and Ne II ions (`Kisielius et al. 1998 <http://adsabs.harvard.edu/abs/1998A%26AS..133..257K>`_), including Branching ratios (Br) for O II and N II ions. This collection was compiled according to the atomic data used in `MOCASSIN <https://github.com/mocassin/MOCASSIN-2.0>`_.

* `SH95 Collection <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_, hydrogenic ions for Z=1 to 8, namely H I, He II, Li III, Be IV, B V, C VI, N VII, and O VIII ions from `Storey and Hummer (1995) <http://adsabs.harvard.edu/abs/1995MNRAS.272...41S>`_.

* `PPB91 Collection <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_, effective recombination coefficients for H, He, C, N, O, Ne ions from `Pequignot, Petitjean and Boisson (1991) <http://adsabs.harvard.edu/abs/1991A%26A...251..680P>`_.

* `PFSD12 He I data <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_, effective He I recombination coefficients from `Porter et al (2012) <http://adsabs.harvard.edu/abs/2012MNRAS.425L..28P>`_ and `(2013a) <http://adsabs.harvard.edu/abs/2013MNRAS.433L..89P>`_.

* `FSL13 N II data <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_, effective N II recombination coefficients (corrigendum) from `Fang, Storey and Liu (2011) <http://adsabs.harvard.edu/abs/2011A%26A...530A..18F>`_ and `(2013b) <http://adsabs.harvard.edu/abs/2013A%26A...550C...2F>`_.

* `SSB17 O II data <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_, effective O II recombination coefficients of 8889 recombination lines for Cases A, B, and C, and 2433 optical (3500-9000Å) recombination lines for Case B from `Storey, Sochi and Bastin (2017) <http://adsabs.harvard.edu/abs/2017MNRAS.470..379S>`_.



Installation
============

Dependent IDL Packages
----------------------

 This package requires the following packages:

    - `The IDL Astronomy User's Library <https://idlastro.gsfc.nasa.gov/homepage.html>`_
    
* To get this package with all the dependent packages, you can simply use ``git`` command as follows:

.. code-block::

        git clone --recursive https://github.com/atomneb/AtomNeb-idl

* If you plan to use the recent O II recombination coefficients (`Storey, Sochi and Bastin 2017 <http://adsabs.harvard.edu/abs/2017MNRAS.470..379S>`_), you need to unpack them:

.. code-block::

        cd AtomNeb-idl/atomic-data-rc/
        tar -xvf *.fits.tar.gz

Installation in IDL
-------------------

* To install the **AtomNeb** database and its API library in the Interactive Data Language (IDL), you need to add the path of this package directory to your IDL path. or more information about the path management in IDL, read `the tips for customizing IDL program path <https://www.harrisgeospatial.com/Support/Self-Help-Tools/Help-Articles/Help-Articles-Detail/ArtMID/10220/ArticleID/16156/Quick-tips-for-customizing-your-IDL-program-search-path>`_ provided by Harris Geospatial Solutions or `the IDL library installation note <http://www.idlcoyote.com/code_tips/installcoyote.php>`_ by David Fanning in the Coyote IDL Library. 

* This package requires IDL version 7.1 or later.


Installation in GDL
-------------------

*  You can install the GNU Data Language (GDL) if you do not have it on your machine:

    - Linux (Fedora):
    
    .. code-block::

        sudo dnf install gdl
    
    - Linux (Ubuntu):
    
    .. code-block::
    
        sudo apt-get install gnudatalanguage
    
    - OS X (`brew <https://brew.sh/>`_):
    
    .. code-block::

        brew tap brewsci/science
        brew install gnudatalanguage

    - OS X (`macports <https://www.macports.org/>`_):
    
    .. code-block::

        sudo port selfupdate
        sudo port upgrade libtool
        sudo port install gnudatalanguage
    
    - Windows: You can use the `GNU Data Language for Win32 <https://sourceforge.net/projects/gnudatalanguage-win32/>`_ (Unofficial Version) or you can compile the `GitHub source <https://github.com/gnudatalanguage/gdl>`_ using Visual Studio 2015 as shown in `appveyor.yml <https://github.com/gnudatalanguage/gdl/blob/master/appveyor.yml>`_.

* To install the **AtomNeb** database and its API library in GDL, you need to add the path of this package directory to your ``.gdl_startup`` file in your home directory:

  .. code-block::

    !PATH=!PATH + ':/home/AtomNeb-idl/pro/'
    !PATH=!PATH + ':/home/AtomNeb-idl/externals/astron/pro/'

  You may also need to set ``GDL_STARTUP`` if you have not done in ``.bashrc`` (bash):
  
  .. code-block::

    export GDL_STARTUP=~/.gdl_startup

  or in ``.tcshrc`` (cshrc):
  
  .. code-block::

    setenv GDL_STARTUP ~/.gdl_startup

* This package requires GDL version 0.9.8 or later.

How to Use
==========

The Documentation of the IDL functions provides in detail in the *API Documentation* (`atomneb.github.io/AtomNeb-idl/doc <https://atomneb.github.io/AtomNeb-idl/doc>`_). There are two main categories: *collisionally excited lines (CEL)* and *recombination lines (RC)*.

See *Jupyter Notebooks*: `Notebooks.ipynb <https://github.com/atomneb/AtomNeb-idl/blob/master/Notebooks.ipynb>`_

Run *Jupyter Notebooks* on `Binder <https://mybinder.org/v2/gh/atomneb/AtomNeb-idl/HEAD?labpath=Notebooks.ipynb>`_:

.. image:: https://mybinder.org/badge_logo.svg
 :target: https://mybinder.org/v2/gh/atomneb/AtomNeb-idl/HEAD?labpath=Notebooks.ipynb

* The atomic data for **collisionally excited lines (CEL)** contain Energy Levels (Ej), Collision Strengths (Ωij), and Transition Probabilities (Aij). We have four atomic datasets for them: `collection <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data/collection>`_, `chianti52 <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data/chianti52>`_, `chianti60 <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data/chianti60>`_, and `chianti70 <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data/chianti70>`_. 
    
    You need to load the **atomneb** object class, and choose either *collection*, *chianti52*, *chianti60* or *chianti70* as follows:
    
    .. code-block:: idl
    
        atm=obj_new('atomneb')
        atm->set_data_cel,'chianti70'
    
    Now you have access to:
     
    - *Energy Levels* (Ej):
    
      .. code-block:: idl
      
        atom='o'
        ion='iii'
        oiii_elj_data=atm->read_elj(atom, ion, level_num=6)
        print,oiii_elj_data.J_v
        print,oiii_elj_data.Ej
    
      which gives::
    
        0.00000      1.00000      2.00000      2.00000      0.00000      2.00000
        0.00000      113.200      306.200      20273.30     43185.69     60324.80
    
    - *Collision Strengths* (Ωij):
    
      .. code-block:: idl
      
        atom='o'
        ion='iii'
        oiii_omij_data=atm->read_omij(atom, ion)
        print,oiii_omij_data.level1
        print,oiii_omij_data.level2
        print,oiii_omij_data[0].strength
    
      which gives::
        
        0       1       1       1       1       ...
        0       2       3       4       5       ...
        100.0      158.50       251.20       398.10       631.0       ...
    
    - *Transition Probabilities* (Aij):
    
      .. code-block:: idl
    
        atom='o'
        ion='iii'
        oiii_aij_data=atm->read_aij(atom, ion)
        print,oiii_aij_data.Aij[*,*]
    
      which gives::
        
         0.0000   2.5969e-05       0.0000   2.3220e-06      ...
    
* The atomic data for **recombination lines (RC)** contain effective recombination coefficients (αeff) of emission lines from different collections: `RC Collection <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_, `SH95 Collection <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_, `PPB91 Collection <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_, `PFSD12 He I data <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_, `FSL13 N II data <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_, and `SSB17 O II data <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_.
    
    You need to load the **atomneb** object class:
    
    .. code-block:: idl
    
        atm=obj_new('atomneb')
    
    Now you have access to effective recombination coefficients (αeff) of the following collections:
     
    - *RC Collection*:
    
      .. code-block:: idl
    
        atom='c'
        ion='iii'
        cii_rc_data=atm->read_aeff_collection(atom, ion)
        n_line=size(cii_rc_data.Wavelength,/DIMENSIONS)
        for i=0,n_line[0]-1 do print,cii_rc_data[i].Wavelength, cii_rc_data[i].a, $
                                  cii_rc_data[i].b, cii_rc_data[i].c, $
                                  cii_rc_data[i].d, cii_rc_data[i].f
        
      which gives::
    
        914.00000      0.69280000     0.021400000    -0.016300000     -0.24310000     -0.88000000
        962.00000       1.0998000   -0.0042000000    -0.027900000     -0.22940000     -0.96560000
        997.00000      0.78210000     -0.36840000   0.00030000000     -0.12170000     -0.78740000
        ...
        
    - *SH95 Collection*:
    
      .. code-block:: idl
    
        atom='h'
        ion='ii'
        hi_rc_data=atm->read_aeff_sh95(atom, ion)
        print,hi_rc_data[0].Aeff
        
      which gives::
    
        100.00000       500.00000       0.0000000   4.2140000e-27   1.7560000e-27   1.0350000e-27
        ...
        
    - *PPB91 Collection*:
    
      .. code-block:: idl
    
        atom='c'
        ion='iii'
        cii_rc_data=atm->read_aeff_ppb91(atom, ion)
        n_line=size(cii_rc_data.Wavelength,/DIMENSIONS)
        for i=0,n_line[0]-1 do print,cii_rc_data[i].Ion,cii_rc_data[i].Case1, $
                                  cii_rc_data[i].Wavelength, cii_rc_data[i].a, $
                                  cii_rc_data[i].b, cii_rc_data[i].c, $
                                  cii_rc_data[i].d, cii_rc_data[i].br, $
                                  cii_rc_data[i].Q, cii_rc_data[i].y
           
      which gives::
    
        C2+A       9903.4600      0.69700000     -0.78400000       4.2050000      0.72000000       1.0000000       1.6210000
        C2+A       4267.1500       1.0110000     -0.75400000       2.5870000      0.71900000      0.95000000       2.7950000
        ...
          
    - *PFSD12 He I data*:
    
      .. code-block:: idl
    
        atom='he'
        ion='ii'
        hei_rc_data=atm->read_aeff_he_i_pfsd12(atom, ion)
        hei_rc_data_wave=atm->read_aeff_he_i_pfsd12(atom, ion, /wavelength)
        print,hei_rc_data[0].Aeff
           
      which gives::
    
        5000.0000       10.000000      -25.379540      -25.058970      -25.948440      -24.651820      -25.637660     
        ...
        
    - *FSL13 N II data*:
    
      .. code-block:: idl
    
        atom='n'
        ion='iii'
        wavelength_range=[4400.0, 7100.0] 
        nii_rc_data=atm->read_aeff_n_ii_fsl13(atom, ion, wavelength_range)
        nii_rc_data_wave=atm->read_aeff_n_ii_fsl13(atom, ion, wavelength_range, /wavelength)
        print,nii_rc_data[0].Aeff
        n_line=size(nii_rc_data_wave.Wavelength,/DIMENSIONS)
        for i=0,n_line[0]-1 do print,nii_rc_data_wave[i].Wavelength, nii_rc_data_wave[i].Tr, nii_rc_data_wave[i].Trans
        
      which gives::
    
        255.000      79.5000      47.3000      12.5000      6.20000      4.00000      2.86000
        258.000      54.4000      29.7000      7.92000      4.11000      2.72000      2.00000
        310.000      48.1000      23.7000      5.19000      2.55000      1.65000      1.21000
        434.000      50.3000      23.2000      4.71000      2.26000      1.45000      1.05000
          
        6413.23 6g - 4f2p6g G[9/2]o4 - 2p4f F[7/2]e3
        6556.32 6g - 4f2p6g G[9/2]o5 - 2p4f G[7/2]e4
        6456.97 6g - 4f2p6g G[9/2]o5 - 2p4f F[7/2]e4
        6446.53 6g - 4f2p6g F[7/2]o3 - 2p4f D[5/2]e2
        6445.34 6g - 4f2p6g F[7/2]o4 - 2p4f D[5/2]e3
        ...
        
    - *SSB17 O II data*: You first need to unpack rc_o_iii_SSB17_orl_case_b.fits.tar.gz, e.g.:

      .. code-block::
      
        tar -xvf rc_o_iii_SSB17_orl_case_b.fits.tar.gz

      If you need to have access to the full dataset (entire wavelengths, case A and B):
      
      .. code-block::

        tar -xvf rc_o_iii_SSB17.fits.tar.gz

      To use the full dataset:
      
      .. code-block:: idl

        atm->set_Atom_RC_O_III_SSB17, /full_data

      Please note that using the entire atomic data will make your program very slow and you may need to have a higher memory on your system. Without the above comment, as default, the cose uses rc_o_iii_SSB17_orl_case_b.fits:

      .. code-block:: idl
      
        atom='o'
        ion='iii'
        case1='B'
        wavelength_range=[5320.0, 5330.0] 
        oii_rc_data=atm->read_aeff_o_ii_ssb17(atom, ion, case1, wavelength_range)
        oii_rc_data_wave=atm->read_aeff_o_ii_ssb17(atom, ion, case1, wavelength_range, /wavelength)
        print,oii_rc_data[0].Aeff
        n_line=size(oii_rc_data_wave.Wavelength,/DIMENSIONS)
        for i=0,n_line[0]-1 do print,oii_rc_data_wave[i].Wavelength, oii_rc_data_wave[i].lower_term, oii_rc_data_wave[i].upper_term
        
      which gives::
    
        1.64100e-30  1.60000e-30  1.56400e-30  1.54100e-30  1.52100e-30  1.50900e-30
        ...
          
        5327.17 2s22p2(1S)3p 2Po
        5325.42 2s22p2(1S)3p 2Po
        5327.18 2s22p2(1D)3d 2Ge
        5326.84 2s22p2(1D)3d 2Ge
        ...


Documentation
=============

For more information on how to use the API functions from the AtomNeb IDL libray, please read the `API Documentation  <https://atomneb.github.io/AtomNeb-idl/doc>`_ published on `atomneb.github.io/AtomNeb-idl <https://atomneb.github.io/AtomNeb-idl>`_.


References
==========

* Danehkar, A. (2020). AtomNeb Python Package, an addendum to AtomNeb: IDL Library for Atomic Data of Ionized Nebulae. *J. Open Source Softw.*, **5**, 2797. doi:`10.21105/joss.02797 <https://doi.org/10.21105/joss.02797>`_ ads:`2020JOSS....5.2797D <https://ui.adsabs.harvard.edu/abs/2020JOSS....5.2797D>`_.

* Danehkar, A. (2019). AtomNeb: IDL Library for Atomic Data of Ionized Nebulae. *J. Open Source Softw.*, **4**, 898. doi:`10.21105/joss.00898 <https://doi.org/10.21105/joss.00898>`_ ads:`2019JOSS....4..898D <https://ui.adsabs.harvard.edu/abs/2019JOSS....4..898D>`_.


Citation
========

Using the **AtomNeb** IDL library in a scholarly publication? Please cite these papers:

.. code-block:: bibtex

   @article{Danehkar2019,
     author = {{Danehkar}, Ashkbiz},
     title = {AtomNeb: IDL Library for Atomic Data of Ionized Nebulae},
     journal = {Journal of Open Source Software},
     volume = {4},
     number = {35},
     pages = {898},
     year = {2019},
     doi = {10.21105/joss.00898}
   }

and if you use the `AtomNeb <https://github.com/atomneb/AtomNeb-py>`_ Python package:

.. code-block:: bibtex

   @article{Danehkar2020,
     author = {{Danehkar}, Ashkbiz},
     title = {AtomNeb Python Package, an addendum to AtomNeb: IDL Library 
              for Atomic Data of Ionized Nebulae},
     journal = {Journal of Open Source Software},
     volume = {5},
     number = {55},
     pages = {2797},
     year = {2020},
     doi = {10.21105/joss.02797}
   }


Learn More
==========

==================  =============================================
**Documentation**   https://atomneb.github.io/AtomNeb-idl/doc/
**Repository**      https://github.com/atomneb/AtomNeb-idl
**Issues & Ideas**  https://github.com/atomneb/AtomNeb-idl/issues
**DOI**             `10.21105/joss.00898 <https://doi.org/10.21105/joss.00898>`_
**Archive**         `10.5281/zenodo.2584419 <https://doi.org/10.5281/zenodo.2584419>`_
==================  =============================================
