# Design and Implementation of Smart Parking Management System using Verilog

This repository contains the design and implementation of an automated Smart Parking Management System using Verilog Hardware Description Language (HDL).

## 📁 Repository Contents

- **`Parking_Sys.v`** - Complete Verilog implementation including:
  - Main module: `smart_parking` (8-slot parking management system)
  - Testbench module: `tb_smart_parking` (comprehensive simulation testbench)

- **`PROJECT_REPORT.md`** - Comprehensive professional project report including:
  - Abstract and Introduction
  - System Design and Methodology
  - Simulation Results and Analysis
  - Advantages, Applications, and Future Scope
  - Complete technical documentation

- **`Presentation.pdf`** - Project presentation slides

- **`Report.docx`** - Project report in Word format

- **`Report Template.docx`** - Report formatting template

## 🎯 Project Overview

The Smart Parking Management System automates parking lot operations by:
- **Managing 8 parking slots** with real-time occupancy tracking
- **Automating gate control** for entry and exit operations
- **Providing real-time status** of available parking spaces
- **Indicating full status** when all slots are occupied

### Key Features

✅ Synchronous sequential logic design  
✅ Automated slot allocation (first-available algorithm)  
✅ Automated slot deallocation (last-occupied algorithm)  
✅ Real-time free slot counter  
✅ Parking lot full indicator  
✅ Entry/exit gate control signals  
✅ Clock-driven operation for reliability  
✅ Asynchronous reset capability  

## 🔧 Technical Specifications

- **HDL:** Verilog (IEEE 1364-2005)
- **Design Type:** Synchronous Sequential Circuit
- **Slots:** 8 (expandable)
- **Inputs:** clk, rst, entry, exit
- **Outputs:** entry_gate, exit_gate, free_count[3:0], full
- **Implementation:** FPGA/ASIC compatible

## 🚀 Getting Started

### Prerequisites

To simulate and synthesize this design, you need one of the following:

- **Icarus Verilog** (Open-source simulator)
- **ModelSim** (Mentor Graphics)
- **Vivado** (Xilinx FPGA tools)
- **Quartus Prime** (Intel FPGA tools)

### Simulation with Icarus Verilog

```bash
# Compile the Verilog code
iverilog -o parking_sim Parking_Sys.v

# Run simulation
vvp parking_sim

# View waveforms (if VCD file is generated)
gtkwave parking_waveform.vcd
```

### Simulation with ModelSim

```tcl
# Create work library
vlib work

# Compile
vlog Parking_Sys.v

# Simulate
vsim tb_smart_parking

# Add waveforms
add wave -r /*

# Run
run -all
```

## 📊 System Architecture

```
┌─────────────────────────────────────────────┐
│         Smart Parking System                │
├─────────────────────────────────────────────┤
│  Inputs:                                    │
│  - clk (Clock)                              │
│  - rst (Reset)                              │
│  - entry (Entry Request)                    │
│  - exit (Exit Request)                      │
├─────────────────────────────────────────────┤
│  Processing:                                │
│  - 8-bit Slot Register (occupancy tracking) │
│  - Entry Logic (first-available allocation) │
│  - Exit Logic (last-occupied deallocation)  │
│  - Counter Logic (free slot calculation)    │
├─────────────────────────────────────────────┤
│  Outputs:                                   │
│  - entry_gate (Entry Gate Control)          │
│  - exit_gate (Exit Gate Control)            │
│  - free_count[3:0] (Available Slots)        │
│  - full (Parking Lot Full Status)           │
└─────────────────────────────────────────────┘
```

## 📈 Simulation Results

The testbench (`tb_smart_parking`) simulates:
1. **System Reset** - Initializes all slots to free
2. **8 Entry Operations** - Fills all parking slots
3. **Full Status Verification** - Confirms full signal assertion
4. **2 Exit Operations** - Frees slots
5. **Status Updates** - Verifies real-time counter updates

Expected behavior:
- Free count: 8 → 7 → 6 → ... → 0 (during entries) → 1 → 2 (during exits)
- Full status: Asserts when free_count = 0
- Gates: Pulse for one clock cycle during operations

## 🎓 Applications

- Shopping malls and retail centers
- Office complexes
- Airports and railway stations
- Hospitals and healthcare facilities
- Educational institutions
- Residential apartment complexes
- Public parking lots
- Event venues

## 📚 Documentation

For detailed information, please refer to:
- **[PROJECT_REPORT.md](PROJECT_REPORT.md)** - Complete technical documentation with:
  - Design methodology
  - Logic flow diagrams
  - Simulation analysis
  - Advantages and applications
  - Future enhancements
  - References and appendices

## 🔮 Future Enhancements

- Multi-level parking support
- RFID/ANPR integration
- IoT connectivity
- Mobile app integration
- Payment system integration
- EV charging slot management
- Machine learning-based optimization
- Cloud-based monitoring

## 👥 Team

[Team Member Names and Register Numbers]

**Guided by:** [Guide Name]  
**Institution:** [Institution Name]

## 📄 License

This project is developed as part of academic coursework.

## 🤝 Contributing

This is an academic project. For suggestions or improvements, please open an issue.

## 📞 Contact

For queries regarding this project, please contact the team members or the project guide.

---

**Note:** This is an educational project demonstrating Verilog HDL design principles and digital system implementation.
