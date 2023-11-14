install:
	# may need change based on OS
	sudo apt install pylint python3 qemu-system-x86 make nasm

compile:
	mkdir -p build
	nasm -fbin boot.asm -o build/boot.bin

run: compile
	qemu-system-x86_64 build/boot.bin

lint: compile
	pylint -E scripts/hex-to-binary.py
	pylint -E scripts/hex-to-num.py

clean:
	rm build -rf
