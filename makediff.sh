#!/bin/sh

rm SampleDocCompare.html
rm -r SampleDocCompare_files
git show HEAD^:SampleDoc.docx > SampleDoc-prev.docx
git wdiff HEAD^ SampleDoc.docx > changes.diff
ansi-to-html -ntrue changes.diff>changes.html
git add changes.diff changes.html
osascript ./CompareDocs.scpt
