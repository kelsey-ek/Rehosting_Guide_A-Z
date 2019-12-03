# How To Use rsync

rsync is a linux command that allows you to keep files and directories in sync with each other. Assume you have two environments, one called TEST and one called PROD. If you take an image of the PROD environment to build the TEST environment, after a month, your files may look very different. If you want to sync them up, you can use this command to do so.

## Command

If you are syncing the TEST environment to match the PROD environment, you would run this command from the TEST environment:

```bash
rsync -chavzP --stats ${username}@${hostname_of_PROD}:/${remote_directory_or_file} ${local_directory_or_file}
```

## Real Example

The below command will sync my TEST environment's volume_default with that of prod.customer.com's volume_default.

```bash
rsync -chavzP --stats mkoziel@prod.customer.com:/u01_t0/tmaxapp/OpenFrame/volume_default /u01_t0/tmaxapp/OpenFrame/volume_default
```