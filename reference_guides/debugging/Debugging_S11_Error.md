### I. Debugging S11 error

1. Debugging with core file
    1. When S11 happends, a core file gets generated in certain location
        - mostly it gets created in $OPENFRAME_HOME/util or $OPENFRAME_HOME/core/appbin
    2. Execute command "file $core_name" to aquire the name of the program
    3. Use command "gdb $pgm_name $core_name" to trigger gdb using core file     
    
2. Using valgrind in batch job
    1. You can use valgrind to have better report on memory corruption
    2. First, goto $OPENFRAME_HOME/util and rename PGMRTS00 into PGMRTS00.org
    3. Next, create a bash script named PGMRTS00 and fill up the contents as below
    4. Run the JOB to generate the report
    
```bash
#!/bin/bash

VALGRIND_CMD="valgrind --max-stackframe=3266952 --tool=memcheck --leak-check=full PGMRTS00.org $@"

echo "${VALGRIND_CMD} PGMRTS00.org $@"
${VALGRIND_CMD} PGMRTS00.org $@
```

3. Using valgrind in online transaction
    1. boot down the tranclass by using tmdown command
    2. boot one of the tranclass using below command
    3. Run the online transaction and boot down the tranclass to generate the report
    
```bash
valgrind  --max-stackframe=132669520 --leak-check=full --show-leak-kinds=all --track-origins=yes --log-file=valgrind-out.txt PCICSM -S PCICSM_DFHTCL00 -s PCICSM_DFHTCL00 -d -1 -n -o out.out -e err.err &> log
```
