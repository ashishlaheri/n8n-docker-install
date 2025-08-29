# 🚀 n8n Docker Installation on AWS EC2 (Ubuntu 22.04+)

This guide will help you install **Docker**, **Docker Compose**, and run **n8n** on your AWS EC2 instance step by step.

---

## 🖥️ 1. Update Your System
```bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER
newgrp docker
git clone https://github.com/ashishlaheri/n8n-docker-install.git
cd n8n-docker-install
git clone https://github.com/ashishlaheri/n8n-docker-install.git
cd n8n-docker-install
chmod +x install-n8n.sh
./install-n8n.sh
Open your browser and go to:
http://<EC2-Public-IP>:5678
