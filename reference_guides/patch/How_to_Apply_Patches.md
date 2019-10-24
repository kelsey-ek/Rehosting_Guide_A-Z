# How to Apply Patches

**General Notes:**

1. A Patch directory (from here on out refered to as ${patch_dir}) should be created somewhere. In general, we create a PATCH directory inside of the _tmaxsw_ folder, then we create directories for each of the products.

  The end product should look like:

```
${patch_dir}/
  OFCOBOL/
  PROSORT/
  OFASM/
```

2. Once a patch is downloaded, it should be ftp'd to the ${patch_dir} and placed in the appropriate folder in regards to the IMS ticket. i.e. If the IMS ticket category is OFCOBOL, the patch should go in the ${patch_dir}/OFCOBOL.

3. Create a directory inside ${patch_dir}/${product} with the IMS ticket number and the date. 

  The end product should look something like this:

```
${patch_dir}/
  OFCOBOL/
    IMS123456_20190828/
      libgeneric.so
      FTP
      tmadmin
    IMS654321_20190829/
      libgeneric2.so
  PROSORT/
    IMS987654_20190829/
      prosort/
    IMS456789_20190830/
      prosort/
  OFASM/
    IMS242424_20190830/
      ofasm/
```

## OpenFrame

*General Notes:* 

1. Compilers and Prosort are patched the same way (for the most part). Therefore, OFASM, OFCOBOL, OFPLI, and Prosort follow the same general process, but for completeness sake, they are all explicitly listed below.

2. OpenFrame Base, Core(TMAX), OSI, HiDB, and TACF generally come in the form of individual library, binary, and utility files. These can all be patched the same way.

3. ofpatch.sh is a shell script which can be utilized to quickly and easily patch library, binary, and utilities. It utilizes the <pre>offile</pre> command to test what kind of file it's patching, places it in the correct place, and then creates a symbolic link to the new file. In essence, this is what it does:

Before:
<pre>
  libfile.so
</pre>

Execution:
<pre>
  ofpatch.sh -n 000001 libfile.2.so
</pre>

After:
<pre>
  libfile.so --> libfile.2.so   (this is a symbolic link to the new library file)
  libfile.so                    (this is a backup of the old file)
</pre>

4. It's recommended that you keep track of the patches thoroughly. You can accomplish this by doing 2 things:
  - Add the IMS ticket number which the patch was supplied through in the name of the file. For most of the examples below, we will use 000001 as the IMS ticket number.
  - Add the date to the patch file name so you can tell when the patch was applied.

### OFCOBOL

<details><summary>Steps</summary>

OFCOBOL patches generally come in the form of entire directories. 

**Step 1.** Unlink the current OFCOBOL directory
<pre>
cd <i>${OFCOBOL_HOME}</i>
cd ..
unlink OFCOBOL
</pre>
**Step 2.** Download the patch to the <i>${patch_dir}/OFCOBOL/${ims_date}</i> directory

**Step 3.** Unpack the patch file
<pre>
tar -xzvf <i>${patch_file}</i>.tar.gz
</pre>
**Step 4.** There are two ways to manage directory-type patches. What I mean by directory-type patches, is patches that come in the form of full directories. You can either create a symbolic link to the path noted in step 2 or you can delete the existing OFCOBOL folder and replace it with a copy from the directory noted in step 2.

   - **Step 4a.** Symbolic link: 
<pre>
cd /opt/tmaxapp
ln -s <i>${patch_dir}/OFCOBOL/${ims_date}</i> OFCOBOL
</pre>

   - **Step 4b.** Create a copy:
<pre>
cd /opt/tmaxapp
rm -r OFCOBOL
cp -r <i>${patch_dir}/OFCOBOL/${ims_date}</i>/OFCOBOL .
</pre>
**Step 5.** Copy the old license directory to the new patched directory.
<pre>
cp -r <i>${OFCOBOL_BACKUP}</i>/license <i>${OFCOBOL_HOME}</i>
</pre>
**Step 6.** Check the current version to ensure that the patch was successful
<pre>
ofcob --version
</pre>
**Step 7.** Test the patch - Did it resolve the issue the patch was created for in the first place?

After applying the patch, the original issue reported in the IMS ticket should be retested.

**Step 8.** Receive confirmation from the Customer that the patch was successful.

</details>

### PROSORT

<details><summary>Steps</summary>

Prosort patches generally come in the form of entire directories, but may also include some library files. In this guide, we will explain how to handle both.

**Step 1.** Unlink the current Prosort directory

<pre>
  cd <i>${PROSORT_HOME}</i>
  cd ..
  unlink PROSORT
</pre>

**Step 2.** Download the patch to the <i>${patch_dir}/PROSORT/${ims_date}</i> directory

**Step 3.** Unpack the patch file

<pre>
  tar -xzvf <i>${patch_file}.tar.gz</i>
</pre>

  You may notice there are some library files here like so:

<pre>
  patch_file.tar.gz
  prosort/
  libfile1.so
  libfile2.so
</pre>

  If not, ignore **Step 6.**

**Step 4.** Create symbolic link, or delete and replace the prosort folder with a copy from the <i>${patch_file}</i>

  - **Step 4a.** Symbolic link

  <pre>
    cd <i>${PROSORT_HOME}</i>
    cd ..
    unlink prosort
    ln -s ${patch_dir}/PROSORT/${ims_date} prosort
  </pre>

  - **Step 4b.** Create a copy

  <pre>
    cd <i>${PROSORT_HOME}</i>
    cd ..
    rm -r prosort
    cp -r <i>${patch_dir}/PROSORT/${ims_date}/prosort</i> .
  </pre>

**Step 5.** Copy the old license directory to the new patched directory

<pre>
  cp -r <i>${PROSORT_BACKUP}/license ${PROSORT_HOME}</i>
</pre>

**Step 6.** If there are library files, make sure to add them to <i>${OPENFRAME_HOME}/lib</i> directory.

<pre>
  cp <i>${patch_dir}/PROSORT/${ims_date}/prosort/lib* ${OPENFRAME_HOME}/lib/.</i>
</pre>

**Step 7.** Check the current version to ensure that the patch was successful

<pre>
  prosort -v
</pre>

**Step 8.** Test the patch - Did it resolve the issue the patch was created for in the first place?

After applying the patch, the original issue reported in th e IMS ticket should be retested

**Step 9.** Receive confirmation from the customer.

</details>

### OFASM

<details><summary>Steps</summary>

OFASM patches generally come in the form of entire directories, but may also include some library files. In this guide, we will explain how to handle both.

**Step 1.** Unlink the current OFASM directory

<pre>
  cd <i>${OFASM_HOME}</i>
  cd ..
  unlink OFASM
</pre>

**Step 2.** Download the patch to the <i>${patch_dir}/OFASM/${ims_date}</i> directory

**Step 3.** Unpack the patch file

<pre>
  tar -xzvf <i>${patch_file}.tar.gz</i>
</pre>

<pre>
  patch_file.tar.gz
  OFASM/
</pre>

**Step 4.** Create symbolic link, or delete and replace the prosort folder with a copy from the <i>${patch_file}</i>

  - **Step 4a.** Symbolic link

  <pre>
    cd <i>${OFASM_HOME}</i>
    cd ..
    unlink OFASM
    ln -s ${patch_dir}/OFASM/${ims_date} prosort
  </pre>

  - **Step 4b.** Create a copy

  <pre>
    cd <i>${OFASM_HOME}</i>
    cd ..
    rm -r OFASM
    cp -r <i>${patch_dir}/OFASM/${ims_date}/OFASM</i> .
  </pre>

**Step 5.** Copy the old license directory to the new patched directory

<pre>
  cp -r <i>${OFASM_BACKUP}/license ${OFASM_HOME}</i>
</pre>

**Step 6.** Check the current version to ensure that the patch was successful

<pre>
  ofasm -v
</pre>

**Step 7.** Test the patch - Did it resolve the issue the patch was created for in the first place?

After applying the patch, the original issue reported in th e IMS ticket should be retested

**Step 8.** Receive confirmation from the customer.

</details>

### OFPLI

<details><summary>Steps</summary>

  OFPLI patches generally come in the form of full directories

  **Step 1.** Unlink the current OFPLI directory

<pre>
  cd <i>${OFPLI_HOME}</i>
  cd ..
  unlink OFPLI
</pre>

**Step 2.** Download the patch to the <i>${patch_dir}/OFPLI/${ims_date}</i> directory

**Step 3.** Unpack the patch file

<pre>
  tar -xzvf <i>${patch_file}.tar.gz</i>
</pre>

<pre>
  patch_file.tar.gz
  OFPLI/
</pre>

**Step 4.** Create symbolic link, or delete and replace the prosort folder with a copy from the <i>${patch_file}</i>

  - **Step 4a.** Symbolic link

  <pre>
    cd <i>${OFPLI_HOME}</i>
    cd ..
    unlink OFPLI
    ln -s ${patch_dir}/OFPLI/${ims_date} prosort
  </pre>

  - **Step 4b.** Create a copy

  <pre>
    cd <i>${OFPLI_HOME}</i>
    cd ..
    rm -r OFPLI
    cp -r <i>${patch_dir}/OFPLI/${ims_date}/OFPLI</i> .
  </pre>

**Step 5.** Copy the old license directory to the new patched directory

<pre>
  cp -r <i>${OFPLI_BACKUP}/license ${OFPLI_HOME}</i>
</pre>

**Step 6.** Check the current version to ensure that the patch was successful

<pre>
  ofpli --version
</pre>

**Step 7.** Test the patch - Did it resolve the issue the patch was created for in the first place?

After applying the patch, the original issue reported in th e IMS ticket should be retested

**Step 8.** Receive confirmation from the customer.

</details>

### OpenFrame Base / OpenFrame Batch / Core(TMAX) / OpenFrame OSI / OpenFrame HiDB / OpenFrame TACF

<details><summary>Steps</summary>

OpenFrame Base / OpenFrame Batch / OSI / HiDB / TACF patches generally come in the form of library files and binary files. We can utilize ofpatch.sh to patch these quickly and easily.

_See General Notes section for Patching OpenFrame for instructions with ofpatch.sh_

If you choose not to use ofpatch.sh, you can also manually patch library files, binary files, and utility files the same way.

1. Move the original file to {file_name}.bk{date}

2. Copy the patch file to the correct location
  - Library Files go to $OPENFRAME_HOME/lib
  - Binary Files go to $OPENFRAME_HOME/bin
  - Utility Files go to $OPENFRAME_HOME/util

3. Create a symbolic link from the new file to the original name

Example:
<pre>
  ln -s {patch_file} {original_file}
  Real Example:
  ln -s tmadmin.000001.20190923 tmadmin
</pre>

</details>

### JEUS

### OFMiner

<details><summary>Steps</summary>

  OFMiner patches come in .war files. The current OFMINER_HOME must be backed up before patching. Additionally, the managed server containing OFMiner should be offline while patching, and rebooted afterwards. After patching, some sql queries must be run to update the tables in Tibero which OFMiner uses to store meta data. 

1. Shutdown Jeus Managed Server where OFMiner is deployed

2. Create a backup of the current OFMINER_HOME directory

  <pre>

    cd ${OFMINER_HOME}
    cd ..
    cp -r ${OFMINER_HOME} OFMINER.BK.${DATE}

  </pre>

3. Unzip .war file. 

<pre>

  unzip ${patch_file.war}

</pre>

4. Copy the properties, repository, and license folder from the backup to the newly decompressed OFMiner.

<pre>

  cp -r OFMINER.BK.${DATE}/properties ${OFMINER_HOME}/.
  cp -r OFMINER.BK.${DATE}/repository ${OFMINER_HOME}/.
  cp -r OFMINER.BK.${DATE}/license ${OFMINER_HOME}/.

</pre>

5. Run the DROP, CREATE, INSERT sql queries included with the patch

<pre>

  cd ${OFMINER_HOME}/scripts
  tbsql ${tibero_user}/${tibero_user_password}@DROP.sql
  tbsql ${tibero_user}/${tibero_user_password}@CREATE.sql
  tbsql ${tibero_user}/${tibero_user_password}@INSERT.sql

</pre>

6. Reboot Managed Server 

<pre>

  jeusadmin -u ${jeus_admin} -p ${jeus_password}
  >> startManagedServer -s ${ofminer_server_name}

</pre>

7. Erase your browser's cache.

8. Logon and re-analyze.

</details>

## Tibero