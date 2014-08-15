commentor
=========

A Mac app that adds or removes text to the beginning and/or end of each line in a text file.

=========

Algortithm used to add text to beginning and/or end of each line (In case you don't want to or can't read Swift):

- Split string of main text area into lines and store each line in an array called `lines`
- Store the text we need to add in a string called `insertWhat`
- For each line in `lines`:
  - If the checkbox titled "Put in front of line" is checked:
    - Set the line to `insertWhat` + line
  - If the checkbox titled "Put at end of line" is checked:
    - Set the line to line + `insertWhat`
- Create a String object called `text`
- If `lines` holds two or more elements:
  - Do this for each element in `lines` except the last one:
    - Append the element to `text`
    - Append the newline character to `text`
- Add final element of `lines` to text.
- Set string of main text area to value of `text`
