
# Contributing to Streamlit-Analytics

We love your input! We want to make contributing to this project as easy and transparent as possible, whether it's:

- Reporting a bug
- Discussing the current state of the code
- Submitting a fix
- Proposing new features
- Becoming a maintainer

## We Develop with GitHub

We use GitHub to host code, to track issues and feature requests, as well as accept pull requests.

## We Use GitHub Flow

All code changes happen through pull requests, so we suggest you familiarize yourself with [GitHub Flow](https://guides.github.com/introduction/flow/). Pull requests are the best way to propose changes to the codebase. We actively welcome your pull requests:

1. Fork the repo and create your branch from `main`. Make sure to start your branch with the word "test/"
2. Make sure your code lints.
3. Issue that pull request!

## Any contributions you make will be under the same license as the project

In short, when you submit code changes, your submissions are understood to be under the same [license](LICENSE.md) that covers the project. Feel free to contact the maintainers if that's a concern.

## Report bugs using Github's [issues](https://github.com/444B/streamlit-analytics2/issues/new/choose)

We use GitHub issues to track public bugs. Report a bug by [opening a new issue](https://github.com/444B/streamlit-analytics2/issues/new/choose); it's that easy!

**Great Bug Reports** tend to have:

- A quick summary and/or background
- Steps to reproduce
  - Be specific!
  - Give sample code if you can.
- What you expected would happen
- What actually happens
- Notes (possibly including why you think this might be happening, or stuff you tried that didn't work)

## Use a Consistent Coding Style

- We follow the [PEP 8](https://www.python.org/dev/peps/pep-0008/) style guide for Python code.
- Ensure your code passes flake8 linting:
  ```sh
  pipenv run flake8
  ```
- Format your code with Black:
  ```sh
  pipenv run black .
  ```

## License

By contributing, you agree that your contributions will be licensed under its [License](LICENSE.md).

## Setting Up Your Development Environment

### 1. Clone the Repository
Navigate to the directory where you want to clone the repo and run:
```sh
git clone https://github.com/444B/streamlit-analytics2.git
cd streamlit-analytics2
```

### 2. Create a New Branch
Create a new branch for your work:
```sh
git checkout -b name_of_your_new_branch
```
> **IMPORTANT**: If you want to test code changes on a PyPI package, start the name of your branch with "test/". This will trigger a release to TestPyPI where you can then download and test.

### 3. Install Python and pipenv
Ensure you have Python 3.8.x installed, then install pipenv:
```sh
pip install --user pipenv
```

### 4. Create a Pipenv Environment
Set up your pipenv environment with Python 3.8 (due to Streamlit's minimum version requirement):
```sh
pipenv --python 3.8
```

### 5. Install Dependencies
Install all necessary project dependencies:
```sh
pipenv install --dev
```
> [!NOTE] this might take a few minutes, depending on your network / device.

### 6. Activate the Virtual Environment
Activate your pipenv environment:
```sh
pipenv shell
```

### 7. Run a Minimal Example
Start with running a minimal Streamlit app to ensure everything is set up correctly:
```sh
streamlit run examples/minimal.py
```

## Additional Tips

- **Troubleshooting**: If you encounter any issues, please check common pipenv errors and their solutions.
- **Making Contributions**: After testing your changes, commit them to your branch, push to your fork, and open a pull request against the main repository.
- **Environment Variables**: If the project requires specific environment variables, set them up according to the project documentation.
- **Testing and Linting**: Before submitting your pull request, ensure you run any tests and lint your code according to the project's guidelines.

Thank you for contributing to streamlit-analytics2!
