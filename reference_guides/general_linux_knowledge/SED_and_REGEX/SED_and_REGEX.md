# SED and REGEX

SED is a very powerful tool which can be used to filter and transform text. Occassionally, you will find certain syntaxes need to be slightly modified to work with OpenFrame or Linux OS in general. Below are just a few of the countless examples that you can do with sed. We'll start off relatively slow and then get into REGEX. REGEX stands for Regular Expressions, sometimes referred to as regexp or regx. Regular expressions allow us to draw a vague picture for SED to filter or transform patterns that match the regular expression. For example, I may want to change all numbers to the letter X. With Regular expressions, we can perform very complex transformations. In this guide, I will show you some examples how.

## Table of Contents

### General SED Knowledge

SED can be very confusing to look at and read. I recommend breaking down each section and reading each section individually.

Let's look at a very basic command so I can explain the "sections"

```bash
sed "s/FOO/BAR/g" file.text
```

In the above command, the sections are delimited by **/**

|Section|Meaning|
|```s```|substitute|
|```FOO```|search for FOO|
|```BAR```|replace FOO with BAR|
|```g```|GLOBALLY|


