quality:
	./quality-check.sh

kxp-libraries-reduced.tsv: kxp-libraries.tsv
	./reduce-libraries.pl < $< > $@

kxp-uniq-library-names.tsv: kxp-libraries-reduced.tsv kxp-libraries.tsv
	( cat kxp-libraries-reduced.tsv; awk '{print $$1}' kxp-libraries.tsv ) | awk '!x[$$1]++' | sort -k1 > $@

kxp-isil-names.tsv: kxp-libraries.tsv
	./isil-names.pl < $< > $@

model.svg: model.mmd
	npm run mmdc -- -i $< -o $@ 
