# SED and REGEX

SED is a very powerful tool which can be used to filter and transform text. Occassionally, you will find certain syntaxes need to be slightly modified to work with OpenFrame or Linux OS in general. Below are just a few of the countless examples that you can do with sed. We'll start off relatively slow and then get into REGEX. REGEX stands for Regular Expressions, sometimes referred to as regexp or regx. Regular expressions allow us to draw a vague picture for SED to filter or transform patterns that match the regular expression. For example, I may want to change all numbers to the letter X. With Regular expressions, we can perform very complex transformations. In this guide, I will show you some examples how.

## Table of Contents

- [1. General SED Knowledge And First Example](#1-general-sed-knowledge-and-first-example)
	- [1.1 Sections Breakdown](#11-sections-breakdown)
	- [1.2 Try it Yourself](#12-try-it-yourself)

### 1. General SED Knowledge And First Example

SED can be very confusing to look at and read. I recommend breaking down each section and reading each section individually.

Let's look at a very basic command so I can explain the "sections"

```bash
sed "s/FOO/BAR/g" file.text
```

In the above command, the sections are delimited by **/**

| Section | Meaning               |
|---------|-----------------------|
|```s```  |  substitute           |
|```FOO```|  search for FOO       |
|```BAR```|  replace FOO with BAR |
|```g```  |  GLOBALLY             |

Let's break it down further.

#### 1.1 Sections Breakdown

1. Substitute is the most commonly used command. For the purpose of this document, this is the main command we will focus on.

2. ```FOO``` this is the text that we are searching to replace. We can substitute ```FOO``` with any type of regular expression or just normal text like the word FOO for example.

3. ```BAR``` this is what we are replacing ```FOO``` with. After running the above sed command, all instances of ```FOO``` will be replaced with  ```BAR```

4. Notice how I said **all instances of FOO** this is because we added the ```g``` command at the end of our command. This means do a global replacement. If we neglected the ```g```, only the first instance of FOO per line would be replaced.

#### 1.2 Try it Yourself

Click [Here](./examples/example1/file.txt) for a sample file.

Or copy and paste this into a text file

```
FOO 123 ABC BAR
FOO 123 ABC FOO
FOO BAR FOO BAR
BAR BAR FOO FOO
```

Then run the above command without ```g```.

```bash
sed "s/FOO/BAR/" file.txt
```

<details>
	<summary>Click here for the Result</summary>

```
BAR 123 ABC BAR
BAR 123 ABC FOO
BAR BAR FOO BAR
BAR BAR BAR FOO
```
</details>

Now let's try again with the ```g``` tag on the end.

```bash
sed "s/FOO/BAR/g" file.txt
```

<details>
	<summary>Click Here for the Result</summary>

```
BAR 123 ABC BAR
BAR 123 ABC BAR
BAR BAR BAR BAR
BAR BAR BAR BAR
```
</details>

