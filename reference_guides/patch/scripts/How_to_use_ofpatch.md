# How to use ofpatch.sh

ofpatch.sh is a shell script created by SQA2 team leader. This script checks the type of patch file to be installed, unlinks the current version, copies the new patch to the correct directory (either core server, bin/util/lib), and creates a symbolic link to the new version. 

_**IMPORTANT NOTE: Only core servers, bin files, lib files, and util files can be patched using ofpatch.sh**_

## Steps

1. Make sure that ofpatch.sh is stored somewhere in your $PATH. Make sure to check your .bash_profile and that ofpatch.sh is stored in a directory mentioned in the $PATH variable.

2. Decompress the patch file if it comes in a compressed form. (zip, tar, tar.gz, etc)

3. use ```ofpatch.sh -h``` to see the usage of the script.

4. Execute the script by following the syntax below:

<pre>
  ofpatch.sh -n ${IMS}_${DATE} ${PATCH_FILE}
</pre>

[**Reference Documents: ofpatch.sh**](./ofpatch.sh)