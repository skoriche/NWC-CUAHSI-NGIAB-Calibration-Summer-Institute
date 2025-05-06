# NGIAB Calibration Workshop @ CIROH DevCon 2025

**Repository Name:** `NGIAB-Calibration-DevCon25`

Welcome to the GitHub repository for the CIROH DevCon 2025 workshop: **"How do I calibrate, regionalize and share the calibrated parameters in a NextGen Framework ecosystems"**.

This repository provides all the necessary resources, tools (via submodules), data links, and instructions to participate in the hands-on session focused on calibrating Next Generation Water Resources Modeling framework (NextGen) models [in a NextGen In A Box (NGIAB) Ecosystem].

**Workshop Goal:** To provide participants with practical skills in calibrating hydrological models within the NextGen framework using open-source tools, theoretical understanding of regionalization techniques, and how to share/manage calibrated parameters.

*(Note: This workshop is based on tools and workflows under active development. Instructions and code may be updated before the event.)*

---

## Table of Contents

* [Data](#data)
* [Premade Data Package](#premade-data-package)
* [Expected Calibration Folder Structure](#expected-calibration-folder-structure)
* [Workshop Slides](#workshop-slides)
* [Tools and Workflows (Submodules)](#tools-and-workflows-submodules)
* [Workshop Instructions](#workshop-instructions)
* [Development Setup Instructions](#development-setup-instructions)
* [License](#license)
* [Contact](#contact)

---

## Data

This workshop requires hydrological model forcing data and hydrofabric information.

* **Hydrofabric:** We will use the [v2.2 CONUS Hydrofabric](https://lynker-spatial.s3-us-west-2.amazonaws.com/hydrofabric/v2.2/conus/conus_nextgen.gpkg). More information on the data model and sources can be found [here](https://lynker-spatial.s3-us-west-2.amazonaws.com/hydrofabric/v2.2/hfv2.2-data_model.html).
* **Forcings:** The `tools/NGIAB_data_preprocess` tool (`NGIAB_data_preprocess`) is designed to process various forcing datasets sources. For this workshop, we aim to use:
    * [AORC 1km gridded data](https://noaa-nws-aorc-v1-1-1km.s3.amazonaws.com/index.html)
    * Alternatively, [NWM Retrospective v3 forcing data](https://noaa-nwm-retrospective-3-0-pds.s3.amazonaws.com/index.html#CONUS/zarr/forcing/) could be used.
* **Preparation:** The `NGIAB_data_preprocess` tool (included as a submodule in `tools/NGIAB_data_preprocess`) is used to subset the hydrofabric and prepare forcing data for a specific catchment and time period, creating a run package [realization and configuration files] suitable for NGIAB.

---

## Premade Data Package

[**Placeholder: Premade Data Package Section**]

To streamline the workshop and ensure everyone starts with the same inputs, a pre-processed data package containing the necessary hydrofabric subset and AORC forcing data for the example catchment will be provided.

* **Download Link:** \[**Placeholder: Add direct download link (e.g., Zenodo, Google Drive, S3) here when available.**]
* **Contents:** \[**Placeholder: Briefly describe contents, e.g., "Contains subsetted hydrofabric GeoPackage and prepared AORC forcing data in Zarr/NetCDF format for gauge ID XXXXXXX covering YYYY-MM-DD to YYYY-MM-DD."**]
* **Extraction:** Please download this package and extract its contents into a known location before starting the hands-on exercises. The workshop instructions will refer to the location of this data.

---

## Expected Calibration Folder Structure

The calibration workflow operates on a specific directory structure. Running the setup tool from `tools/ngiab_cal_Prep` (Workshop Step 3) should help create the initial structure. Here is an *example* of what the structure might look like *after* a calibration run, using `provo_cal_test_AORC` as the main directory name:

```
provo_cal_test_AORC/          # Main calibration directory (user-named)
├── calibration/
│   └── Output/
│       ├── Calibration_Run/
│       │   ├── ngen__XXXXXXXX_worker/ # Example worker output folder name
│       │   │   ├── Output_Calib/      # Calibration results files
│       │   │   ├── Output_Iteration/  # Per-iteration outputs
│       │   │   └── Plot_Iteration/    # Per-iteration plots
│       │   └── ... (other parallel workers if applicable) ...
│       └── Validation_Run/            # Optional validation output (if run)
├── config/
│   └── cat_config/              # Catchment configuration
│       ├── CFE/                 # Configuration for CFE model component
│       └── NOAH-OWP-M/          # Configuration for Noah-OWP-Modular component
├── forcings/                    # Input forcing data (symlinked or copied here)
├── metadata/                    # Metadata files related to the run
└── outputs/                     # General NGen simulation outputs (if run outside calibration)
    ├── ngen/
    └── troute/
```

*(Note: This structure is illustrative and based on a draft. The exact layout, especially within `calibration/Output`, might differ based on the final versions of the calibration tools.)*

---

## Workshop Slides

[**Placeholder: Workshop Slides Section**]

The presentation slides for this workshop session will be available for download.

* **Filename:** \[**Placeholder: Add the exact filename of the slides, e.g., `CIROH_DevCon25_NGIAB_Calibration.pdf`**]
* **(Location):** *(Assuming the file will be placed in a `slides/` directory within this repository)* You can find the file in the `slides/` directory.

---

## Tools and Workflows (Submodules)

This repository utilizes Git submodules to incorporate external tools and workflows developed by the community. You **must** clone this repository recursively or initialize submodules after cloning (see [Development Setup Instructions](#development-setup-instructions)) to obtain the necessary code.

* **`tools/NGIAB_data_preprocess`** (`NGIAB_data_preprocess`)
    * **URL:** `https://github.com/CIROH-UA/NGIAB_data_preprocess.git` (Branch: `main`)
    * **Purpose:** Provides command-line tools (`ngiab_data_cli`) for fetching hydrofabric subsets and preparing forcing data into an NGIAB-compatible run package.
* **`tools/ngiab_cal_Prep`** (`ngiab_cal`)
    * **URL:** `https://github.com/CIROH-UA/ngiab_cal.git` (Branch: `main`)
    * **Purpose:** Provides configuration templates and helper scripts/tools for setting up the specific directory structure and configuration files required by the calibration workflow.
* **`tools/NGIAB-CloudInfra`** (`NGIAB-CloudInfra`)
    * **URL:** `https://github.com/CIROH-UA/NGIAB-CloudInfra.git` (Branch: `main`)
    * **Purpose:** Contains the Dockerfile and associated resources needed to build the `awiciroh/ciroh-ngen-image:latest` Docker image, which provides the NGIAB runtime environment.
* **`tools/ngen-cal`** (`ngen-cal`)
    * **URL:** `https://github.com/CIROH-UA/ngen-cal.git` (Branch: `ngiab_cal`)
    * **Purpose:** Contains the core Python code and workflows (`ngiab-cal` package) for performing automated calibration of NGen models running within the NGIAB ecosystem.

---

## Workshop Instructions

*(Draft - Requires final commands and workflow confirmation)*

Please follow these steps during the workshop's hands-on session:

1.  **Setup Environment:**
    * Ensure you have successfully completed all steps in the [Development Setup Instructions](#development-setup-instructions) section *before* the workshop begins. This includes cloning the repository with submodules, building the Docker image, and setting up the Python environment.
    * Activate your Python virtual environment (e.g., `source .venv/bin/activate`).
    * Download the [Premade Data Package](#premade-data-package) (link TBD) and extract it to a convenient location you can easily access. Note the full path to the extracted data.

2.  **Prepare/Review Input Data (using `tools/NGIAB_data_preprocess`):**
    * *(Workshop Focus)*: We will primarily use the [Premade Data Package](#premade-data-package) for consistency. Take a moment to explore the contents of the downloaded package (e.g., the hydrofabric GeoPackage, the forcing data).
    * *(Optional/Reference)*: If you were to generate data yourself using the included tool, the command would look something like this (requires the `ngiab_data_preprocess` package installed in your environment):
        ```bash
        # Example: Prepare data for USGS gage 10154200 for Jan-Feb 2022 using AORC source
        # Output folder named 'cal_demo_run_package'
        uv run --from ngiab_data_preprocess cli -i gage-10154200 --start 2022-01-01 --end 2022-02-28 -sfr --source aorc -o cal_demo_run_package

        # Note: 'uv run --from ...' automatically handles the environment if the package provides the 'cli' script.
        # Alternatively, if installed directly: python -m ngiab_data_cli ...
        ```

3.  **Setup Calibration Directory (using `tools/ngiab_cal_Prep`):**
    * Use the scripts/tools provided in the `tools/ngiab_cal_Prep` submodule to create the main calibration directory (e.g., `provo_cal_test_AORC`) and populate it with the necessary configuration file templates based on your prepared input data package.
    * **Command:** \[**Placeholder: Add the specific command(s) needed to run the setup script from tools/ngiab_cal_Prep. Example: `python tools/ngiab_cal_Prep/setup_tool.py --input_package /path/to/premade_data --output_dir ./provo_cal_test_AORC --template default`**]

4.  **Run Calibration (using Docker & `ngen-cal`):**
    * Navigate into the main calibration directory you just created (e.g., `cd provo_cal_test_AORC`).
    * Execute the calibration run using the NGIAB Docker image built during setup. This command typically mounts your local calibration directory (containing configs and links to data) into the container and then initiates the NGen calibration process.
        ```bash
        # Ensure you replace '/full/path/to/your/provo_cal_test_AORC' with the correct ABSOLUTE path
        docker run -it --rm \
          -v "/full/path/to/your/provo_cal_test_AORC:/ngen/ngen/data" \
          --user $(id -u):$(id -g) \
          awiciroh/ciroh-ngen-image:latest \
          [**Placeholder: Add command/entrypoint arguments needed inside the container to start the calibration run. Example: `/start_calibration.sh --config /ngen/ngen/data/config/main_config.yml`**]
        ```
    * *(Alternative Execution Note)*: The core calibration logic is in the `ngen-cal-4NGIAB` package. While the primary workshop method uses Docker, the package might be runnable directly via `uv run ngiab-cal ...` for debugging or specific tasks, likely requiring the NGIAB environment or extensive mocking.

5.  **Review Results:**
    * Once the Docker command finishes, explore the output files generated within your local calibration directory, primarily under the `calibration/Output/Calibration_Run/` subdirectories. Examine the parameter evolution, performance metrics, and plots if generated.

---

## Development Setup Instructions

Follow these steps **before** the workshop to prepare your computer.

**1. Prerequisites:**

* **Git:** Essential for cloning the repository and managing submodules. ([Installation Guide](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git))
* **Docker:** Required for building and running the containerized NGIAB environment. ([Installation Guide](https://docs.docker.com/engine/install/)) Please ensure the Docker service/daemon is running before proceeding.
* **Python:** Python version 3.9 or newer is recommended. ([Download](https://www.python.org/downloads/))
* **`uv` (Highly Recommended):** A modern, fast Python package installer and virtual environment manager. Instructions and examples use `uv`. ([Installation Guide](https://github.com/astral-sh/uv#installation)) If you cannot use `uv`, standard `pip` and `venv` can be used, but you may need to adapt commands slightly.
* **Operating System:** Designed primarily for Linux and macOS. Windows users should use the Windows Subsystem for Linux (WSL2) for compatibility, especially with Docker.

**2. Clone the Repository with Submodules:**

Open your terminal, navigate to where you want to store the project, and run:

```bash
# Replace '[**Placeholder: Add actual repository URL here**]' with the actual URL
# Example: git clone --recurse-submodules [https://github.com/skoriche/NGIAB-Calibration-DevCon25.git](https://github.com/skoriche/NGIAB-Calibration-DevCon25.git)
git clone --recurse-submodules [**Placeholder: Add actual repository URL here**]
cd NGIAB-Calibration-DevCon25
```
*(The `--recurse-submodules` flag ensures all the code from the tools in the `tools/` directory is downloaded immediately.)*


**3. Build the NGIAB Docker Image:**

This command builds the container image that provides the NGIAB runtime environment.

```bash
# Navigate to the Dockerfile location within the submodule
cd tools/NGIAB-CloudInfra/docker

# Build the image (this may take considerable time and download ~10-20 GB)
docker build -f Dockerfile -t awiciroh/ciroh-ngen-image:latest . --no-cache

# Return to the main repository directory
cd ../../..
```
Verify the build completed successfully before proceeding.


**4. Set up Python Environment and Install Tools:**

We strongly recommend using a dedicated Python virtual environment.

* **Using `uv` (Recommended):**
    ```bash
    # Create a virtual environment named '.venv' in the project root
    uv venv

    # Activate the environment:
    # Linux/macOS:
    source .venv/bin/activate
    # Windows (Command Prompt):
    # .venv\Scripts\activate.bat
    # Windows (PowerShell):
    # .\.venv\Scripts\Activate.ps1
    # (Your terminal prompt should change to indicate the active environment)

    # Install the Python tools from the submodules:
    # [**Placeholder: Confirm if these packages are installable via '-e'**]
    echo "Installing tools from submodules..."
    uv pip install -e ./tools/NGIAB_data_preprocess
    uv pip install -e ./tools/ngen-cal
    # [**Placeholder: Add 'uv pip install -e ./tools/ngiab_cal_Prep' if it's also a package**]

    # Install any additional top-level dependencies for notebooks, etc.:
    # [**Placeholder: Create a requirements.txt or pyproject.toml if needed and uncomment below**]
    # echo "Installing additional dependencies..."
    # uv pip install -r requirements.txt
    # OR if using pyproject.toml for dependencies:
    # uv pip sync pyproject.toml

    echo "Python environment setup complete."
    ```

* **Using `venv` and `pip` (Alternative):**
    ```bash
    # Create a virtual environment
    python -m venv .venv

    # Activate the environment (see commands above)
    source .venv/bin/activate # Or Windows equivalent

    # Install the Python tools from the submodules:
    # [**Placeholder: Confirm if these packages are installable via '-e'**]
    echo "Installing tools from submodules..."
    pip install -e ./tools/NGIAB_data_preprocess
    pip install -e ./tools/ngen-cal
    # [**Placeholder: Add 'pip install -e ./tools/ngiab_cal_Prep' if it's also a package**]


    # Install any additional top-level dependencies:
    # [**Placeholder: Create requirements.txt if needed and uncomment below**]
    # echo "Installing additional dependencies..."
    # pip install -r requirements.txt

    echo "Python environment setup complete."
    ```

**[Placeholder: Development Python Setup Confirmation Needed]**
    * Confirm whether the submodules tools/data_prep, tools/ngen_cal_4NGIAB, and potentially tools/ngiab_cal_Prep are indeed Python packages installable in editable mode (-e).
    * List any additional Python libraries needed directly for the workshop (e.g., jupyterlab, pandas, matplotlib, geopandas) so a requirements.txt or pyproject.toml can be created and the installation commands finalized.


---

## License

Copyright (c) 2025 Sifan A. Koriche

This repository and its contents are licensed under the **MIT License**. See the [LICENSE](LICENSE) file for the full license text.

Note that the submodules included in the `tools/` directory are separate repositories and have their own licenses, which can typically be found within their respective directories or source repositories.

---

## Contact

For questions regarding this workshop, the materials, or the tools, please use one of the following methods:

* **Open an Issue:** The preferred method for questions, bug reports, or suggestions related to this repository is to [open an issue on GitHub](https://github.com/skoriche/NGIAB-Calibration-DevCon25/issues).
* **Email:** For direct contact, you can reach out to `sakoriche@ua.edu`.

---