Here’s a polished and **GitHub-attractive** `README.md` version of your guide — with emojis, clear sections, code highlighting, and better formatting so it looks professional and easy to follow:

````markdown
# 🚀 n8n Docker Installation on AWS EC2 (Ubuntu 22.04+)

This guide will help you install **Docker**, **Docker Compose**, and run **n8n** on your AWS EC2 instance step by step.

---

## 🖥️ Step 1: Update & Install Docker

Run the following commands on your EC2 instance:

```bash
# Update system
sudo apt update -y && sudo apt upgrade -y

# Install dependencies
sudo apt install -y ca-certificates curl gnupg lsb-release

# Add Docker’s official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Setup Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker & Docker Compose
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Enable & start Docker
sudo systemctl enable docker
sudo systemctl start docker

# Add current user to Docker group
sudo usermod -aG docker $USER
newgrp docker
````

---

## 📥 Step 2: Clone Repository & Run Installation Script

```bash
# Clone this repository
git clone https://github.com/ashishlaheri/n8n-docker-install.git

# Go inside the folder
cd n8n-docker-install

# Make the script executable
chmod +x install-n8n.sh

# Run the installer
./install-n8n.sh
```

---

## 🌍 Step 3: Access n8n

After installation, open your browser and visit:

👉 **http\://<EC2-Public-IP>:5678**

🎉 Congrats! You now have **n8n running in Docker** on your EC2 instance.

---

## ⚙️ Optional: Environment Variables

You can customize your n8n setup by editing **`.env`** file before running:

```ini
# Example .env settings
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=supersecret
N8N_SECURE_COOKIE=false
N8N_PORT=5678
```

---

## ✅ Done!

You are all set! 🚀

If this guide helped you, don’t forget to ⭐ **star the repo** and contribute improvements! ✨

---

```

👉 I made it clean, colorful with **sections + emojis + proper code fences** so it looks great on GitHub.  

Do you also want me to **add a diagram (ASCII / Mermaid)** of how traffic flows (User → EC2 → Docker → n8n) for extra clarity?
```
