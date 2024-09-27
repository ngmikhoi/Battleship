.data
welcome:	.asciiz "\n\tWelcome to battleship game!"
instruction:	.asciiz"\nGame Setup:\nBattleship is a strategic board game between 2 players.\nEach player has a grid of 7 rows and 7 columns representing the ocean.\nYou will be prompted to place your ships on the grid at the start of the game.\nYou have three ships of length 2, two ships of length 3, and one ship of length 4.\nShips can be placed either horizontally or vertically, but not diagonally.\nEnter the coordinates (row and column) for the bow and stern of each ship when prompted.\nEnsure ships are not placed outside the grid or overlapping with each other.\n\nGameplay:\nThe game proceeds in alternating turns between you and your opponent.\nInput the row and column coordinates to target a position on the opponent's grid.\nThe game will indicate whether you've hit an opponent's ship (HIT!) or missed (Miss!).\nAim to sink all your opponent's ships by strategically targeting their positions.\nKeep track of your hits and misses to determine the opponent's ship locations.\n\nWin Condition:\nThe first player to successfully destroy all of the opponent's ships wins the game.\n\nAdditional Tips:\nPlan your attacks strategically to locate and sink your opponent's ships efficiently.\nPay attention to the hits and misses to deduce the opponent's ship placements.\nRemember, valid inputs are within the range of 0 to 6 for both rows and columns."
ask: 	.asciiz "\nWould you like to read the instruction first?\nEnter 1 to display the instruction.\nEnter 0 to start the game.\nYour choice: "
mapA:	.word 0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0	
ship: 	.word 1,2,3,4
Ahit: .word 0
Bhit: .word 0
mapB:	.word 0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0
	.word 0,0,0,0,0,0,0
inGame:	.asciiz "\nNow both players will take turns attacking a position on the opponent's grid."
Aturn: 	.asciiz "\nplayer A's turn\n"
Bturn: 	.asciiz "\nplayer B's turn\n"
Aset: 	.asciiz "\n\n\tStart the game!\n\nIt's the turn of player A to set up ships"
Bset: 	.asciiz "\nPlayer A has finished ship placement.\n\nIt's the turn of player B to set up ships"
s2x1: 	.asciiz "\nSet up a 2x1 ship\n"
s3x1: 	.asciiz "\nSet up a 3x1 ship\n"
s4x1: 	.asciiz "\nSet up a 4x1 ship\n"
row_bow:	.asciiz "Enter row bow(0-6): "
column_bow:	.asciiz "Enter column bow(0-6): "
row_stern:	.asciiz "Enter row stern(0-6): "
column_stern:	.asciiz "Enter column stern(0-6): "
row_boom: 	.asciiz "Enter row boom(0-6): "
column_boom: 	.asciiz "Enter column boom(0-6): "
newline: 	.asciiz "\n"
space:	.asciiz " "
rangecall:	.asciiz"Out of range! The coordinates must be positive integers ranging from 0 to 6. Please enter coordinates again.\n"
overlapcall: .asciiz "Overlap! Please enter coordinates again.\n"
invalid_input: .asciiz "Invalid input. Please enter coordinates again.\n"
invalid2x1: .asciiz "It's not a 2x1 ship. Please enter coordinates again.\n"
invalid3x1: .asciiz "It's not a 3x1 ship. Please enter coordinates again.\n"
invalid4x1: .asciiz "It's not a 4x1 ship. Please enter coordinates again.\n"
hit: .asciiz "\tHIT!\n"
miss: .asciiz "\tMiss!\n"
Awin: .asciiz "\nCongratulation player A! You sank all player B's ships!\n"
Bwin: .asciiz "\nCongratulation player B! You sank all player A's ships!\n"
.text
main:
    	li $v0, 4
    	la $a0, welcome
    	syscall   	  
    	
    	li $v0, 4
    	la $a0, ask
    	syscall
    	
    	li $v0, 5
    	syscall
    	beq $v0, 0, Asetup
    	
    	li $v0, 4
    	la $a0, instruction
    	syscall
    	
Asetup:    	
    	li $v0, 4
    	la $a0, Aset
    	syscall
    		
    	li $t2, 0
ship2x1A:
	la $t0, ship
    	la $t1, mapA
    	beq $t2, 3, to3x1A
    	addi $t2, $t2, 1
    	
    	li $v0, 4
    	la $a0, s2x1
    	syscall
    	
    	li $v0, 4
    	la $a0, row_bow
    	syscall
    	
    	li $v0, 5
    	syscall           
    	sw $v0, 0($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange2A
    	
    	
    	li $v0, 4
    	la $a0, column_bow
    	syscall
    	
    	li $v0, 5
    	syscall           
    	sw $v0, 4($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange2A     
    	
    	li $v0, 4
    	la $a0, row_stern
    	syscall
    	
    	li $v0, 5
    	syscall           
    	sw $v0, 8($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange2A     

	li $v0, 4
    	la $a0, column_stern
    	syscall

	li $v0, 5
    	syscall          
    	sw $v0, 12($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange2A   
    	
    	lw $t4, 0($t0)
    	lw $t5, 4($t0)
    	lw $t6, 8($t0)
    	lw $t7, 12($t0)
    	
    	beq $t4, $t6, eRow2x1A
    	beq $t5, $t7, eCol2x1A
    	
    	li $v0, 4
    	la $a0, invalid2x1
    	syscall
	subi $t2, $t2, 1
    	j ship2x1A
eRow2x1A:
	sub $t8, $t5, $t7
	mul $t8, $t8, $t8
	beq $t8, 1, set2x1_rA
	
	li $v0, 4
    	la $a0, invalid2x1
    	syscall
	subi $t2, $t2, 1
	j ship2x1A
set2x1_rA:
	slt $t3, $t5, $t7
	beq $t3, 0, low2_stern_rA
high2_stern_rA:
	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4, $t1
	lw $t3, ($t4)
	beq $t3, 1, overlap2A 
	addi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap2A
	add $t4, $t6, $zero
	
	
	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4,$t1
	li $t3, 1
	sw $t3, ($t4)
	addi $t4, $t4, 4
	sw $t3, ($t4)
	jal print_mapA
	j ship2x1A
	

low2_stern_rA:
	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4, $t1
	lw $t3, ($t4)
	beq $t3, 1, overlap2A
	subi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap2A
	add $t4, $t6, $zero
		
	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4, $t1
	li $t3, 1
	sw $t3, ($t4)
	subi $t4, $t4, 4
	sw $t3, ($t4)
	jal print_mapA
	j ship2x1A
	
eCol2x1A:
	sub $t8, $t4, $t6
	mul $t8, $t8, $t8
	beq $t8, 1, set2x1_cA
	
	li $v0, 4
    	la $a0, invalid2x1
    	syscall
	subi $t2, $t2, 1
	j ship2x1A
set2x1_cA:
	slt $t3, $t4, $t6
	beq $t3, 0, low2_stern_cA
high2_stern_cA:
	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5, $t1
	lw $t3, ($t5)
	beq $t3, 1, overlap2A
	addi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap2A
	add $t5, $t7, $zero
	
	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5, $t1
	li $t3, 1
	sw $t3, ($t5)
	addi $t5, $t5, 28
	sw $t3, ($t5)
	jal print_mapA
	j ship2x1A
low2_stern_cA:	
	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5, $t1
	lw $t3, ($t5)
	beq $t3, 1, overlap2A
	subi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap2A
	add $t5, $t7, $zero

	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5, $t1
	li $t3, 1
	sw $t3, ($t5)
	subi $t5, $t5, 28
	sw $t3, ($t5)
	jal print_mapA
	j ship2x1A
	

to3x1A:
    	li $t2, 0
ship3x1A:
	la $t0, ship
    	la $t1, mapA
    	beq $t2, 2, to4x1A
    	addi $t2, $t2, 1
    	
    	li $v0, 4
    	la $a0, s3x1
    	syscall
    	
    	li $v0, 4
    	la $a0, row_bow
    	syscall
    	
    	la $t0, ship  
    	li $v0, 5
    	syscall           
    	sw $v0, 0($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange3A       
    	
    	li $v0, 4
    	la $a0, column_bow
    	syscall
    	
    	li $v0, 5
    	syscall           
    	sw $v0, 4($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange3A       
    	
    	li $v0, 4
    	la $a0, row_stern
    	syscall
    	
    	li $v0, 5
    	syscall          
    	sw $v0, 8($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange3A       

	li $v0, 4
    	la $a0, column_stern
    	syscall

	li $v0, 5
    	syscall          
    	sw $v0, 12($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange3A       
    	
    	lw $t4, 0($t0)
    	lw $t5, 4($t0)
    	lw $t6, 8($t0)
    	lw $t7, 12($t0)
    	
    	beq $t4, $t6, eRow3x1A
    	beq $t5, $t7, eCol3x1A
    	
    	li $v0, 4
    	la $a0, invalid3x1
    	syscall
	subi $t2, $t2, 1
    	j ship3x1A
eRow3x1A:
	sub $t8, $t5, $t7
	mul $t8, $t8, $t8
	beq $t8, 4, set3x1_rA
	
	li $v0, 4
    	la $a0, invalid3x1
    	syscall
	subi $t2, $t2, 1
	j ship3x1A
set3x1_rA:
	slt $t3, $t5, $t7
	beq $t3, 0, low3_stern_rA
high3_stern_rA:
	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4,$t1
	lw $t3, ($t4)
	beq $t3, 1, overlap3A
	addi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap3A
	addi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap3A
	add $t4, $t6, $zero

	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4,$t1
	li $t3, 1
	sw $t3, ($t4)
	addi $t4, $t4, 4
	sw $t3, ($t4)
	addi $t4, $t4, 4
	sw $t3, ($t4)
	jal print_mapA
	j ship3x1A
low3_stern_rA:
	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4,$t1
	lw $t3, ($t4)
	beq $t3, 1, overlap3A
	subi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap3A
	subi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap3A
	add $t4, $t6, $zero

	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4,$t1
	li $t3, 1
	sw $t3, ($t4)
	subi $t4, $t4, 4
	sw $t3, ($t4)
	subi $t4, $t4, 4
	sw $t3, ($t4)
	jal print_mapA
	j ship3x1A
eCol3x1A:
	sub $t8, $t4, $t6
	mul $t8, $t8, $t8
	beq $t8, 4, set3x1_cA
	
	li $v0, 4
    	la $a0, invalid3x1
    	syscall
	subi $t2, $t2, 1
	j ship3x1A
set3x1_cA:
	slt $t3, $t4, $t6
	beq $t3, 0, low3_stern_cA
high3_stern_cA:
	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5,$t1
	lw $t3, ($t5)
	beq $t3, 1, overlap3A
	addi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap3A
	addi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap3A
	add $t5, $t7, $zero

	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5,$t1
	li $t3, 1
	sw $t3, ($t5)
	addi $t5, $t5, 28
	sw $t3, ($t5)
	addi $t5, $t5, 28
	sw $t3, ($t5)
	jal print_mapA
	j ship3x1A
low3_stern_cA:
	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5,$t1
	lw $t3, ($t5)
	beq $t3, 1, overlap3A
	subi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap3A
	subi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap3A
	add $t5, $t7, $zero
		
	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5,$t1
	li $t3, 1
	sw $t3, ($t5)
	subi $t5, $t5, 28
	sw $t3, ($t5)
	subi $t5, $t5, 28
	sw $t3, ($t5)
	jal print_mapA
	j ship3x1A


to4x1A:
    	li $t2, 0
ship4x1A:
	la $t0, ship
    	la $t1, mapA
    	beq $t2, 1, Bsetup
    	addi $t2, $t2, 1
    	
    	li $v0, 4
    	la $a0, s4x1
    	syscall
    	
    	li $v0, 4
    	la $a0, row_bow
    	syscall
    	
    	la $t0, ship 
    	li $v0, 5
    	syscall       
    	sw $v0, 0($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange4A      
    	
    	li $v0, 4
    	la $a0, column_bow
    	syscall
    	
    	li $v0, 5
    	syscall          
    	sw $v0, 4($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange4A       
    	
    	li $v0, 4
    	la $a0, row_stern
    	syscall
    	
    	li $v0, 5
    	syscall            
    	sw $v0, 8($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange4A       

	li $v0, 4
    	la $a0, column_stern
    	syscall

	li $v0, 5
    	syscall           
    	sw $v0, 12($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange4A       
    	
    	lw $t4, 0($t0)
    	lw $t5, 4($t0)
    	lw $t6, 8($t0)
    	lw $t7, 12($t0)
    	
    	beq $t4, $t6, eRow4x1A
    	beq $t5, $t7, eCol4x1A
    	
    	li $v0, 4
    	la $a0, invalid4x1
    	syscall
	subi $t2, $t2, 1
    	j ship4x1A
eRow4x1A:
	sub $t8, $t5, $t7
	mul $t8, $t8, $t8
	beq $t8, 9, set4x1_rA
	
	li $v0, 4
    	la $a0, invalid4x1
    	syscall
	subi $t2, $t2, 1
	j ship4x1A
set4x1_rA:
	slt $t3, $t5, $t7
	beq $t3, 0, low4_stern_rA
high4_stern_rA:
	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4,$t1
	lw $t3, ($t4)
	beq $t3, 1, overlap4A
	addi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap4A
	addi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap4A
	addi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap4A
	add $t4, $t6, $zero

	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4,$t1
	li $t3, 1
	sw $t3, ($t4)
	addi $t4, $t4, 4
	sw $t3, ($t4)
	addi $t4, $t4, 4
	sw $t3, ($t4)
	addi $t4, $t4, 4
	sw $t3, ($t4)
	jal print_mapA
	j ship4x1A
low4_stern_rA:
	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4,$t1
	lw $t3, ($t4)
	beq $t3, 1, overlap4A
	subi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap4A
	subi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap4A
	subi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap4A
	add $t4, $t6, $zero

	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4,$t1
	li $t3, 1
	sw $t3, ($t4)
	subi $t4, $t4, 4
	sw $t3, ($t4)
	subi $t4, $t4, 4
	sw $t3, ($t4)
	subi $t4, $t4, 4
	sw $t3, ($t4)
	jal print_mapA
	j ship4x1A
	
eCol4x1A:
	sub $t8, $t4, $t6
	mul $t8, $t8, $t8
	beq $t8, 9, set4x1_cA
	
	li $v0, 4
    	la $a0, invalid4x1
    	syscall
	subi $t2, $t2, 1
	j ship4x1A
set4x1_cA:
	slt $t3, $t4, $t6
	beq $t3, 0, low4_stern_cA
high4_stern_cA:
	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5,$t1
	lw $t3, ($t5)
	beq $t3, 1, overlap4A
	addi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap4A
	addi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap4A
	addi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap4A
	add $t5, $t7, $zero

	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5,$t1
	li $t3, 1
	sw $t3, ($t5)
	addi $t5, $t5, 28
	sw $t3, ($t5)
	addi $t5, $t5, 28
	sw $t3, ($t5)
	addi $t5, $t5, 28
	sw $t3, ($t5)
	jal print_mapA
	j ship4x1A
low4_stern_cA:
	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5,$t1
	lw $t3, ($t5)
	beq $t3, 1, overlap4A
	subi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap4A
	subi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap4A
	subi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap4A
	add $t5, $t7, $zero

	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5,$t1
	li $t3, 1
	sw $t3, ($t5)
	subi $t5, $t5, 28
	sw $t3, ($t5)
	subi $t5, $t5, 28
	sw $t3, ($t5)
	subi $t5, $t5, 28
	sw $t3, ($t5)
	jal print_mapA
	j ship4x1A

outRange2A:
	li $v0, 4
    	la $a0, rangecall
    	syscall
	subi $t2, $t2, 1
	j ship2x1A
outRange3A:
	li $v0, 4
    	la $a0, rangecall
    	syscall
	subi $t2, $t2, 1
	j ship3x1A
outRange4A:
	li $v0, 4
    	la $a0, rangecall
    	syscall
	subi $t2, $t2, 1
	j ship4x1A

overlap2A:
	li $v0, 4
    	la $a0, overlapcall
    	syscall
	subi $t2, $t2, 1
	j ship2x1A
overlap3A:
	li $v0, 4
    	la $a0, overlapcall
    	syscall
	subi $t2, $t2, 1
	j ship3x1A
overlap4A:
	li $v0, 4
    	la $a0, overlapcall
    	syscall
	subi $t2, $t2, 1
	j ship4x1A

print_mapA:
	la $t1, mapA
	add $t0, $zero, $zero
loop_printA:
	beq $t0, 49, finishA
	li $v0, 1
	lw $a0, ($t1)
	syscall
	li $v0, 4
    	la $a0, space
    	syscall
	addi $t1, $t1, 4
	addi $t0, $t0, 1
	addi $t9, $zero, 7
	div $t0,$t9
	mfhi $t9
	bne $t9, 0, loop_printA
	li $v0, 4
    	la $a0, newline
    	syscall
	j loop_printA
	
finishA:
	jr $ra
Bsetup:    	
    	li $v0, 4
    	la $a0, Bset
    	syscall
    		
    	li $t2, 0
ship2x1B:
	la $t0, ship
    	la $t1, mapB
    	beq $t2, 3, to3x1B
    	addi $t2, $t2, 1
    	
    	li $v0, 4
    	la $a0, s2x1
    	syscall
    	
    	li $v0, 4
    	la $a0, row_bow
    	syscall
    	
    	la $t0, ship
    	
    	li $v0, 5
    	syscall        
    	sw $v0, 0($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange2B
    	
    	li $v0, 4
    	la $a0, column_bow
    	syscall
    	
    	li $v0, 5
    	syscall          
    	sw $v0, 4($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange2B     
    	
    	li $v0, 4
    	la $a0, row_stern
    	syscall
    	
    	li $v0, 5
    	syscall        
    	sw $v0, 8($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange2B     

	li $v0, 4
    	la $a0, column_stern
    	syscall

	li $v0, 5
    	syscall          
    	sw $v0, 12($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange2B   
    	
    	lw $t4, 0($t0)
    	lw $t5, 4($t0)
    	lw $t6, 8($t0)
    	lw $t7, 12($t0)
    	
    	beq $t4, $t6, eRow2x1B
    	beq $t5, $t7, eCol2x1B
    	
    	li $v0, 4
    	la $a0, invalid2x1
    	syscall
	subi $t2, $t2, 1
    	j ship2x1B
eRow2x1B:
	sub $t8, $t5, $t7
	mul $t8, $t8, $t8
	beq $t8, 1, set2x1_rB
	
	li $v0, 4
    	la $a0, invalid2x1
    	syscall
	subi $t2, $t2, 1
	j ship2x1B
set2x1_rB:
	slt $t3, $t5, $t7
	beq $t3, 0, low2_stern_rB
high2_stern_rB:
	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4, $t1
	lw $t3, ($t4)
	beq $t3, 1, overlap2B 
	addi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap2B
	add $t4, $t6, $zero
	
	
	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4,$t1
	li $t3, 1
	sw $t3, ($t4)
	addi $t4, $t4, 4
	sw $t3, ($t4)
	jal print_mapB
	j ship2x1B

low2_stern_rB:
	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4, $t1
	lw $t3, ($t4)
	beq $t3, 1, overlap2B
	subi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap2B
	add $t4, $t6, $zero
		
	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4, $t1
	li $t3, 1
	sw $t3, ($t4)
	subi $t4, $t4, 4
	sw $t3, ($t4)
	jal print_mapB
	j ship2x1B
	
eCol2x1B:
	sub $t8, $t4, $t6
	mul $t8, $t8, $t8
	beq $t8, 1, set2x1_cB
	
	li $v0, 4
    	la $a0, invalid2x1
    	syscall
	subi $t2, $t2, 1
	j ship2x1B
set2x1_cB:
	slt $t3, $t4, $t6
	beq $t3, 0, low2_stern_cB
high2_stern_cB:
	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5, $t1
	lw $t3, ($t5)
	beq $t3, 1, overlap2B
	addi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap2B
	add $t5, $t7, $zero
	
	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5, $t1
	li $t3, 1
	sw $t3, ($t5)
	addi $t5, $t5, 28
	sw $t3, ($t5)
	jal print_mapB
	j ship2x1B
low2_stern_cB:	
	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5, $t1
	lw $t3, ($t5)
	beq $t3, 1, overlap2B
	subi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap2B
	add $t5, $t7, $zero

	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5, $t1
	li $t3, 1
	sw $t3, ($t5)
	subi $t5, $t5, 28
	sw $t3, ($t5)
	jal print_mapB
	j ship2x1B

to3x1B:
    	li $t2, 0
ship3x1B:
	la $t0, ship
    	la $t1, mapB
    	beq $t2, 2, to4x1B
    	addi $t2, $t2, 1
    	
    	li $v0, 4
    	la $a0, s3x1
    	syscall
    	
    	li $v0, 4
    	la $a0, row_bow
    	syscall
    	
    	la $t0, ship  
    	li $v0, 5
    	syscall            
    	sw $v0, 0($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange3B       
    	
    	li $v0, 4
    	la $a0, column_bow
    	syscall
    	
    	li $v0, 5
    	syscall          
    	sw $v0, 4($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange3B       
    	
    	li $v0, 4
    	la $a0, row_stern
    	syscall
    	
    	li $v0, 5
    	syscall           
    	sw $v0, 8($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange3B       

	li $v0, 4
    	la $a0, column_stern
    	syscall

	li $v0, 5
    	syscall          
    	sw $v0, 12($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange3B       
    	
    	lw $t4, 0($t0)
    	lw $t5, 4($t0)
    	lw $t6, 8($t0)
    	lw $t7, 12($t0)
    	
    	beq $t4, $t6, eRow3x1B
    	beq $t5, $t7, eCol3x1B
    	
    	li $v0, 4
    	la $a0, invalid3x1
    	syscall
	subi $t2, $t2, 1
    	j ship3x1B
eRow3x1B:
	sub $t8, $t5, $t7
	mul $t8, $t8, $t8
	beq $t8, 4, set3x1_rB
	
	li $v0, 4
    	la $a0, invalid3x1
    	syscall
	subi $t2, $t2, 1
	j ship3x1B
set3x1_rB:
	slt $t3, $t5, $t7
	beq $t3, 0, low3_stern_rB
high3_stern_rB:
	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4,$t1
	lw $t3, ($t4)
	beq $t3, 1, overlap3B
	addi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap3B
	addi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap3B
	add $t4, $t6, $zero

	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4,$t1
	li $t3, 1
	sw $t3, ($t4)
	addi $t4, $t4, 4
	sw $t3, ($t4)
	addi $t4, $t4, 4
	sw $t3, ($t4)
	jal print_mapB
	j ship3x1B
low3_stern_rB:
	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4,$t1
	lw $t3, ($t4)
	beq $t3, 1, overlap3B
	subi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap3B
	subi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap3B
	add $t4, $t6, $zero

	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4,$t1
	li $t3, 1
	sw $t3, ($t4)
	subi $t4, $t4, 4
	sw $t3, ($t4)
	subi $t4, $t4, 4
	sw $t3, ($t4)
	jal print_mapB
	j ship3x1B
	
eCol3x1B:
	sub $t8, $t4, $t6
	mul $t8, $t8, $t8
	beq $t8, 4, set3x1_cB
	
	li $v0, 4
    	la $a0, invalid3x1
    	syscall
	subi $t2, $t2, 1
	j ship3x1B
set3x1_cB:
	slt $t3, $t4, $t6
	beq $t3, 0, low3_stern_cB
high3_stern_cB:
	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5,$t1
	lw $t3, ($t5)
	beq $t3, 1, overlap3B
	addi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap3B
	addi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap3B
	add $t5, $t7, $zero

	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5,$t1
	li $t3, 1
	sw $t3, ($t5)
	addi $t5, $t5, 28
	sw $t3, ($t5)
	addi $t5, $t5, 28
	sw $t3, ($t5)
	jal print_mapB
	j ship3x1B
low3_stern_cB:
	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5,$t1
	lw $t3, ($t5)
	beq $t3, 1, overlap3B
	subi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap3B
	subi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap3B
	add $t5, $t7, $zero
		
	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5,$t1
	li $t3, 1
	sw $t3, ($t5)
	subi $t5, $t5, 28
	sw $t3, ($t5)
	subi $t5, $t5, 28
	sw $t3, ($t5)
	jal print_mapB
	j ship3x1B


to4x1B:
    	li $t2, 0
ship4x1B:
	la $t0, ship
    	la $t1, mapB
    	beq $t2, 1, game
    	addi $t2, $t2, 1
    	
    	li $v0, 4
    	la $a0, s4x1
    	syscall
    	
    	li $v0, 4
    	la $a0, row_bow
    	syscall
    	
    	la $t0, ship  
    	li $v0, 5
    	syscall         
    	sw $v0, 0($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange4B      
    	
    	li $v0, 4
    	la $a0, column_bow
    	syscall
    	
    	li $v0, 5
    	syscall           
    	sw $v0, 4($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange4B       
    	
    	li $v0, 4
    	la $a0, row_stern
    	syscall
    	
    	li $v0, 5
    	syscall            
    	sw $v0, 8($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange4B       

	li $v0, 4
    	la $a0, column_stern
    	syscall

	li $v0, 5
    	syscall         
    	sw $v0, 12($t0)
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRange4B       
    	
    	lw $t4, 0($t0)
    	lw $t5, 4($t0)
    	lw $t6, 8($t0)
    	lw $t7, 12($t0)
    	
    	beq $t4, $t6, eRow4x1B
    	beq $t5, $t7, eCol4x1B
    	
    	li $v0, 4
    	la $a0, invalid4x1
    	syscall
	subi $t2, $t2, 1
    	j ship4x1B
eRow4x1B:
	sub $t8, $t5, $t7
	mul $t8, $t8, $t8
	beq $t8, 9, set4x1_rB
	
	li $v0, 4
    	la $a0, invalid4x1
    	syscall
	subi $t2, $t2, 1
	j ship4x1B
set4x1_rB:
	slt $t3, $t5, $t7
	beq $t3, 0, low4_stern_rB
high4_stern_rB:
	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4,$t1
	lw $t3, ($t4)
	beq $t3, 1, overlap4B
	addi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap4B
	addi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap4B
	addi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap4B
	add $t4, $t6, $zero

	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4,$t1
	li $t3, 1
	sw $t3, ($t4)
	addi $t4, $t4, 4
	sw $t3, ($t4)
	addi $t4, $t4, 4
	sw $t3, ($t4)
	addi $t4, $t4, 4
	sw $t3, ($t4)
	jal print_mapB
	j ship4x1B
low4_stern_rB:
	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4,$t1
	lw $t3, ($t4)
	beq $t3, 1, overlap4B
	subi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap4B
	subi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap4B
	subi $t4, $t4, 4
	lw $t3, ($t4)
	beq $t3, 1, overlap4B
	add $t4, $t6, $zero

	mul  $t4, $t4, 7
	add $t4, $t4, $t5
	mul $t4, $t4, 4
	add $t4, $t4,$t1
	li $t3, 1
	sw $t3, ($t4)
	subi $t4, $t4, 4
	sw $t3, ($t4)
	subi $t4, $t4, 4
	sw $t3, ($t4)
	subi $t4, $t4, 4
	sw $t3, ($t4)
	jal print_mapB
	j ship4x1B
eCol4x1B:
	sub $t8, $t4, $t6
	mul $t8, $t8, $t8
	beq $t8, 9, set4x1_cB
	
	li $v0, 4
    	la $a0, invalid4x1
    	syscall
	subi $t2, $t2, 1
	j ship4x1B
set4x1_cB:
	slt $t3, $t4, $t6
	beq $t3, 0, low4_stern_cB
high4_stern_cB:
	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5,$t1
	lw $t3, ($t5)
	beq $t3, 1, overlap4B
	addi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap4B
	addi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap4B
	addi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap4B
	add $t5, $t7, $zero

	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5,$t1
	li $t3, 1
	sw $t3, ($t5)
	addi $t5, $t5, 28
	sw $t3, ($t5)
	addi $t5, $t5, 28
	sw $t3, ($t5)
	addi $t5, $t5, 28
	sw $t3, ($t5)
	jal print_mapB
	j ship4x1B
low4_stern_cB:
	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5,$t1
	lw $t3, ($t5)
	beq $t3, 1, overlap4B
	subi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap4B
	subi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap4B
	subi $t5, $t5, 28
	lw $t3, ($t5)
	beq $t3, 1, overlap4B
	add $t5, $t7, $zero

	mul $t5, $t4, 7
	add $t5, $t5, $t7
	mul $t5, $t5, 4
	add $t5, $t5,$t1
	li $t3, 1
	sw $t3, ($t5)
	subi $t5, $t5, 28
	sw $t3, ($t5)
	subi $t5, $t5, 28
	sw $t3, ($t5)
	subi $t5, $t5, 28
	sw $t3, ($t5)
	jal print_mapB
	j ship4x1B

outRange2B:
	li $v0, 4
    	la $a0, rangecall
    	syscall
	subi $t2, $t2, 1
	j ship2x1B
outRange3B:
	li $v0, 4
    	la $a0, rangecall
    	syscall
	subi $t2, $t2, 1
	j ship3x1B
outRange4B:
	li $v0, 4
    	la $a0, rangecall
    	syscall
	subi $t2, $t2, 1
	j ship4x1B

overlap2B:
	li $v0, 4
    	la $a0, overlapcall
    	syscall
	subi $t2, $t2, 1
	j ship2x1B
overlap3B:
	li $v0, 4
    	la $a0, overlapcall
    	syscall
	subi $t2, $t2, 1
	j ship3x1B
overlap4B:
	li $v0, 4
    	la $a0, overlapcall
    	syscall
	subi $t2, $t2, 1
	j ship4x1B

print_mapB:
	la $t1, mapB
	add $t0, $zero, $zero
loop_printB:
	beq $t0, 49, finishB
	li $v0, 1
	lw $a0, ($t1)
	syscall
	li $v0, 4
    	la $a0, space
    	syscall
	addi $t1, $t1, 4
	addi $t0, $t0, 1
	addi $t9, $zero, 7
	div $t0,$t9
	mfhi $t9
	bne $t9, 0, loop_printB
	li $v0, 4
    	la $a0, newline
    	syscall
	j loop_printB
	
finishB:
	jr $ra
game:
	li $v0, 4
    	la $a0, inGame
    	syscall
turnA:
    	li $v0, 4
    	la $a0, Aturn
    	syscall
    	
    	li $v0, 4
    	la $a0, row_boom
    	syscall
    	
    	li $v0, 5
    	syscall
    	add $t0, $v0, $zero
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRangeA     
    	
    	li $v0, 4
    	la $a0, column_boom
    	syscall
    	
    	li $v0, 5
    	syscall
    	add $t1, $v0, $zero
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRangeA
    	
    	la $t2, mapB
	mul $t7, $t0, 7
	add $t7, $t7, $t1
	mul $t7, $t7, 4
	add $t7, $t7, $t2
	lw $t8, ($t7)
	beq $t8, 1, if_HitA

	li $v0, 4
    	la $a0, miss
    	syscall
    	j turnB
if_HitA:
	li $v0, 4
    	la $a0, hit
    	syscall
    	li $t8, 0
	sw $t8, ($t7)
	la $t9, Ahit
	lw $t3, ($t9)
	addi $t3, $t3, 1
	sw $t3, ($t9)
	beq $t3, 16, winA
	j turnB
winA: 
	li $v0, 4
    	la $a0, Awin
    	syscall
    	j exit_game
	
outRangeA:
	li $v0, 4
    	la $a0, rangecall
    	syscall
	j turnA

turnB:
    	li $v0, 4
    	la $a0, Bturn
    	syscall
    	
    	li $v0, 4
    	la $a0, row_boom
    	syscall
    	
    	li $v0, 5
    	syscall
    	add $t0, $v0, $zero
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRangeB     
    	
    	li $v0, 4
    	la $a0, column_boom
    	syscall
    	
    	li $v0, 5
    	syscall
    	add $t1, $v0, $zero
    	
    	slt $t3, $v0, $zero
    	addi $t4, $zero, 6
    	slt $t5, $t4, $v0
    	or $t6, $t3, $t5
    	beq $t6, 1, outRangeB
    	
    	la $t2, mapA
	mul $t7, $t0, 7
	add $t7, $t7, $t1
	mul $t7, $t7, 4
	add $t7, $t7, $t2
	lw $t8, ($t7)
	beq $t8, 1, if_HitB

	li $v0, 4
    	la $a0, miss
    	syscall
    	j turnA
if_HitB:
	li $v0, 4
    	la $a0, hit
    	syscall
    	li $t8, 0
	sw $t8, ($t7)
	la $t9, Bhit
	lw $t3, ($t9)
	addi $t3, $t3, 1
	sw $t3, ($t9)
	beq $t3, 16, winB
	j turnA
winB: 
	li $v0, 4
    	la $a0, Bwin
    	syscall
    	j exit_game
outRangeB:
	li $v0, 4
    	la $a0, rangecall
    	syscall
	j turnB		
exit_game:
    	li $v0, 10
    	syscall
