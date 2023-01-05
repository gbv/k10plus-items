quality:
	./quality-check.sh

kxp-isil-names.tsv: kxp-libraries.tsv
	./isil-names.pl < $< > $@

model.svg: model.mmd
	npm run mmdc -- -i $< -o $@ 
