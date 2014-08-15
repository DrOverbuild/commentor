commentor
=========

A Mac app that adds or removes text to the beginning and/or end of each line in a text file.

Algorithms
=========

Both algorithms used have three modules. The first one handles splitting the main text into separate lines and some other preparations. The second module handles the main operation of the string. The final module handles displaying the string back to the user. The third module for both methods consist of the exact same code.

Algorithm used to add text to beginning and/or end of each line (In case you don't want to or can't read Swift):

- // Module 1
- Split string of main text area into lines and store each line in an array called `lines`
- Store the text we need to add in a string called `insertWhat`
- // Module 2
- For each line in `lines`:
  - If the checkbox titled "Put in front of line" is checked:
    - Set the line to `insertWhat` + line
  - If the checkbox titled "Put at end of line" is checked:
    - Set the line to line + `insertWhat`
- // Module 3
- Create a String object called `text`
- If `lines` holds two or more elements:
  - Do this for each element in `lines` except the last one:
    - Append the element to `text`
    - Append the newline character to `text`
- Add final element of `lines` to text.
- Set string of main text area to value of `text`

The algorithm for removing text is similar to the method above, because when I started work on the method, it started out the same, and ended the same. But I ran into several runtime errors and unexpected results when building this method, so I kept adding if statements, and other code so it would work.

- // Module 1
- If the checkbox titled "Put in front of line" and the checkbox titled "Put at end of line" are both unchecked:
  - Do not continue with rest of method.
- Split string of main text area into lines and store each line in an array called `lines`
- Store the text we want to remove in a string called `removeWhat`
- Store the number of characters in `removeWhat` in an integer called `length`
- // Module 2
- For every `line` in `lines`:
  - Determine whether or not `line` starts with `removeWhat` and the checkbox titled "Put in front of line" is checked. Store answer in a boolean value called `hasPrefix`
  - Determine whether or not `line` ends with `removeWhat` and the checkbox titled "Put at end of line" is checked. Store answer in a boolean value called `hasSuffix`
  - If the number of characters that will be deleted is greater than or equal to the number of characters in `line`:
    - Set `line` equal to an empty string.
  - Else:
    - If `hasPreffix` is true:
      - Set `line` equal to the substring of `line` that starts at the `length`th character and ends at the last character.
    - If `hasSuffix` is true:
      - Set `line` equal to the substring of `line` that starts at the first character and ends at the (number of characters in `line` minus `length` minus 2)th character.
- // Module 3
- Create a String object called `text`
- If `lines` holds two or more elements:
  - Do this for each element in `lines` except the last one:
    - Append the element to `text`
    - Append the newline character to `text`
- Add final element of `lines` to text.
- Set string of main text area to value of `text`
