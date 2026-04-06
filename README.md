# Generate SVG Workflow (AutoFigure)

This project contains scripts to automate generating figures and SVGs from method descriptions utilizing Language Models and visual segmentation APIs.

## Prerequisites

- Python 3.12+ (managed via `uv` or `conda`/`venv`)
- API Keys for Gemini, HuggingFace (RMBG-2.0), and optionally Roboflow SAM3.

## Environment Setup

### 1. Configure the `.env` file

First, create a `.env` file from the example template and fill in your API keys:

```bash
cp .env.example .env
```

Ensure your `.env` contains valid tokens for `GEMINI_API_KEY`, `HF_TOKEN`, etc.

### 2. Create the Virtual Environment and Install Dependencies

We use `uv` for lightning-fast package management.

```bash
# Create a virtual environment
uv venv

# Activate the virtual environment (Windows/PowerShell)
.venv\Scripts\activate
# OR on Linux/macOS
# source .venv/bin/activate

# Install the required dependencies
uv pip install -r requirements.txt
```

*(Note: If you run into dependency resolution issues with Pandas and Numpy, make sure you are using a Python 3.12 environment, and install dependencies via `uv pip install -r requirements.txt` rather than `uv add`).*

## Usage

You can run the full process by executing the `autofigure2.py` script.

**Basic execution:**

```bash
uv run autofigure2.py --method_file .\inputs\21.txt --output_dir outputs
```

- `--method_file`: The path to the text file containing the input instructions/method details.
- `--output_dir`: The directory where the generated intermediate images, JSON files, and final SVG output will be stored.

### Batch Processing (Inputs 21-40)

To test processing on multiple input files spanning the range `21.txt` to `40.txt`, you can use the provided batch scripts instead of running the python command manually for each. Ensure your virtual environment is activated before running these scripts.

**For Windows (PowerShell):**

```powershell
.\run.ps1
```

**For Linux / macOS (Bash):**

First, make the script executable, then run it:

```bash
chmod +x run.sh
./run.sh
```
