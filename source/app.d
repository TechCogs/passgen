/* A very simple command line tool to generate random passwords of
 * the desired length based on the provided criteria.
 *
 * This code is available under the GPLv3 license.
 *
 * Copyright 2020 TechCogs */

import std.stdio : writeln, write, readln;
import std.string : strip, toUpper;
import std.conv : to;
import std.random : choice, dice;

enum VERSION = 1.0; // The version of the program

int main() {
	int length = 0;
	auto letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];
	auto numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
	auto symbols = ["@", "^"];
	string password = "";
	writeln("PassGen v", VERSION);
	writeln("");
	write("Enter length of desired password>");
	try {
		length = to!int(strip(readln()));
	}
	catch(Exception e) {
		writeln("Usage:  Enter a number.");
		return 1;
	}
	for(int l = 0; l < length; l++) {
		auto pick = dice(25, 25, 50); // Choose whether it's a number, symbol, or letter
		if (pick == 0) password ~= to!string(choice(numbers));
		if (pick == 1) password ~= choice(symbols);
		if (pick == 2) {
			pick = dice(50, 50); // Choose whether the letter is lower-case or upper-case
			if (pick == 1) password ~= toUpper(choice(letters));
			else password ~= choice(letters);
		}
	}
	writeln("New password:  ", password);

	return 0;
}
