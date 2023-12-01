build:
	sh ./barf
	rsync -r public/ build/public
	rsync style.css build/style.css
	rsync 404.html build/404.html

clean:
	rm -rf build/*

watch:
	while true; do \
	ls -d .git/* * posts/* pages/* header.html | entr -cd make ;\
	done

.PHONY: build clean watch
