# Linux Commands Cheat Sheet

# Table of Contents

- [ls - List Files and Directories](#1-ls-list-files-and-directories)
	- [ls - Basic Usage](#example-11-basic-usage-ls)
	- [ls - Long Listing](#example-12-long-listing-ls--l)
	- [ls - Long Listing Time Based Reverse Order](#example-13-long-listing-based-on-time-and-reversed)

## 1. ls (List Files and Directories)

**Description:** This command displays the files and directories located inside the directory you are currently in. You can add additional options to increase the amount of information displayed.

<details>
	<summary>Click Here for ls Usage</summary>
		<pre>
Usage:&nbspls&nbsp[OPTION]...&nbsp[FILE]...
List&nbspinformation&nbspabout&nbspthe&nbspFILEs&nbsp(the&nbspcurrent&nbspdirectory&nbspby&nbspdefault).
Sort&nbspentries&nbspalphabetically&nbspif&nbspnone&nbspof&nbsp-cftuvSUX&nbspnor&nbsp--sort&nbspis&nbspspecified.

Mandatory&nbsparguments&nbspto&nbsplong&nbspoptions&nbspare&nbspmandatory&nbspfor&nbspshort&nbspoptions&nbsptoo.
&nbsp&nbsp-a,&nbsp--all&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspdo&nbspnot&nbspignore&nbspentries&nbspstarting&nbspwith&nbsp.
&nbsp&nbsp-A,&nbsp--almost-all&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspdo&nbspnot&nbsplist&nbspimplied&nbsp.&nbspand&nbsp..
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--author&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspwith&nbsp-l,&nbspprint&nbspthe&nbspauthor&nbspof&nbspeach&nbspfile
&nbsp&nbsp-b,&nbsp--escape&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspprint&nbspC-style&nbspescapes&nbspfor&nbspnongraphic&nbspcharacters
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--block-size=SIZE&nbsp&nbsp&nbsp&nbsp&nbsp&nbspscale&nbspsizes&nbspby&nbspSIZE&nbspbefore&nbspprinting&nbspthem;&nbspe.g.,
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'--block-size=M'&nbspprints&nbspsizes&nbspin&nbspunits&nbspof
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp1,048,576&nbspbytes;&nbspsee&nbspSIZE&nbspformat&nbspbelow
&nbsp&nbsp-B,&nbsp--ignore-backups&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspdo&nbspnot&nbsplist&nbspimplied&nbspentries&nbspending&nbspwith&nbsp~
&nbsp&nbsp-c&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspwith&nbsp-lt:&nbspsort&nbspby,&nbspand&nbspshow,&nbspctime&nbsp(time&nbspof&nbsplast
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspmodification&nbspof&nbspfile&nbspstatus&nbspinformation);
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspwith&nbsp-l:&nbspshow&nbspctime&nbspand&nbspsort&nbspby&nbspname;
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspotherwise:&nbspsort&nbspby&nbspctime,&nbspnewest&nbspfirst
&nbsp&nbsp-C&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplist&nbspentries&nbspby&nbspcolumns
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--color[=WHEN]&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspcolorize&nbspthe&nbspoutput;&nbspWHEN&nbspcan&nbspbe&nbsp'never',&nbsp'auto',
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspor&nbsp'always'&nbsp(the&nbspdefault);&nbspmore&nbspinfo&nbspbelow
&nbsp&nbsp-d,&nbsp--directory&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplist&nbspdirectories&nbspthemselves,&nbspnot&nbsptheir&nbspcontents
&nbsp&nbsp-D,&nbsp--dired&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspgenerate&nbspoutput&nbspdesigned&nbspfor&nbspEmacs'&nbspdired&nbspmode
&nbsp&nbsp-f&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspdo&nbspnot&nbspsort,&nbspenable&nbsp-aU,&nbspdisable&nbsp-ls&nbsp--color
&nbsp&nbsp-F,&nbsp--classify&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspappend&nbspindicator&nbsp(one&nbspof&nbsp*/=>@|)&nbspto&nbspentries
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--file-type&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplikewise,&nbspexcept&nbspdo&nbspnot&nbspappend&nbsp'*'
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--format=WORD&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspacross&nbsp-x,&nbspcommas&nbsp-m,&nbsphorizontal&nbsp-x,&nbsplong&nbsp-l,
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspsingle-column&nbsp-1,&nbspverbose&nbsp-l,&nbspvertical&nbsp-C
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--full-time&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplike&nbsp-l&nbsp--time-style=full-iso
&nbsp&nbsp-g&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplike&nbsp-l,&nbspbut&nbspdo&nbspnot&nbsplist&nbspowner
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--group-directories-first
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspgroup&nbspdirectories&nbspbefore&nbspfiles;
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspcan&nbspbe&nbspaugmented&nbspwith&nbspa&nbsp--sort&nbspoption,&nbspbut&nbspany
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspuse&nbspof&nbsp--sort=none&nbsp(-U)&nbspdisables&nbspgrouping
&nbsp&nbsp-G,&nbsp--no-group&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspin&nbspa&nbsplong&nbsplisting,&nbspdon't&nbspprint&nbspgroup&nbspnames
&nbsp&nbsp-h,&nbsp--human-readable&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspwith&nbsp-l,&nbspprint&nbspsizes&nbspin&nbsphuman&nbspreadable&nbspformat
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp(e.g.,&nbsp1K&nbsp234M&nbsp2G)
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--si&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplikewise,&nbspbut&nbspuse&nbsppowers&nbspof&nbsp1000&nbspnot&nbsp1024
&nbsp&nbsp-H,&nbsp--dereference-command-line
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspfollow&nbspsymbolic&nbsplinks&nbsplisted&nbspon&nbspthe&nbspcommand&nbspline
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--dereference-command-line-symlink-to-dir
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspfollow&nbspeach&nbspcommand&nbspline&nbspsymbolic&nbsplink
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspthat&nbsppoints&nbspto&nbspa&nbspdirectory
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--hide=PATTERN&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspdo&nbspnot&nbsplist&nbspimplied&nbspentries&nbspmatching&nbspshell&nbspPATTERN
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp(overridden&nbspby&nbsp-a&nbspor&nbsp-A)
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--indicator-style=WORD&nbsp&nbspappend&nbspindicator&nbspwith&nbspstyle&nbspWORD&nbspto&nbspentry&nbspnames:
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspnone&nbsp(default),&nbspslash&nbsp(-p),
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspfile-type&nbsp(--file-type),&nbspclassify&nbsp(-F)
&nbsp&nbsp-i,&nbsp--inode&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspprint&nbspthe&nbspindex&nbspnumber&nbspof&nbspeach&nbspfile
&nbsp&nbsp-I,&nbsp--ignore=PATTERN&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspdo&nbspnot&nbsplist&nbspimplied&nbspentries&nbspmatching&nbspshell&nbspPATTERN
&nbsp&nbsp-k,&nbsp--kibibytes&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspdefault&nbspto&nbsp1024-byte&nbspblocks&nbspfor&nbspdisk&nbspusage
&nbsp&nbsp-l&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspuse&nbspa&nbsplong&nbsplisting&nbspformat
&nbsp&nbsp-L,&nbsp--dereference&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspwhen&nbspshowing&nbspfile&nbspinformation&nbspfor&nbspa&nbspsymbolic
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplink,&nbspshow&nbspinformation&nbspfor&nbspthe&nbspfile&nbspthe&nbsplink
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspreferences&nbsprather&nbspthan&nbspfor&nbspthe&nbsplink&nbspitself
&nbsp&nbsp-m&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspfill&nbspwidth&nbspwith&nbspa&nbspcomma&nbspseparated&nbsplist&nbspof&nbspentries
&nbsp&nbsp-n,&nbsp--numeric-uid-gid&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplike&nbsp-l,&nbspbut&nbsplist&nbspnumeric&nbspuser&nbspand&nbspgroup&nbspIDs
&nbsp&nbsp-N,&nbsp--literal&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspprint&nbspraw&nbspentry&nbspnames&nbsp(don't&nbsptreat&nbspe.g.&nbspcontrol
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspcharacters&nbspspecially)
&nbsp&nbsp-o&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplike&nbsp-l,&nbspbut&nbspdo&nbspnot&nbsplist&nbspgroup&nbspinformation
&nbsp&nbsp-p,&nbsp--indicator-style=slash
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspappend&nbsp/&nbspindicator&nbspto&nbspdirectories
&nbsp&nbsp-q,&nbsp--hide-control-chars&nbsp&nbsp&nbspprint&nbsp?&nbspinstead&nbspof&nbspnongraphic&nbspcharacters
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--show-control-chars&nbsp&nbsp&nbspshow&nbspnongraphic&nbspcharacters&nbspas-is&nbsp(the&nbspdefault,
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspunless&nbspprogram&nbspis&nbsp'ls'&nbspand&nbspoutput&nbspis&nbspa&nbspterminal)
&nbsp&nbsp-Q,&nbsp--quote-name&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspenclose&nbspentry&nbspnames&nbspin&nbspdouble&nbspquotes
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--quoting-style=WORD&nbsp&nbsp&nbspuse&nbspquoting&nbspstyle&nbspWORD&nbspfor&nbspentry&nbspnames:
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspliteral,&nbsplocale,&nbspshell,&nbspshell-always,&nbspc,&nbspescape
&nbsp&nbsp-r,&nbsp--reverse&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspreverse&nbsporder&nbspwhile&nbspsorting
&nbsp&nbsp-R,&nbsp--recursive&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplist&nbspsubdirectories&nbsprecursively
&nbsp&nbsp-s,&nbsp--size&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspprint&nbspthe&nbspallocated&nbspsize&nbspof&nbspeach&nbspfile,&nbspin&nbspblocks
&nbsp&nbsp-S&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspsort&nbspby&nbspfile&nbspsize
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--sort=WORD&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspsort&nbspby&nbspWORD&nbspinstead&nbspof&nbspname:&nbspnone&nbsp(-U),&nbspsize&nbsp(-S),
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsptime&nbsp(-t),&nbspversion&nbsp(-v),&nbspextension&nbsp(-X)
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--time=WORD&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspwith&nbsp-l,&nbspshow&nbsptime&nbspas&nbspWORD&nbspinstead&nbspof&nbspdefault
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspmodification&nbsptime:&nbspatime&nbspor&nbspaccess&nbspor&nbspuse&nbsp(-u)
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspctime&nbspor&nbspstatus&nbsp(-c);&nbspalso&nbspuse&nbspspecified&nbsptime
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspas&nbspsort&nbspkey&nbspif&nbsp--sort=time
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--time-style=STYLE&nbsp&nbsp&nbsp&nbsp&nbspwith&nbsp-l,&nbspshow&nbsptimes&nbspusing&nbspstyle&nbspSTYLE:
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspfull-iso,&nbsplong-iso,&nbspiso,&nbsplocale,&nbspor&nbsp+FORMAT;
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspFORMAT&nbspis&nbspinterpreted&nbsplike&nbspin&nbsp'date';&nbspif&nbspFORMAT
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspis&nbspFORMAT1<newline>FORMAT2,&nbspthen&nbspFORMAT1&nbspapplies
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspto&nbspnon-recent&nbspfiles&nbspand&nbspFORMAT2&nbspto&nbsprecent&nbspfiles;
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspif&nbspSTYLE&nbspis&nbspprefixed&nbspwith&nbsp'posix-',&nbspSTYLE
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsptakes&nbspeffect&nbsponly&nbspoutside&nbspthe&nbspPOSIX&nbsplocale
&nbsp&nbsp-t&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspsort&nbspby&nbspmodification&nbsptime,&nbspnewest&nbspfirst
&nbsp&nbsp-T,&nbsp--tabsize=COLS&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspassume&nbsptab&nbspstops&nbspat&nbspeach&nbspCOLS&nbspinstead&nbspof&nbsp8
&nbsp&nbsp-u&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspwith&nbsp-lt:&nbspsort&nbspby,&nbspand&nbspshow,&nbspaccess&nbsptime;
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspwith&nbsp-l:&nbspshow&nbspaccess&nbsptime&nbspand&nbspsort&nbspby&nbspname;
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspotherwise:&nbspsort&nbspby&nbspaccess&nbsptime
&nbsp&nbsp-U&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspdo&nbspnot&nbspsort;&nbsplist&nbspentries&nbspin&nbspdirectory&nbsporder
&nbsp&nbsp-v&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspnatural&nbspsort&nbspof&nbsp(version)&nbspnumbers&nbspwithin&nbsptext
&nbsp&nbsp-w,&nbsp--width=COLS&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspassume&nbspscreen&nbspwidth&nbspinstead&nbspof&nbspcurrent&nbspvalue
&nbsp&nbsp-x&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplist&nbspentries&nbspby&nbsplines&nbspinstead&nbspof&nbspby&nbspcolumns
&nbsp&nbsp-X&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspsort&nbspalphabetically&nbspby&nbspentry&nbspextension
&nbsp&nbsp-1&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsplist&nbspone&nbspfile&nbspper&nbspline

SELinux&nbspoptions:

&nbsp&nbsp--lcontext&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspDisplay&nbspsecurity&nbspcontext.&nbsp&nbsp&nbspEnable&nbsp-l.&nbspLines
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspwill&nbspprobably&nbspbe&nbsptoo&nbspwide&nbspfor&nbspmost&nbspdisplays.
&nbsp&nbsp-Z,&nbsp--context&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspDisplay&nbspsecurity&nbspcontext&nbspso&nbspit&nbspfits&nbspon&nbspmost
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspdisplays.&nbsp&nbspDisplays&nbsponly&nbspmode,&nbspuser,&nbspgroup,
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspsecurity&nbspcontext&nbspand&nbspfile&nbspname.
&nbsp&nbsp--scontext&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspDisplay&nbsponly&nbspsecurity&nbspcontext&nbspand&nbspfile&nbspname.
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--help&nbsp&nbsp&nbsp&nbsp&nbspdisplay&nbspthis&nbsphelp&nbspand&nbspexit
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--version&nbsp&nbspoutput&nbspversion&nbspinformation&nbspand&nbspexit

SIZE&nbspis&nbspan&nbspinteger&nbspand&nbspoptional&nbspunit&nbsp(example:&nbsp10M&nbspis&nbsp10*1024*1024).&nbsp&nbspUnits
are&nbspK,&nbspM,&nbspG,&nbspT,&nbspP,&nbspE,&nbspZ,&nbspY&nbsp(powers&nbspof&nbsp1024)&nbspor&nbspKB,&nbspMB,&nbsp...&nbsp(powers&nbspof&nbsp1000).

Using&nbspcolor&nbspto&nbspdistinguish&nbspfile&nbsptypes&nbspis&nbspdisabled&nbspboth&nbspby&nbspdefault&nbspand
with&nbsp--color=never.&nbsp&nbspWith&nbsp--color=auto,&nbspls&nbspemits&nbspcolor&nbspcodes&nbsponly&nbspwhen
standard&nbspoutput&nbspis&nbspconnected&nbspto&nbspa&nbspterminal.&nbsp&nbspThe&nbspLS_COLORS&nbspenvironment
variable&nbspcan&nbspchange&nbspthe&nbspsettings.&nbsp&nbspUse&nbspthe&nbspdircolors&nbspcommand&nbspto&nbspset&nbspit.

Exit&nbspstatus:
&nbsp0&nbsp&nbspif&nbspOK,
&nbsp1&nbsp&nbspif&nbspminor&nbspproblems&nbsp(e.g.,&nbspcannot&nbspaccess&nbspsubdirectory),
&nbsp2&nbsp&nbspif&nbspserious&nbsptrouble&nbsp(e.g.,&nbspcannot&nbspaccess&nbspcommand-line&nbspargument).

GNU&nbspcoreutils&nbsponline&nbsphelp:&nbsp<http://www.gnu.org/software/coreutils/>
For&nbspcomplete&nbspdocumentation,&nbsprun:&nbspinfo&nbspcoreutils&nbsp'ls&nbspinvocation'
		</pre>
</details>

### Example 1.1) Basic Usage (ls)
```bash
ls
```

![alt-text](./reference_images/linux_cheat_sheet_images/basic_ls.PNG "Basic Usage")

### Example 1.2) Long Listing (ls -l)

Adding ```-l``` to the command will create a Long Listing. By using the ```-l``` option, you can see additional information such as; permissions, link count, owner of the file/directory, group of the file/directory, size in bytes, and date and time that the file/directory was last modified.

```bash
ls -l
```

![alt-text](./reference_images/linux_cheat_sheet_images/ls_l.PNG "Long Listing")

### Example 1.3) Long Listing based on time and reversed

This is a really useful way of listing files in a directory, because the latest modified file or directory will be directly above the command you just issued, making it very quick and easy to find the file you were just working on.

```-t``` means list based on time

```-r``` means list in reverse order

```bash
ls -lrt
```

![alt-text](./reference_images/linux_cheat_sheet_images/ls_lrt.PNG "Long Listing - Time Based, Reverse Ordered")

