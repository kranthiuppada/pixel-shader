# pixel-shader
Verilog-based pixel shader with timing and CDC constraints
# Pixel Shader – Verilog FPGA Design with CDC and Timing Constraints

This project implements a **Pixel Shader** module in Verilog that performs **color inversion** on RGB pixel inputs using handshake-based pipelining. It focuses not only on RTL design but also on **real-world FPGA implementation challenges**, particularly around **Clock Domain Crossing (CDC)** and **timing constraints**.

---

## 🧠 Features

- ✅ Inverts 8-bit Red, Green, and Blue values using bitwise NOT
- ✅ Input and Output handshake with `pixel_valid_in` and `pixel_valid_out`
- ✅ Two-stage pipelining for clean, clock-safe timing
- ✅ CDC-safe design for asynchronous domain crossing
- ✅ Synchronous active-low reset (`rst_n`)
- ✅ Clean and testable Verilog RTL for FPGA implementation

---

## 📁 Files Included

| File Name                            | Description                                                  |
|-------------------------------------|--------------------------------------------------------------|
| `pixel_shader.v`                    | RTL module for color inversion                              |
| `tb_pixel_shader.v`                 | Testbench to verify design via simulation                    |
| `Common-FPGA-Implementation-Challenges.pdf` | Report explaining constraints, design decisions, and CDC     |
| `.gitignore`                        | Prevents Vivado temporary files from being tracked in Git    |
| `LICENSE`                           | MIT License for open-source sharing                          |
| `README.md`                         | You're reading it                                            |

---

## ⚙️ Design Overview

This pixel shader inverts RGB values and uses pipelined handshaking. It is extended to handle clock domain crossing from an asynchronous domain (`clk_in`) to the main clock domain (`clk`) using 2-stage synchronizers.

```verilog
// Example inversion logic
pipe_r1 <= ~pixel_in_r;
pipe_g1 <= ~pixel_in_g;
pipe_b1 <= ~pixel_in_b;
```

---

## 🧪 Simulation Instructions

To simulate:

1. Compile and simulate using your Verilog tool:
   ```sh
   vlog pixel_shader.v tb_pixel_shader.v
   vsim tb_pixel_shader
   ```
2. Observe the waveform:
   - Check for correct inversion
   - Verify timing and valid signal delays
   - Confirm no glitches during CDC

---


## 📄 Full Report: Implementation Challenges

📘 [Click here to view the full PDF Report](./Common-FPGA-Implementation-Challenges.pdf)

Covers:
- Timing violations & metastability
- CDC handling techniques
- Correct and incorrect waveform analysis
- Final pixel shader with constraints

---

## 🧩 Key Learnings

| Aspect                    | Without Constraints          | With Constraints (CDC + Timing)         |
|---------------------------|------------------------------|-----------------------------------------|
| Clock Domain Handling     | Unsafe (single domain)       | Safe crossing between `clk_in` and `clk`|
| Timing Violations         | High                         | Eliminated                              |
| Metastability             | High risk                    | Greatly reduced                         |
| Simulation vs Hardware    | Mismatch                     | Stable & reliable on FPGA               |
| Waveforms                 | Glitches                     | Clean transitions                       |
| Implementation Readiness | Poor                         | FPGA-ready                              |

---

## 🔓 License

This project is licensed under the [MIT License](./LICENSE).

---

## 🙋 Author

**Kranthi Uppada**  
B.Tech ECE | Digital Design Enthusiast  
GitHub: [@kranthiuppada](https://github.com/kranthiuppada)

---

## 🙏 Thank You

This project was created to bridge RTL design and FPGA implementation best practices.  
Feel free to fork, clone, improve, and reuse with credit!


