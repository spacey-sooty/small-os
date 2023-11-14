hex_string = input()
hex_integer = int(hex_string, 16)
binary_string = bin(hex_integer)
binary_string = binary_string[2:]
print(binary_string)
