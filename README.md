# Hardware Comprehensive Training (Personal Task)

Huazhong University of Science and Technology

School of Computer Science and Technology

2024-2025 Fall

---

## Brief Introduction

This repository is for the course "Comprehensive Hardware Training" offered by the School of Computer Science and Technology at Huazhong University of Science and Technology during the Fall Semester of 2024-2025. It contains materials related to the individual assignments, including task documentation, multiple versions of CPUs implemented on the Logisim simulation platform, as well as single-cycle and five-stage pipelined CPUs implemented on the FPGA platform.

This repository was activated during the FPGA phase of the assignment and transitioned from private to public after the course report was submitted. It is released under the MIT License, with the hope of providing helpful resources for future learners.

---

## FPGA: Single-cycle CPU

### Selectable Displayed Data

The data that is displayed on the LED is selectable. You are to use switches to select the data to display.

As is shown in the table, the following data is supported:

| Data     | Switch On        |
| -------- | ---------------- |
| PC       | SW[15]           |
| IR       | SW[14]           |
| MDin     | SW[13]           |
| RDin     | SW[12]           |
| MemWrite | SW[11]           |
| RegWrite | SW[10]           |
| LedData  | None or Multiple |

### Selectable Clock Frequency

Here, I support five different clock frequency, according to the request of the Lab Task Book.

Also, you may use switches to select the frequency:

| Frequency | Switch On        |
| --------- | ---------------- |
| 500 Hz    | SW[9]            |
| 128 Hz    | SW[8]            |
| 32 Hz     | SW[7]            |
| 4 Hz      | SW[6]            |
| 1 Hz      | None or Multiple |

### Build and Run

The project is based on `Vivado 2023.2`. You should open the `.xpr` file via the Vivado software and Run Synthesis.

---

## FPGA: Redirected Five-stage Pipelined CPU

### Selectable Displayed Data

The data that is displayed on the LED is selectable. You are to use switches to select the data to display.

As is shown in the table, the following data is supported:

| Data     | Switch On        |
| -------- | ---------------- |
| IF_PC    | SW[15]           |
| IF_IR    | SW[14]           |
| MDin     | SW[13]           |
| RDin     | SW[12]           |
| MemWrite | SW[11]           |
| RegWrite | SW[10]           |
| LedData  | None or Multiple |

### Selectable Clock Frequency

Here, I support five different clock frequency, according to the request of the Lab Task Book.

Also, you may use switches to select the frequency:

| Frequency | Switch On        |
| --------- | ---------------- |
| 500 Hz    | SW[9]            |
| 128 Hz    | SW[8]            |
| 32 Hz     | SW[7]            |
| 4 Hz      | SW[6]            |
| 1 Hz      | None or Multiple |

### Build and Run

The project is based on `Vivado 2023.2`. You should open the `.xpr` file via the Vivado software and Run Synthesis.

