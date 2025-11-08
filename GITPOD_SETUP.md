# Running CodeAssist on Gitpod

This guide helps you run CodeAssist in a cloud environment using Gitpod.

## Quick Start

### 1. Open in Gitpod

Click this button (replace `YOUR-USERNAME` with your GitHub username):

```
https://gitpod.io/#https://github.com/YOUR-USERNAME/codeassist
```

Or add this button to your README:

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/YOUR-USERNAME/codeassist)

### 2. Set Your HuggingFace Token

Once the workspace loads:

```bash
export HF_TOKEN='your_huggingface_token_here'
```

**To make it persistent** (so you don't have to set it every time):
1. Go to https://gitpod.io/user/variables
2. Add variable: 
   - Name: `HF_TOKEN`
   - Value: `your_token`
   - Scope: `YOUR-USERNAME/codeassist`

### 3. Start CodeAssist

```bash
uv run run.py
```

### 4. Access the Web UI

Gitpod will automatically forward port 3000. Click the notification or:
- Look for the "Ports" tab at the bottom
- Click the URL next to port 3000
- Or use: `gp url 3000` to get the URL

## How It Works

The `.gitpod.yml` file automatically:
- ✅ Installs Docker and Docker Compose
- ✅ Installs UV package manager
- ✅ Sets up Python dependencies
- ✅ Creates persistent data directory
- ✅ Configures port forwarding

## Storage & Persistence

### What Persists:
- `/workspace/` directory (your code, persistent-data/)
- Environment variables (if set in Gitpod settings)

### What Doesn't Persist:
- Docker images (re-downloaded each session)
- System packages (reinstalled via .gitpod.yml)

**Tip**: To save time, Gitpod will "prebuild" your workspace when you push to GitHub.

## Managing Your 50 Free Hours

### Stop Workspace When Not Using:
```bash
# From terminal
gp stop

# Or: File → Stop Workspace
```

### Check Usage:
Visit https://gitpod.io/usage

### Auto-Timeout:
Workspaces automatically stop after 30 minutes of inactivity.

## Troubleshooting

### Docker Not Starting
```bash
sudo service docker start
docker ps
```

### UV Not Found
```bash
source $HOME/.cargo/env
```

### Port Not Accessible
```bash
# Check what's listening
gp ports list

# Make port public if needed
gp ports visibility 3000:public
```

### Out of Memory
Free tier has 8GB RAM. If training fails:
- Use `--no-train` flag to skip training
- Or upgrade to Gitpod Large workspace ($35/month, 16GB RAM)

## Cost Management

| Plan | Hours/Month | Workspace Size | Cost |
|------|-------------|----------------|------|
| Free | 50 | Standard (4-core, 8GB) | $0 |
| Standard | 100 | Standard | $9 |
| Large | 100 | Large (8-core, 16GB) | $35 |

**Pro Tip**: Use the free tier for coding/testing, and only run training sessions occasionally to stay within limits.

## Differences from Local Setup

| Feature | Local | Gitpod |
|---------|-------|--------|
| Storage | Permanent | 30GB, persists between stops |
| Docker Images | Cached | Re-downloaded (fast with prebuilds) |
| Network | localhost | Gitpod URLs (e.g., `https://3000-user-repo.ws.gitpod.io`) |
| GPU | If available | CPU only (on free tier) |

## Next Steps

1. **Fork this repo** to your GitHub account
2. **Add `.gitpod.yml`** (already done!)
3. **Set HF_TOKEN** in Gitpod variables
4. **Open in Gitpod** and start coding!

---

## Additional Resources

- [Gitpod Documentation](https://www.gitpod.io/docs)
- [CodeAssist Original Docs](https://docs.gensyn.ai/testnet/codeassist)
- [HuggingFace Tokens](https://huggingface.co/docs/hub/en/security-tokens)
