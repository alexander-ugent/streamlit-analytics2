#!/bin/bash

# check that the user is in the tests dir/
if [ ! -f "run_checks.sh" ]; then
    echo "Please run this script from the tests directory."
    exit 1
fi

# Allow script to continue running even if errors occur
set +e

# Generate a timestamp
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# create a markdown file to store the results
filename="test_results_$timestamp.md"

# Optionally activate your virtual environment
# source ../path/to/your/venv/bin/activate

# prepent a go syntax to the file in order to incease readability
echo '```go' > $filename

{
echo "Running Black..."
black ../src --check --verbose 2>&1
echo -e "Complete.\n"

echo "Sorting imports with isort..."
isort ../src --check-only --verbose --diff 2>&1
echo -e "Complete.\n"

echo "Linting with Flake8..."
flake8 ../src 2>&1
echo -e "Complete.\n"

echo "Static type check with mypy..."
mypy ../src 2>&1
echo -e "Complete.\n"

echo "Checking for security issues with bandit..."
bandit -r ../src 2>&1
echo -e "Complete.\n"

echo "Running pytest with coverage..."
# Adjust this command based on your pytest setup and directories
pytest ../ 2>&1
echo -e "Complete.\n"

# Optionally deactivate virtual environment if activated earlier
# deactivate

echo "All checks passed! Read the log file for more details."
} | tee -a $filename

echo '```' >> $filename

# Optionally deactivate virtual environment if activated earlier
# deactivate
