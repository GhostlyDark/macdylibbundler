DESTDIR=
PREFIX=/usr/local

all: dylibbundler

dylibbundler:
	g++ -c -I./src ./src/Settings.cpp -o ./Settings.o
	g++ -c -I./src ./src/DylibBundler.cpp -o ./DylibBundler.o
	g++ -c -I./src ./src/Dependency.cpp -o ./Dependency.o
	g++ -c -I./src ./src/main.cpp -o ./main.o
	g++ -c -I./src ./src/Utils.cpp -o ./Utils.o
	g++ -o ./dylibbundler ./Settings.o ./DylibBundler.o ./Dependency.o ./main.o ./Utils.o

clean:
	rm -f *.o
	rm -f ./dylibbundler
	
install: dylibbundler
	cp ./dylibbundler $(DESTDIR)$(PREFIX)/bin/dylibbundler
	chmod 775 $(DESTDIR)$(PREFIX)/bin/dylibbundler

.PHONY: all clean install
