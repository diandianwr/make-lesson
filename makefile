# count words

.PHONY: dats #not a file to be  create
dats: isles.dat  abyss.dat last.dat analysis.zip 


isles.dat : books/isles.txt wordcount.py
	python wordcount.py $< $@
#default will just run the first object
	
abyss.dat : books/abyss.txt
	python wordcount.py books/abyss.txt abyss.dat

	
last.dat : books/last.txt
	python wordcount.py books/last.txt last.dat

analysis.zip : isles.dat abyss.dat last.dat
	zip $@ $^
	
.PHONY: clean	
clean:
	rm -f *.dat *zip