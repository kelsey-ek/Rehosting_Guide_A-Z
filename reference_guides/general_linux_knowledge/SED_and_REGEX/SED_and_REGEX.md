# SED and REGEX

SED is a very powerful tool which can be used to filter and transform text. Occassionally, you will find certain syntaxes need to be slightly modified to work with OpenFrame or Linux OS in general. Below are just a few of the countless examples that you can do with sed. We'll start off relatively slow and then get into REGEX. REGEX stands for Regular Expressions, sometimes referred to as regexp or regx. Regular expressions allow us to draw a vague picture for SED to filter or transform patterns that match the regular expression. For example, I may want to change all numbers to the letter X. With Regular expressions, we can perform very complex transformations. In this guide, I will show you some examples how.

## Table of Contents

- [1. General SED Knowledge And First Example](#1-general-sed-knowledge-and-first-example)
	- [1.1 Section Breakdown](#11-section-breakdown)
	- [1.2 Try it Yourself](#12-try-it-yourself)
- [2. Regular Expressions](#2-regular-expressions)
	- [2.1 Example](#21-example)
	- [2.2 Section Breakdown](#22-section-breakdown)
	- [2.3 Try it Yourself](#23-try-it-yourself)

## 1. General SED Knowledge And First Example

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

### 1.1 Section Breakdown

1. Substitute is the most commonly used command. For the purpose of this document, this is the main command we will focus on.

2. ```FOO``` this is the text that we are searching to replace. We can substitute ```FOO``` with any type of regular expression or just normal text like the word FOO for example.

3. ```BAR``` this is what we are replacing ```FOO``` with. After running the above sed command, all instances of ```FOO``` will be replaced with  ```BAR```

4. Notice how I said **all instances of FOO** this is because we added the ```g``` command at the end of our command. This means do a global replacement. If we neglected the ```g```, only the first instance of FOO per line would be replaced.

### 1.2 Try it Yourself

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

## 2. Regular Expressions

Regular expressions allow us to match general cases. What's meant by "general cases" is that we may know a section of text contains upper and lower case letters, but we are not sure which order they are in. In these cases, we can use regular expressions to describe patterns.

### 2.1 Example

```bash
sed "s/[a-zA-Z]\{3\}/123/g" file.txt
```

### 2.2 Section Breakdown

1. ```sed  "s/"``` substitute using sed

2. ```[a-zA-Z]\{3\}``` any letter, lower or upper case, in a group of 3

	This would match the following cases:

| Before  | After  |
|---------|--------|
|   abc   |  123   |
|   Abc   |  123   |
|   aBc   |  123   |
|  aaabc  |  123bc |

3. ```123``` replace the regular expression match with the numbers 123

4. ```/g" file.txt``` make this change globally for __file.txt__

### 2.3 Try it Yourself

<details>
	<summary>Click Here for the Result</summary>

```
123 123 123 123
123 123 123 123
123 123 123 123
123 123 123 123
```
</details>

## 3. Creating Match Groups

We can create some match groups to print some fields, but not others. 

### 3.1 Example

Assume you have a file (we'll call it file2.txt) with the following text

```
NAME='BOB'
ADDRESS='123 Street'
PHONE='111-222-333'
SSN='123 45 6789'
DESCRIPTION='Brown Hair Blue Eyes 6-foot tall'
```

If we want to remove the single quotation marks around the fields to have an output like:

```
NAME=BOB
ADDRESS=123 Street
PHONE=111-222-333
SSN=123 45 6789
DESCRIPTION=Brown Hair Blue Eyes 6-foot tall
```

You would use the below command:

```bash
sed "s/\([a-zA-Z]*\)='\([a-zA-Z0-9\ \-]*\)'/\1=\2/g" file2.txt
```

### 3.2 Section Breakdown

1. ```sed "s/``` substitute using sed

2. ```\([a-zA-Z]*\)``` Create the first group. Groups are denoted by \( \). This group matches any letter both lower or upper case any number of times.

3. ```='``` After group 1, we are expecting an equal sign (=) followed by a single quotation mark (')

4. ```\([a-zA-Z0-9\ \-]*\)``` Create the second group. This group matches any letter, number, spaces, or hyphens. The asterisk (\*) denotes that there can be __zero or more__ matches to this expression.

5. ```'``` Ends section 3 - This is the closing single quote.

6. ```/\1=\2/g" file2.txt``` The \1 and \2 mean group 1 and group 2 respectively. So we are replacing the matched regular expression with group1=group2.