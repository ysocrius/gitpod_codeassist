# Running CodeAssist on Ona Cloud 🚀

This guide helps you run CodeAssist on Ona Cloud with auto-configuration.

## Quick Setup

### 1. Configure Project Settings

In your Ona Cloud dashboard:

#### **Environment Class**: 
Choose **"Regular"** (4 vCPU / 16 GiB / 80 GiB disk)
- Small instance may not have enough resources for Docker + ML training

#### **Branch**: 
`main`

#### **Automations file path**: 
`.ona/automations.yaml` (already configured!)

---

### 2. Add Your HuggingFace Token

**Required before starting!**

1. Get your token from: https://huggingface.co/settings/tokens
   - Click "Create new token"
   - Name: `CodeAssist-Ona`
   - Type: **Write** access
   - Copy the token

2. In Ona Cloud, go to **"Secrets"** tab
3. Add secret:
   - **Name**: `HF_TOKEN`
   - **Value**: (paste your HuggingFace token)
   - **Description**: HuggingFace API token for CodeAssist

---

### 3. Launch Workspace

Click **"Launch"** or **"Start Workspace"** button

The `.ona/automations.yaml` will automatically:
- ✅ Install Docker & Docker Compose
- ✅ Install UV package manager
- ✅ Setup Python dependencies
- ✅ Create persistent data directory
- ✅ Configure port forwarding
- ✅ Display welcome instructions

**Initial setup takes ~3-5 minutes**

---

### 4. Start CodeAssist

Once the workspace loads and setup completes:

```bash
uv run run.py
```

Or use the automation task:
```bash
ona run start-codeassist
```

---

### 5. Access the Web UI

Ona Cloud will automatically forward port 3000:
- Look for the **"Ports"** panel
- Click the URL next to port **3000**
- Or look for notifications with the public URL

---

## What Gets Auto-Configured

The `.ona/automations.yaml` file handles:

### ✅ Ports Forwarded:
- `3000` - Web UI (public)
- `8000` - State Service (internal)
- `8001` - Policy Models (internal)
- `8008` - Solution Tester (internal)
- `11434` - Ollama LLM Server (internal)

### ✅ Environment Setup:
- Docker & Docker Compose
- Python 3.10+
- UV package manager
- Project dependencies

### ✅ VSCode Extensions (if supported):
- Python
- Pylance
- Docker

---

## Storage & Persistence

### What Persists:
- ✅ Your code in `/workspace`
- ✅ Training data in `persistent-data/`
- ✅ Secrets (like HF_TOKEN)
- ✅ Docker volumes

### What Doesn't Persist:
- ❌ Docker images (re-downloaded each session)
- ❌ System packages (reinstalled via automations.yaml)

**Tip**: Ona Cloud likely has faster persistent storage than typical cloud IDEs

---

## Resource Usage

### Regular Instance (Recommended):
- **4 vCPU** - Good for running all services
- **16 GiB RAM** - Enough for Docker + ML inference
- **80 GiB disk** - Space for models and training data

### When to Use Small:
- Just testing/browsing code
- Not running Docker containers
- Saves on costs if you're paying

---

## Troubleshooting

### Docker Not Available
```bash
# Check Docker status
sudo service docker status

# Start Docker if needed
sudo service docker start

# Verify
docker ps
```

### UV Command Not Found
```bash
# Reload shell environment
source $HOME/.cargo/env

# Or run setup again
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### HF_TOKEN Not Set
```bash
# Check if it's available
echo $HF_TOKEN

# If empty, add it in Ona Cloud Secrets UI
# Then restart the workspace
```

### Port 3000 Not Accessible
```bash
# Check what's running
netstat -tlnp | grep 3000

# Or check Ona ports panel
# Make sure port 3000 is marked as "public"
```

### Out of Memory
If training fails:
```bash
# Skip training for now
uv run run.py --no-train

# Or upgrade to Large instance (8 vCPU / 16+ GiB)
```

---

## Cost Considerations

Check your Ona Cloud pricing:
- **Free tier**: Check if available
- **Pay-as-you-go**: Stop workspace when not using
- **Monthly plans**: May be more economical for heavy use

### Save Resources:
1. **Stop workspace** when not coding
2. Use **Small instance** for browsing/editing
3. Switch to **Regular** only when running the app
4. **Delete old workspaces** you're not using

---

## Differences from Local Setup

| Feature | Local | Ona Cloud |
|---------|-------|-----------|
| Storage | Permanent | Persistent (but cloud-based) |
| Docker Images | Cached locally | Re-downloaded (fast on cloud) |
| Network | localhost | Ona public URLs |
| GPU | If available | Check Ona offerings |
| Backup | Manual | Automatic (via Git) |

---

## Running the Full Workflow

### 1. Code/Practice Session
```bash
uv run run.py
# Open Web UI, solve problems
# Press Ctrl+C when done
```

### 2. Training
After stopping the UI:
```bash
# Training starts automatically
# Or manually trigger if needed
```

### 3. View Results
```bash
# Check training logs
ls -la persistent-data/trainer/models/

# View TensorBoard (if available)
tensorboard --logdir persistent-data/trainer/
```

---

## Next Steps

1. ✅ Configure instance size → **Regular**
2. ✅ Add `HF_TOKEN` secret
3. ✅ Launch workspace
4. ✅ Wait for auto-setup (~3-5 min)
5. ✅ Run: `uv run run.py`
6. ✅ Start coding!

---

## Support & Resources

- **Ona Cloud Docs**: Check your Ona dashboard for documentation
- **CodeAssist Docs**: https://docs.gensyn.ai/testnet/codeassist
- **HuggingFace**: https://huggingface.co/docs
- **This Repo Issues**: Report problems on GitHub

---

**Ready to launch?** 🚀

Make sure your settings match:
- ✅ Environment: Regular (4 vCPU / 16 GiB)
- ✅ Branch: main
- ✅ Automations path: `.ona/automations.yaml`
- ✅ Secret added: `HF_TOKEN`

Then click **Launch Workspace**!
