#!/bin/bash

# -------- Docker --------
if ! command -v docker >/dev/null; then
    echo "Installing Docker..."
    sudo apt update
    sudo apt install -y docker.io
else
    echo "Docker already installed"
fi

# -------- Docker Compose --------
if ! command -v docker-compose >/dev/null; then
    echo "Installing Docker Compose..."
    sudo apt install -y docker-compose
else
    echo "Docker Compose already installed"
fi

# -------- Python --------
if ! command -v python3 >/dev/null; then
    echo "Installing Python3..."
    sudo apt install -y python3
else
    echo "Python3 already installed"
fi

# -------- pip --------
if ! command -v pip3 >/dev/null; then
    echo "Installing pip3..."
    sudo apt install -y python3-pip
else
    echo "pip3 already installed"
fi

# -------- Django --------
if ! python3 -m pip show django >/dev/null 2>&1; then
    echo "Installing Django..."
    pip3 install Django --user
else
    echo "Django already installed"
fi

# -------- torch --------
if ! python3 -m pip show torch >/dev/null 2>&1; then
    echo "Installing torch + torchvision + pillow..."
    pip3 install torch torchvision pillow --user
else
    echo "torch/torchvision/pillow already installed"
fi

echo "All tools installed!"
