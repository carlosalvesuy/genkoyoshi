Genkō yōshi
==========


Genkō yōshi (原稿用紙), also romanized at genkoyoshi, is a type of Japanese
paper used for writing. It is printed with squares. There are typically 200 or
400 squares on each sheet. Each square designed to accommodate a single
Japanese character or punctuation mark.

There are lots of PDFs available online but sometimes the squares are too big
or too small, the page size is wrong, etc.

I found some good ones from Ed Halley at http://halley.cc/nihon/patterns.html
These genkouyoushi PDFs gives a nice faint space for furigana. 
But, again. we will always want to have the posibility to adapt it
to our own needs. So these Asymptote <http://asymptote.sourceforge.net/> 
scripts with several parameters allow the customization of the page size, the
size of the boxes, margins, line thickness and color, etc.


##Rules of use

While genkō yōshi can be used for horizontal writing, it is most commonly used
for vertical writing, which is read from right to left. The first page is
therefore the right hand side of the sheet. The title is placed on the
first line, usually leaving two or three leading blank spaces. The author's
name is placed on line 2, with an empty square or two below and an empty
square between the given and family names. The first sentence begins on
line 3 or 4.

In Japanese, each paragraph, including the first one, is usually indented
by a square. However, when writing quoted text such as direct speech, the
opening quotation mark (﹁ or ﹃ in vertical writing) is placed in the
first square of the line.

Like printed vertical Japanese, full stops, commas, and small kana are
placed in the top right corner of their own square All punctuation marks,
other marks (such as parentheses), and small kana usually occupy their own
square, unless this would place them at the top of a new line, in which
case they share the last square of the previous line with the character in
that square. (This is the kinsoku shori rule.) A full stop followed
directly by closing quotation mark are written in one square.[1] A blank
square is left after non-Japanese punctuation marks (such as exclamation
points and question marks). Ellipses and dashes use two squares.

Furigana are written to the right of the relevant character, in small
print.

Words, phrases, and sentences in Western characters (such as Roman letters)
except acronyms like USA and NATO are often, but not always, written
vertically by turning the page a quarter turn counterclockwise, so that
when the page is viewed normally they are sideways. Each square can
accommodate two Western characters.

## Scripts usage

Then assuming you have already installed asymptote, the following command will
generate a PDF file that you can print or share:

`asy -f pdf traditional.asy`

Note that en this example we use the traditional.asy file, this may 
differ in your case.
