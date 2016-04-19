# count words

.PHONY: dats #not a file to be  create
dats: isles.dat  abyss.dat last.dat analysis.zip 

#pattern rules
%dat : books/%.txt 
	python wordcount.py $< $*.dat

isles.dat : books/isles.txt wordcount.py
	python wordcount.py $< $@
#default will just run the first object
	
abyss.dat : books/abyss.txt
	python wordcount.py books/abyss.txt abyss.dat

script = wordcount.py 
last.dat : books/last.txt
	python $(script) books/last.txt last.dat

analysis.zip : isles.dat abyss.dat last.dat
	zip $@ $^
	
.PHONY: clean	
clean:
	rm -f *.dat *zip