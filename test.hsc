// Hercules Script Test File
// This file tests all major syntax features

/*
 * Multi-line comment test
 * Block comment with multiple lines
 */

// Script definition with NPC
prontera,150,150,4	script	TestNPC	1_M_01,{
	// Variables
	.@local_var = 100;
	$global_var = 200;
	@temp_var = 300;
	#account_var = 400;

	// String literals
	mes "Hello World!";
	mes "Testing string with \"quotes\"";

	// Numeric operations
	.@result = 10 + 20 * 30;
	.@calc = (.@result - 5) / 2;
	.@mod = .@result % 3;

	// Comparison operators
	if (.@local_var == 100) {
		mes "Equal to 100";
	}

	if (.@local_var != 200) {
		mes "Not equal to 200";
	}

	if (.@local_var > 50) {
		mes "Greater than 50";
	}

	if (.@local_var >= 100) {
		mes "Greater or equal to 100";
	}

	if (.@local_var < 200) {
		mes "Less than 200";
	}

	if (.@local_var <= 100) {
		mes "Less or equal to 100";
	}

	// Logical operators
	if (.@local_var > 50 && .@local_var < 150) {
		mes "Logical AND test";
	}

	if (.@local_var == 100 || .@local_var == 200) {
		mes "Logical OR test";
	}

	// Bitwise operators
	.@bits = 5 & 3;
	.@bits = 5 | 3;
	.@bits = 5 ^ 3;

	// Ternary operator
	.@value = (.@local_var > 50) ? 1 : 0;

	// Assignment operators
	.@num = 10;
	.@num += 5;
	.@num -= 3;
	.@num *= 2;
	.@num /= 4;
	.@num %= 3;

	// If-else statement
	if (.@local_var > 100) {
		mes "Greater";
	} else {
		mes "Not greater";
	}

	// Nested if
	if (.@local_var > 0) {
		if (.@local_var < 200) {
			mes "Between 0 and 200";
		}
	}

	// Switch statement
	switch (.@local_var) {
		case 50:
			mes "Value is 50";
			break;
		case 100:
			mes "Value is 100";
			break;
		case 150:
			mes "Value is 150";
			break;
		default:
			mes "Other value";
			break;
	}

	// For loop
	for (.@i = 0; .@i < 10; .@i += 1) {
		mes "Loop iteration: " + .@i;
	}

	// While loop
	.@counter = 0;
	while (.@counter < 5) {
		mes "Counter: " + .@counter;
		.@counter += 1;
	}

	// Do-while loop
	.@count = 0;
	do {
		mes "Do-while: " + .@count;
		.@count += 1;
	} while (.@count < 3);

	// Function calls
	callfunc("TestFunction", .@local_var, "test");
	callsub(TestLabel, 10, 20);

	// Built-in functions
	getitem(501, 1);
	delitem(502, 1);
	announce("Server announcement", bc_all);
	warp("prontera", 150, 150);
	heal(100, 100);
	percentheal(100, 100);

	// Goto and labels
	goto JumpLabel;

JumpLabel:
	mes "Jumped to label";

	// Return statement
	return;

TestLabel:
	.@arg1 = getarg(0);
	.@arg2 = getarg(1);
	mes "Sub called with: " + .@arg1 + ", " + .@arg2;
	return;

OnInit:
	// Initialization code
	.global_init = 1;
	end;
}

// Warp definition
prontera,155,155,0	warp	TestWarp	1,1,izlude,128,98

// Duplicate NPC
prontera,160,160,4	duplicate(TestNPC)	TestNPC2	1_F_01

// Shop definition
-	shop	TestShop	-1,501:50,502:100

// Function definition
function	script	TestFunction	{
	.@param1 = getarg(0);
	.@param2$ = getarg(1);

	mes "Function called";
	mes "Param1: " + .@param1;
	mes "Param2: " + .@param2$;

	return .@param1 * 2;
}

// Array operations
-	script	ArrayTest	-1,{
OnInit:
	// Array declaration
	setarray(.@arr[0], 1, 2, 3, 4, 5);

	// Array size
	.@size = getarraysize(.@arr);

	// Copy array
	copyarray(.@copy[0], .@arr[0], .@size);

	// Clear array
	cleararray(.@temp[0], 0, 10);

	// Delete from array
	deletearray(.@arr[2], 1);

	end;
}
