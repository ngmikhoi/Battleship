# Battleship Assignment - Computer Architecture Lab (CO2008)

## Overview
This assignment is part of the **Computer Architecture Lab (CO2008)** course at **Ho Chi Minh City University of Technology**, under the **Faculty of Computer Science and Engineering**. The goal of the assignment is to develop a **Battleship game** using **MIPS assembly language** while utilizing the **MARS MIPS simulator**.


After completing this assignment, students will be able to:
- Use the **MARS MIPS simulator** effectively.
- Implement **arithmetic and data transfer instructions** in MIPS.
- Work with **conditional branch and unconditional jump instructions**.
- Develop structured **procedures** in assembly language.

## Introduction
**Battleship** is a strategic board game played between **two players**. The objective is to **strategically place ships** and **attack the opponent’s ships** by deducing their positions. Players take turns to guess locations on the grid, aiming to sink all of the opponent's ships.

## Requirements
In this project, students will:
- Replicate the **Battleship** game using **MIPS assembly language**.
- Implement a **7x7 grid** for simplicity and resource constraints.
- Follow the **setup phase**, where each player places their ships on the board.
- Ensure **valid ship placement**:
  - Ship positions are defined by the **coordinates of the bow and stern**.
  - Each player has the following ships:
    - **3 ships of size 2x1**
    - **2 ships of size 3x1**
    - **1 ship of size 4x1**
  - Ships **cannot overlap**.
- Implement the **gameplay phase**, where players take turns to attack each other's ships.

## Implementation Details
- The program should prompt players to **input their ship positions**.
- The **game state** will be represented using **binary values**:
  - `1` means the cell **contains a ship**.
  - `0` means the cell is **empty**.
- Players will **input attack coordinates**, and the system should indicate whether the attack was a **hit or miss**.
- The game ends when **one player sinks all the opponent’s ships**.

