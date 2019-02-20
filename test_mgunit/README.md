## Test with mgunit

To test this package with [mgunit](https://github.com/mgalloy/mgunit), you need to install ``mgunit`` on your machine:

    git clone --recursive https://github.com/mgalloy/mgunit.git

The test files need to have accessible to FITS files in ``atomic-data`` and ``atomic-data-rc``. To have IDL Astronomy User's library in ``externals`` directory of AtomNeb-idl, you can download AtomNeb-idl with its dependencies as follows 

    git clone --recursive https://github.com/atomneb/AtomNeb-idl.git

You need to unpack rc_o_iii_SSB17.fits.tar.gz in ``atomic-data-rc``:

    tar -xvf rc_o_iii_SSB17.fits.tar.gz

To run the test, you need to run the following command:

    idl test_all.pro

This will produce a HTML file ``test-results.html``. All the functions should pass the test without any failure.



