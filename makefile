# count words

TXT_FILE = $(wildcard books/*,txt)
DAT_FILE = $(patsubst books/%.txt, %.dat, $(TXT_FILE))

SPTCOUNT = wordcount.py 
SPTPLOT = wordcount.py 

	
.PHONY: dats #not a file to be  cdddte
dats: $DAT_FILE



#pattern rules
%.dat : books/%.txt $(SPTCOUNT) 
	python $(SPTCOUNT)  $< $*.dat

	
#isles.dat : books/isles.txt wordcount.py
	#python wordcount.py $< $@
#default will just run the first object
	
#abyss.dat : books/abyss.txt
	#python wordcount.py books/abyss.txt abyss.dat

#last.dat : books/last.txt
	#python $(script) books/last.txt last.dat

%.pdf : %.dat $(SPTPLOT) 
	python $(SPTPLOT) $< $*.pdf
	
	
analysis.zip : $(DAT_FILE) $(SPTCOUNT) $(SPTPLOT)
	zip $@ $^
	
.PHONY: clean	
clean:
	rm -f *.dat *zip *pdf
	


