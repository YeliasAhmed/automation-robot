# 🚀 Robot Framework UI Automation Project

This project is a complete **Robot Framework test automation setup** for testing the [SauceDemo](https://www.saucedemo.com) web application using SeleniumLibrary.

---

## 📁 Project Structure

automation-robot/
│
├── config/                # Environment-specific YAML configs
├── data/                  # Test data files
├── keywords/              # Custom reusable Robot keywords
├── libraries/             # Custom Python libraries
├── resources/             # Locators and variables
├── tests/                 # Test suites (UI, API, etc.)
├── results/               # Test reports and logs
└── requirements.txt       # Dependencies

---

## 🧠 How the Framework Works

| Layer | Purpose |
|-------|----------|
| **config/** | Stores environment URLs, credentials, browsers |
| **libraries/** | Python modules (e.g., load YAML configs) |
| **resources/** | Locators and constants shared by keywords |
| **keywords/** | Business logic: reusable steps like “Login” |
| **tests/** | Final `.robot` test suites combining keywords |
| **results/** | Auto-generated reports and logs after test run |

---

## ⚙️ Setup Instructions

###  Clone the Repository
```bash
git clone https://github.com/yeliasahmed/automation-robot.git
cd automation-robot
```

## Create and Activate a Virtual Environment

```bash
python -m venv .venv
```

###  Activate the Environment

Mac / Linux:

```bash
source .venv/bin/activate
```

Windows (PowerShell or CMD):

```angular2html
.venv\Scripts\activate
```

## Install Dependencies

### 📦 Requirements

All dependencies for this project are listed in the `requirements.txt` file.

```txt
# --- Core Robot Framework ---
robotframework>=7.0,<8.0

# --- Web UI Automation ---
robotframework-seleniumlibrary>=6.1.0,<7.0
webdriver-manager>=4.0.0,<5.0.0

# --- API Testing ---
robotframework-requests>=0.9.5,<1.0.0

# --- Data-Driven Testing ---
robotframework-datadriver>=1.7.0,<2.0.0

# --- Parallel Execution ---
robotframework-pabot<6.4

# --- Allure Reporting ---
allure-robotframework>=2.9.0,<3.0.0

# --- Config / Utilities ---
PyYAML>=6.0,<7.0
```

Inside the activated virtual environment, install all required packages:
```bash
pip install -r requirements.txt
```

### Verify Installation
```bash
robot --version
```
You should see something like:

     Robot Framework 7.x (Python 3.x)

## Running Tests

### Run the UI Test Suite

Run the login test suite and store the results under the results/ directory:

```angular2html
robot --outputdir results tests/ui/login_tests.robot
```

Run the test in specific env

```angular2html
robot --variable ENV:dev --outputdir results tests/ui/login_tests.robot
```

**Run All Tests in Parallel**
```angular2html
pabot --variable ENV:qa --processes 3 --outputdir results tests/
```

## View Test Results

After execution, open the results folder:

    results/report.html
    results/log.html