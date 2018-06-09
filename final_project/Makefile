all:
	g++ -g main.cpp decode.cpp thumbsim_driver.cpp parse.cpp execute.cpp -o thumbsim

run:
	./thumbsim -i -s -d -c256 -f inputs/shang.O0.sim

clean:
	rm -rf ./*.o ./thumbsim
