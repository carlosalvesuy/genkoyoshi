unitsize(1cm);
real maxwidth,maxheight;
pair flip(pair old) {
  pair newpair=(old.y,old.x);
  return newpair;
}
bool isOdd(int x) {
  return (x%2==1);
}
// --- Define paper sizes --- //
pair A4=(21.0,29.7);
pair B4=(25,35.3);
pair A5=(14.8,21.0);
pair B5=(17.6,25);
pair USletter=(21.6,27.9);

// --- Start configs --- //
bool furiganaboxes=false;      // Furiganabox to the right of the kanjibox.
bool grid=false;               // Grid inside the kanjibox.
bool framed=true;              // Draw a frame around the boxes.
bool split=true;               // Split a page in two.

pair page=B4;                  // Select page (A4, A5, B4, B5 or USletter).
bool landscape=true;           // Landscape mode.
real pagehmargin=2.9;          // Minimum horizontal margin in cm.
real pagevmargin=2.5;          // Minimum vertical margin in cm.

real kanjiboxsize=1.0;         // The size of the kanjibox in cm.
real kanjiboxhmargin=0.4;      // Horizontal margin between kanjiboxes in cm.
real kanjiboxvmargin=0.0;      // Vertical margin between kanjiboxes in cm.
real furiganaboxwidth=0.5;     // The width of the furiganabox in cm.
real furiganaboxmargin=0.1;    // Margin between kanjibox and furiganabox in cm.
real splitsize=1.0;            // The size of the middle split in cm.

// --- Pen sizes and colors -- //
defaultpen(0.4);
pen kanjiboxpen=rgb(0.72,0.83,0.70);
pen furiganaboxpen=gray(0.8);
pen gridpen=gray(0.8)+dotted;
// --- End configs --- //

if (!furiganaboxes) {
  furiganaboxwidth=0;
  furiganaboxmargin=0;
}

if (landscape)
  page=flip(page);
maxwidth=page.x-2*pagehmargin;
maxheight=page.y-2*pagevmargin;

real istep=kanjiboxsize+furiganaboxmargin+furiganaboxwidth+kanjiboxhmargin;
real jstep=kanjiboxsize+kanjiboxvmargin;
real splitstep=0;

if (split)
  splitstep=splitsize+kanjiboxhmargin;

// If splitting with odd number of square columns, reduce the printable
// area width to make it even.
if (split && isOdd(floor((maxwidth-splitstep)/istep))) {
  maxwidth-=istep;
}

int xboxes=floor((maxwidth-splitstep)/istep);
int yboxes=floor(maxheight/jstep);

for (real i=0; i<=maxwidth-istep; i+=istep) {
  if (split && i>=istep*floor(xboxes/2.0)) {
    draw(shift(i,0)*scale(splitsize,yboxes*jstep)*unitsquare,kanjiboxpen);
    i+=splitstep;
    split=false;
  }
  for (real j=0; j<=maxheight-jstep; j+=jstep) {
    if (grid) {
      draw(shift(i+kanjiboxsize/2,j)*((0,0)--(0,kanjiboxsize)),gridpen);
      draw(shift(i,j)*((0,kanjiboxsize/2)--(kanjiboxsize,kanjiboxsize/2)),gridpen);
    }
    draw(shift(i,j)*scale(kanjiboxsize)*unitsquare,kanjiboxpen);
    if (furiganaboxes) 
      draw(shift(i+kanjiboxsize+furiganaboxmargin,j)*xscale(furiganaboxwidth)*yscale(kanjiboxsize)*unitsquare,furiganaboxpen);
  }
}

if (framed)
  draw(scale(xboxes*istep+splitstep,yboxes*jstep)*unitsquare,kanjiboxpen);

draw(shift(-(page.x-xboxes*istep-splitstep)/2.0,-(page.y-yboxes*jstep)/2.0)*scale(page.x,page.y)*unitsquare,invisible);

// --
write("Number of boxes="+string(xboxes)+"x"+string(yboxes));
write("Actual margin from page="+string((page.x-xboxes*istep-splitstep)/2.0)+"x"+string((page.y-yboxes*jstep)/2.0)+"cm");
// vim:filetype=asy
