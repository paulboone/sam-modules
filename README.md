
This setup does not use the typical ~/privatemodules directory. To use modules compiled in this manner, you will need to run:

    module use --append $HOME/modules/modulefiles

or, if you are using my precompiled version:

    module use --append /ihome/cwilmer/pab135/modules/modulefiles


- To compile a package in ./compile-scripts, cd to ./compile-scripts and follow the instructions for the appropriate script. Typically, you will need to download the source to the ./src dir, then run the compile script (e.g. `./nodejs-5.7.0.sh`)
- Packages will be built to $HOME/modules/local/
- You can then load the package via a normal `module load` (e.g. `module load nodejs/5.7.0`)