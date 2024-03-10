#!/bin/bash

# Initial Setup
if [ ! -f "run_checks.sh" ]; then
    echo "Please run this script from the tests directory."
    exit 1
fi

set +e  # Continue on errors

# Lists to keep track of passed and failed tests
passed_tests=()
failed_tests=()

# Define directories to check
directories="../src/ ../examples/"

# Timestamp for results file
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
filename="test_results_$timestamp.md"

echo '```go' > $filename

# Function to run checks
run_check() {
    echo "Running $1..."
    $2 $directories 2>&1
    if [ "$?" -ne 0 ]; then
        echo "$1 failed."
        failed_tests+=("$1")
    else
        echo "$1 completed successfully."
        passed_tests+=("$1")
    fi
}

{
# Optionally activate your virtual environment
# source ../path/to/your/venv/bin/activate

# Run checks
run_check "Black" "black --check"
run_check "isort" "isort --check-only"
run_check "Flake8" "flake8"
run_check "mypy" "mypy --config-file ../mypy.ini"
run_check "Bandit" "bandit -r"
# run_check "pytest" "pytest ../ --cov=../src/"

# Summary
echo "Test Summary:"
if [ ${#failed_tests[@]} -ne 0 ]; then
    echo "Failed tests:"
    printf ' - %s\n' "${failed_tests[@]}"
else
    echo "All tests passed!"
fi

if [ ${#passed_tests[@]} -ne 0 ]; then
    echo "Passed tests:"
    printf ' - %s\n' "${passed_tests[@]}"
fi

} | tee -a $filename

echo '```' >> $filename

# Optionally deactivate your virtual environment
# deactivate

# Exit with non-zero status if there were any failures
if [ ${#failed_tests[@]} -ne 0 ]; then
    exit 1
fi
