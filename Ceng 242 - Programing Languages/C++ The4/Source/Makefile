LDFLAGS=-std=c++11

all: ; g++ $(LDFLAGS) main.cpp TestableAllStream.cpp GameEngine.cpp TestableGameEngine.cpp Board.cpp TestableBoard.cpp GameParser.cpp TestableGameParser.cpp Player.cpp Berserk.cpp Tracer.cpp Ambusher.cpp Pacifist.cpp Dummy.cpp TestablePlayer.cpp -o CengNite
run: ; ./CengNite input.txt
clean: ; rm -rf CengNite;
valgrind: ; valgrind --leak-check=full --error-exitcode=1 ./CengNite input.txt

zipper: ; cat filesToUpload.txt | zip -@ hw4.zip
zipDeleter: ; rm -f hw4.zip

testValgrind: ; make all && make valgrind && echo $?