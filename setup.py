import re
from pathlib import Path

from setuptools import find_packages, setup

here = Path(__file__).resolve().parent

# Read version from streamlit_analytics2/__init__.py
version_re = r"^__version__ = ['\"]([^'\"]*)['\"]"
init_text = (here / "streamlit_analytics2" / "__init__.py").read_text()
version = re.findall(version_re, init_text)[0]

# Corrected path for README.md
readme_path = here / ".github" / "README.md"  # Updated path to the .github folder
if readme_path.exists():
    long_description = readme_path.read_text()
else:
    long_description = "Track & visualize user interactions with your streamlit app"  # Fallback description

setup(
    name="streamlit-analytics2",  # Corrected package name to be a string
    version=version,
    author="444B",  # Update with your name
    author_email="contact+pypi@444b.me",  # Update with your email
    description="Track & visualize user interactions with your streamlit app",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/444B/streamlit-analytics2",  # Update with the correct URL
    license="MIT",
    python_requires=">=3.8",
    packages=find_packages(exclude=("tests*", "docs", "examples*", "images/")),
    include_package_data=True,
    install_requires=[
        "streamlit >= 1.30.0",
        "pandas",
        "altair",
        "google-cloud-firestore",
    ],
    classifiers=[
        "Programming Language :: Python :: 3.8",
        "Operating System :: OS Independent",
        "License :: OSI Approved :: MIT License",
        "Intended Audience :: Developers",
    ],
)
