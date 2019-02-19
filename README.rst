=======
AtomNeb (IDL version)
=======
    
.. image:: https://travis-ci.org/equib/AtomNeb-idl.svg?branch=master
    :target: https://travis-ci.org/atomneb/AtomNeb-idl
    :alt: Build Status

.. image:: https://ci.appveyor.com/api/projects/status/at7fd0xbr1e9u75g?svg=true
    :target: https://ci.appveyor.com/project/danehkar/atomneb-idl
    :alt: Build Status

.. image:: http://mybinder.org/badge.svg
    :target: http://mybinder.org/repo/atomneb/atomneb-idl
    :alt: Binder

.. image:: https://img.shields.io/aur/license/yaourt.svg
    :target: https://github.com/atomneb/AtomNeb-idl/blob/master/LICENSE
    :alt: GitHub license

Description
============

Collisionally Excited Lines
---------------------------

The **AtomNeb** database for *collisionally excited lines*  contains sets of `atomic datasets <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data>`_, which were generated for use in `proEQUIB <https://github.com/equib/proEQUIB>`_, `pyEQUIB <https://github.com/equib/pyEQUIB>`_, and other nebular spectral analysis tools. They include energy levels (Ej), collision strengths (Ωij), and transition probabilities (Aij) of the most ions commonly observed in ionized nebulae.

The atomic datasets for collisionally excited lines are as follows:

* `Collection <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data/collection>`_ from the `National Institute of Standards and Technology (NIST) Atomic Spectra Database <https://www.nist.gov/pml/atomic-spectra-database>`_, the `CHIANTI atomic database <http://www.chiantidatabase.org/>`_, and some improved atomic data from Cloudy v13.04 and pyNeb v1.0.

* `Chianti52 <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data/chianti52>`_ from the `CHIANTI atomic database <http://www.chiantidatabase.org/>`_ version 5.2.

* `Chianti60 <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data/chianti60>`_ from the `CHIANTI atomic database <http://www.chiantidatabase.org/>`_ version 6.0.

* `Chianti70 <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data/chianti70>`_ from the `CHIANTI atomic database <http://www.chiantidatabase.org/>`_ version 7.0.


Each dataset contains the following `atomic data FITS files <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data/chianti70>`_:

* **AtomElj.fits** contains *Energy Levels* (Ej).

* **AtomOmij.fits** contains *Collision Strengths* (Ωij).

* **AtomAij.fits** contains *Transition Probabilities* (Aij).


Recombination Lines
-------------------

The **AtomNeb** database for *recombination lines* contains sets of `recombination coefficients <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_, which were generated for use in `proEQUIB <https://github.com/equib/proEQUIB>`_, `pyEQUIB <https://github.com/equib/pyEQUIB>`_, and other nebular spectral analysis tools. They include effective recombination coefficient (αeff) of recombination lines of H I, He I, He II, C I, C II, C III, C VI, N II, N III, N IV, N V, N VI, N VII, O II, O III, O IV, O V, O VI, O VIII, and Ne II ions typically observed in ionized nebulae, as well as Branching ratios (Br) of O II and N II lines.

The atomic datasets for recombination lines are as follows:

* `RC Collection <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_, effective recombination coefficients for C II (`Davey et al. 2000 <http://adsabs.harvard.edu/abs/2000A%26AS..142...85D>`_), N II (`Escalante and Victor 1990 <http://adsabs.harvard.edu/abs/1990ApJS...73..513E>`_), O II (`Storey 1994 <http://adsabs.harvard.edu/abs/1994A%26A...282..999S>`_; `Liu et al. 1995 <http://adsabs.harvard.edu/abs/1995MNRAS.272..369L>`_), and Ne II ions (`Kisielius et al. 1998 <http://adsabs.harvard.edu/abs/1998A%26AS..133..257K>`_), including Branching ratios (Br) for O II and N II ions.

* `SH95 Collection <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_, hydrogenic ions for Z=1 to 8, namely H I, He II, Li III, Be IV, B V, C VI, N VII, and O VIII ions from `Storey and Hummer (1995) <http://adsabs.harvard.edu/abs/1995MNRAS.272...41S>`_.

* `PPB91 Collection <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_, effective recombination coefficients for H, He, C, N, O, Ne ions from [Pequignot, Petitjean and Boisson (1991) <http://adsabs.harvard.edu/abs/1991A%26A...251..680P>`_.

* `PFSD12 He I data <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_, effective He I recombination coefficients from `Porter et al (2012) <http://adsabs.harvard.edu/abs/2012MNRAS.425L..28P>`_ and `(2013) <http://adsabs.harvard.edu/abs/2013MNRAS.433L..89P>`_.

* `FSL13 N II data <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_, effective N II recombination coefficients (corrigendum) from `Fang, Storey and Liu (2011) <http://adsabs.harvard.edu/abs/2011A%26A...530A..18F) and `(2013)](http://adsabs.harvard.edu/abs/2013A%26A...550C...2F>`_.

* `SSB17 O II data <https://github.com/atomneb/AtomNeb-idl/tree/master/atomic-data-rc>`_, effective O II recombination coefficients of 8889 recombination lines for Cases A, B, and C, and 2433 optical (3500-9000Å) recombination lines for Case B from `Storey, Sochi and Bastin (2017) <http://adsabs.harvard.edu/abs/2017MNRAS.470..379S>`_.



Installation
============

Dependent IDL Packages
----------------------

 This package requires the following packages:

    - `The IDL Astronomy User's Library <https://idlastro.gsfc.nasa.gov/homepage.html>`_
    
* To get this package with all the dependent packages, you can simply use ``git`` command as follows::

        git clone --recursive https://github.com/atomneb/AtomNeb-idl


Installation in IDL
-------------------

* To install the **AtomNeb** database and its API library in the Interactive Data Language (IDL), you need to add the path of this package directory to your IDL path. or more information about the path management in IDL, read `the tips for customizing IDL program path <https://www.harrisgeospatial.com/Support/Self-Help-Tools/Help-Articles/Help-Articles-Detail/ArtMID/10220/ArticleID/16156/Quick-tips-for-customizing-your-IDL-program-search-path>`_ provided by Harris Geospatial Solutions or `the IDL library installation note <http://www.idlcoyote.com/code_tips/installcoyote.php>`_ by David Fanning in the Coyote IDL Library. 

* This package requires IDL version 7.1 or later.


Installation in GDL
-------------------

*  You can install the GNU Data Language (GDL) if you do not have it on your machine:

    - Linux (Fedora)::

        sudo dnf install gdl
    
    - Linux (Ubuntu)::
    
        sudo apt-get install gnudatalanguage
    
    - OS X::
    
        brew install gnudatalanguage
    
    - Windows: You can use the `GNU Data Language for Win32 <https://sourceforge.net/projects/gnudatalanguage-win32/>`_ (Unofficial Version) or you can compile the `GitHub source <https://github.com/gnudatalanguage/gdl>`_ using Visual Studio 2015 as shown in `appveyor.yml <https://github.com/gnudatalanguage/gdl/blob/master/appveyor.yml>`_.

* To install the **AtomNeb** database and its API library in GDL, you need to add the path of this package directory to your ``.gdl_startup`` file in your home directory::

    !PATH=!PATH + ':/home/AtomNeb-idl/pro/'
    !PATH=!PATH + ':/home/AtomNeb-idl/externals/astron/pro/'

  You may also need to set ``GDL_STARTUP`` if you have not done in ``.bashrc`` (bash)::

    export GDL_STARTUP=~/.gdl_startup

  or in ``.tcshrc`` (cshrc)::

    setenv GDL_STARTUP ~/.gdl_startup

* This package requires GDL version 0.9.8 or later.

Documentation
=============

For more information on how to use the API functions from the AtomNeb IDL libray, please read the `API Documentation  <https://atomneb.github.io/AtomNeb-idl/doc>`_ published on `atomneb.github.io/AtomNeb-idl <https://atomneb.github.io/AtomNeb-idl>`_.

