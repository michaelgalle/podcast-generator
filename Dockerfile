FROM ubuntu:latest

# Install system dependencies
RUN apt-get update && apt-get install -y \
  python3.10 \
  python3-pip \
  git \
  python3-yaml \
  python3-venv  # Ensure virtual environments can be created

# Create a virtual environment
RUN python3 -m venv /venv

# Upgrade pip inside teh virtual environment
RUN /venv/bin/pip install --upgrade pip

# Install python dependencies inside the virtual environment
RUN /venv/bin/pip install pyyaml 

# Copy application files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set the virtual environemnt as the default Python environment
ENV PATH="/venv/bin:$PATH"
ENTRYPOINT ["/entrypoint.sh"]