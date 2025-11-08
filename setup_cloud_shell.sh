#!/bin/bash
# Quick setup script for Google Cloud Shell

echo "🚀 Setting up CodeAssist on Google Cloud Shell..."

# Check if HF_TOKEN is set
if [ -z "$HF_TOKEN" ]; then
  echo "⚠️  Please set your HuggingFace token first:"
  echo "export HF_TOKEN='your_token_here'"
  exit 1
fi

# Install UV package manager
echo "📦 Installing UV..."
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.cargo/env

# Start Docker if not running
echo "🐳 Checking Docker..."
sudo service docker start 2>/dev/null || echo "Docker already running or not available"

# Install dependencies
echo "📚 Installing dependencies..."
uv sync

# Create persistent data directory
mkdir -p persistent-data

echo "✅ Setup complete!"
echo ""
echo "To start CodeAssist, run:"
echo "  uv run run.py"
echo ""
echo "Then use Web Preview on port 3000 to access the UI"
