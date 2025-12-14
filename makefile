all: index.html hashshare.min.js

hashshare.js:
	wget https://github.com/jncraton/hashshare/releases/download/v0.1.0/hashshare.js

lint:
	npx prettier@3.6.2 --check *.html
	
format:
	npx prettier@3.6.2 --write *.html

test: index.html lint
	pytest --browser firefox --browser chromium

favicon.ico:
	convert -size 48x48 xc:"#008030" -font "Noto-Mono" -pointsize 40 -fill white -gravity north -annotate 0 "#!" -define icon:auto-resize=16,32,48 favicon.ico

dev-deps:
	pip3 install pytest-playwright==0.7.1 && playwright install

clean:
	rm -rf .pytest_cache __pycache__ favicon*
