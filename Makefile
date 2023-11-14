compile:
	mkdir -p build
	nasm -fbin boot.asm -o build/boot.bin

run: compile
	qemu-system-x86_64 build/boot.bin

clean:
	rm build -rf
