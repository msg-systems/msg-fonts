
all: step-3 step-4

step-3:
	@sh msg-Fonts-2-GEN-Conversion.sh

step-4:
	inline-assets -v msg-Fonts-4-WEB-Specimen-1-refer.html >msg-Fonts-4-WEB-Specimen-2-embed.html

clean:
	-rm -f msg-Fonts-3-DTP/*
	-rm -f msg-Fonts-4-WEB/*

