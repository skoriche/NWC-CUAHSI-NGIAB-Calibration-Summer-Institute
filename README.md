# NWC-CUAHSI Summer Institute 2025 Workshop: Hydrological Model Calibration in the NGIAB Ecosystem

[![Workshop](https://img.shields.io/badge/Workshop-NWC--CUAHSI%20Summer%20Institute-blue?labelColor=555)](https://www.cuahsi.org/summer-institute)
[![NextGen](https://img.shields.io/badge/NextGen-Framework-green.svg)](https://github.com/NOAA-OWP/ngen)
[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED.svg)](https://docs.docker.com/engine/install/)

**"How do I calibrate and share the calibrated parameters in a NextGen Framework ecosystem"**

* **📅 Date**: Thursday, June 18, 2025
* **⏰ Time**: Wednesday, June 18 | 10:45 – 12 pm CT
* **📍 Location**: Cyber Hall GWSC classroom, Room number 1160, 248 Kirkbride Ln, Tuscaloosa, AL 35401
* **🏛️ Organized by**: [CUAHSI](https://www.cuahsi.org/summer-institute) and [The University of Alabama](https://ciroh.ua.edu/devconference/)

---

## 👥 Instructors 

This `GitHub repository`, which serves as the central hub for all workshop materials, tools, detailed instructions, pre-conference and other relevant information, was prepared and is maintained by [Sifan A. Koriche](https://github.com/skoriche) and [Josh Cunningham](https://github.com/JoshCu).

## 🚀 Quick Start

**Ready to jump in?** Choose your path:

| I want to... | Go to... |
|--------------|----------|
| **Start calibrating immediately** | [**🚀 Quickstart Guide**](../../wiki/Quickstart-Guide) |
| **Understand the process first** | [📚 Step-by-Step Instructions](../../wiki/Step-by-Step-Instructions) |
| **Learn about NextGen** | [🔍 What is NextGen?](../../wiki/What-is-NextGen) |
| **Modify the code** | [⚙️ Development Setup](../../wiki/Development-Setup) |

---

## 🎯 Workshop Purpose

This hands-on workshop provides comprehensive guidance for hydrological model calibration, regionalization, and parameter sharing within the NextGen In A Box (NGIAB) ecosystem. You'll gain practical experience using open-source tools with pre-configured datasets.

### What You'll Learn

- ✅ **Model Calibration Fundamentals** - Theory and practice of improving hydrological model accuracy
- ✅ **Hands-on NextGen Experience** - Complete calibration workflows using real tools and data
- ✅ **Parameter Management** - Share and collaborate on calibrated parameters effectively
- ✅ **Best Practices** - Learn from experts and discuss real-world challenges

### Workshop Workflow

![Workshop Workflow](./Information/figures/Workflow-Figure.png)

*Figure 1: End-to-end visual representation of the NextGen In A Box (NGIAB) ecosystem's hydrological simulation workflow, detailing phases for data preparation, model simulation, parameter calibration, and output analysis steps. 1) Python CLI data preparation modules for NGIAB, 2a) NGIAB Docker image, 2b) NGIAB-cal Docker image + Python CLI for Calibration, and 3) TEEHR evaluation + visualizer*

*[graphics by Sifan A. Koriche]*

---

## 🛠️ Prerequisites

**For Jetstream Virtual Machines:**
- Access to provided Jetstream Virtual Machines (instructions emailed before workshop)
- All required software installed (e.g., Docker, UV)
- Pre-installed data at `/home/exouser/workshop/calibration/provo-10154200`

**For Local Setup:**
- Download workshop data: `https://communityhydrofabric.s3.us-east-1.amazonaws.com/example_data/provo-10154200.tar.gz` [Click Here to Download](https://communityhydrofabric.s3.us-east-1.amazonaws.com/example_data/provo-10154200.tar.gz)

**Minimum Requirements:**
- [Docker](https://docs.docker.com/engine/install/) (for running containerized tools)
- [UV](https://docs.astral.sh/uv/getting-started/installation/) (Python package manager)

> 📋 **For complete setup instructions and requirements**: [Pre-Workshop Checklist](../../wiki/Pre-Workshop-Checklist)


---

## 📚 Workshop Resources

### 🚀 Get Started
- [**Quickstart Guide**](../../wiki/Quickstart-Guide) - Start calibrating in 5 minutes
- [Step-by-Step Instructions](../../wiki/Step-by-Step-Instructions) - Detailed tutorial
- [Workshop Materials](../../wiki/Workshop-Materials) - Slides and datasets

### 🔧 Understanding the Tools
- [What is NextGen?](../../wiki/What-is-NextGen) - Framework overview
- [Tools and Modules](../../wiki/Tools-and-Modules) - Component explanations
- [Workflow Process](../../wiki/Workflow-Process) - How everything connects

### 🔬 Advanced Topics
- [Development Setup](../../wiki/Development-Setup) - Modify and extend tools
- [Directory Structure](../../wiki/Directory-Structure) - File organization reference

### 📞 Support
- [Troubleshooting](../../wiki/Troubleshooting) - Common issues and solutions
- [Contact Information](../../wiki/Contact-and-Acknowledgment) - Get help and support
- [GitHub Issues](https://github.com/skoriche/NGIAB-Calibration-DevCon25/issues) - Report bugs or ask questions

---

## 🏃‍♂️ 5-Minute Start

**On Jetstream VMs:**
```bash
cd /home/exouser/workshop/calibration/
uvx ngiab-cal provo-10154200 -g 10154200 --run -i 4
```

**On Local Systems:**
```bash
wget https://communityhydrofabric.s3.us-east-1.amazonaws.com/example_data/provo-10154200.tar.gz
tar -xzf provo-10154200.tar.gz
uvx ngiab-cal provo-10154200 -g 10154200 --run -i 4
```

That's it! Your first calibration will complete in ~10-15 minutes.

> 🔍 **Want details?** See the [Quickstart Guide](../../wiki/Quickstart-Guide) for complete instructions.

---

## 🧩 The NGIAB Ecosystem

This workshop uses four integrated tools:

| Tool | Purpose | Type |
|------|---------|------|
| [**NGIAB-Data-Preprocess**](https://github.com/CIROH-UA/NGIAB_data_preprocess/tree/a6dd733f637cb56ce42a43204db69e3cefa2a61a) | Prepare hydrofabric and forcing data | Python CLI |
| [**NGIAB-Cal**](https://github.com/CIROH-UA/ngiab-cal/tree/19d5ded2ae365f333b0ac6a971c2e7028c7014a4) | Configure and run calibration | Python CLI |
| [**NGIAB**](https://github.com/CIROH-UA/NGIAB-CloudInfra/tree/41570096a5273393f2e3a0121d02e643bc6ce34d) | NextGen framework container | Docker Image |
| [**NGEN-Cal**](https://github.com/CIROH-UA/ngen-cal/tree/f450a9d2e992adf0e110711c559551623b73932d) | Calibration algorithms and analysis | Docker Image |

> 🔧 **Learn more**: [Tools and Modules](../../wiki/Tools-and-Modules)

---

## 📖 What is NextGen?

The **Next Generation Water Resources Modeling Framework (NextGen)** is a model-agnostic, standards-based framework that enables:

- **🔗 Model Interoperability** - Connect different hydrological models seamlessly
- **🏗️ Standards-Based Design** - Consistent interfaces and data formats
- **🌐 Multi-language Support** - C++, C, Fortran, Python models
- **☁️ Flexible Deployment** - Cloud, HPC, or local environments

> 📚 **Learn more**: [What is NextGen?](../../wiki/What-is-NextGen)

---

## 🏗️ For Developers

### Quick Development Setup

```bash
# Clone and setup
git clone https://github.com/skoriche/NGIAB-Calibration-DevCon25.git
cd NGIAB-Calibration-DevCon25
./dev_install.sh
```

### What You Can Modify

| Modify | Tool to Change | Also Update |
|--------|---------------|-------------|
| Data processing, forcing inputs | `ngiab_data_preprocess` | - |
| Calibration CLI, default configs | `ngiab-cal` | - |
| NextGen core, add models | `NGIAB-CloudInfra` | - |
| Calibration algorithms | `ngen-cal` | `NGIAB-CloudInfra` |

> ⚙️ **Complete guide**: [Development Setup](../../wiki/Development-Setup)

---

## 🤝 Getting Help

- **During the Workshop**: Ask instructors and assistants
- **Common Issues**: See [Troubleshooting Guide](../../wiki/Troubleshooting)
- **Questions/Bugs**: [Open GitHub Issues](https://github.com/skoriche/NGIAB-Calibration-DevCon25/issues)
- **Email**: [sakoriche@ua.edu](mailto:sakoriche@ua.edu), [jcunningham8@ua.edu](mailto:jcunningham8@ua.edu)

---

## 📝 License and Acknowledgment

The Summer Institute is a partnership between CUAHSI, and the University of Alabama that aims to engage the academic community in research to advance water prediction and flood forecasting. The tools, workflows, and concepts presented in this workshop build upon the significant efforts and contributions of several key groups and individuals. We gratefully acknowledge:

- The development of the `NextGen In A Box (NGIAB) ecosystem` is a central initiative of `CIROH-UA`, with key development contributions from the `AWI Science and Technology Team`.
- The core `NGEN-Cal tool`, fundamental to the calibration processes showcased, was developed by the `NOAA Office of Water Prediction (NOAA-OWP)` in collaboration with `Lynker`.
- The `NGEN-Cal calibration workflow`, initially developed by `Xia Feng`, was subsequently refactored and integrated to operate within the NGIAB ecosystem by `Josh Cunningham`, with crucial domain science contributions from `Sifan A. Koriche, Md Shahabul Alam, and James Halgren`.
- This `GitHub repository`, which serves as the central hub for all workshop materials, tools, detailed instructions, pre-conference and other relevant information, was prepared and is maintained by `Sifan A. Koriche and Josh Cunningham`.

---

**🚀 Ready to start?** Jump to the [**Quickstart Guide**](../../wiki/Quickstart-Guide) now!
