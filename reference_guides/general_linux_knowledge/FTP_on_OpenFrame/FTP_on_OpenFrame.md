# FTP Files from MainFrame to OpenFrame and OpenFrame to Mainframe

## Table of Contents

1. [FTP](#ftp-command-line)

2. [LFTP](#lftp-command-line)

## FTP Command Line

FTP Allows us to transfer files to and from the mainframe, or any other server. Where we ftp FROM determines what kind of FTP commands we need to use. FTP'ing from the mainframe requires JCL, whereas from a Linux server, we can use command line to FTP files manually or via scripts, or execute JCL through OpenFrame. Additionally, we can call a script through JCL which can utilize an FTP command.

<details>
	<summary>
		Click here for FTP Usage
	</summary>
	[mkoziel@ofdemo ~]$ ftp -h

	Usage: { ftp | pftp } [-Apinegvtd] [hostname]
	   -A: enable active mode
	   -p: enable passive mode (default for ftp and pftp)
	   -i: turn off prompting during mget
	   -n: inhibit auto-login
	   -e: disable readline support, if present
	   -g: disable filename globbing
	   -m: don't force data channel interface to the same as control channel
	   -v: verbose mode
	   -t: enable packet tracing [nonfunctional]
	   -d: enable debugging
</details>

### Steps

1. Execute the FTP utility and pass the IP address of the server you want to connect to

```bash
ftp ${IP_ADDRESS}
```

2. Pass the username and password
```bash
user ${username}
${password}
```

3. (Optional) Change directory on the target server to where your files are

```bash
cd ${target_dir}
```

4. (Optional) Change directory on your local server to where you want you files to download to

```bash
lcd ${target_dir}
```

5. (Optional) Change the transfer mode of the files you are ftp'ing. The two options are Binary and Ascii where Binary is the default.

```bash
ascii | binary
```

At this point, you are ready to issue a PUT or GET command.

#### PUT

When PUT'ing a file, you are transferring the file from your local server to the remote server. 

```bash
put ${file} ${target_name}
```

**Note:** You can rename the file in transfer by passing a ${target_name}. If you do not pass a target name, the file will not be renamed.

If the file you are trying to put does not exist on your local server, you will receive an error.

```bash
put ${file}
local: ${file} remote :${file}
local: ${file}: No such file or directory
```

#### GET

When GET'ing a file, you are transferring the file from the remote server, to the local server. 

```bash
GET ${file} ${target_name}
```

## LFTP Command Line

LFTP is very similar to FTP except that it's made especially for Linux FTP. You are able to pass multiple commands in a single line, and the syntaxing is slightly different. Please refer to the below link for LFTP usage.

<details>
	<summary>
		Click Here for LFTP Usage
	</summary>
	[mkoziel@ofdemo ~]$ ftp -h

	Usage: { ftp | pftp } [-Apinegvtd] [hostname]
	   -A: enable active mode
	   -p: enable passive mode (default for ftp and pftp)
	   -i: turn off prompting during mget
	   -n: inhibit auto-login
	   -e: disable readline support, if present
	   -g: disable filename globbing
	   -m: don't force data channel interface to the same as control channel
	   -v: verbose mode
	   -t: enable packet tracing [nonfunctional]
	   -d: enable debugging
</details>

Below is a link to the LFTP Manual which describes, in detail, how to use the LFTP functionality.

	[CLICK ME](https://lftp.yar.ru/lftp-man.html)

