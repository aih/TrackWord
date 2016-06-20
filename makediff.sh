#!/bin/sh
$DOCNAME='SampleDoc'
rm $DOCNAME'Compare.html'
rm -r $DOCNAME'Compare_files'
pandoc -f docx -t markdown -o $DOCNAME'.md' $DOCNAME'.docx'
pandoc -f docx -t markdown -o $DOCNAME'-prev.md' $DOCNAME'-prev.docx'
git show HEAD:$DOCNAME'.docx' > $DOCNAME'-prev.docx'
git wdiff HEAD $DOCNAME'.docx' > changes.diff
ansi-to-html -ntrue changes.diff>changes.html
sed -i 's/#A00/#A00;text-decoration: line-through;/g' changes.html
sed -i 's/#A00/#0A0;text-decoration: underline;/g' changes.html
git add changes.diff changes.html
osascript ./CompareDocs.scpt $DOCNAME 
git add ./*
