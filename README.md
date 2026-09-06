# 🛡️ Automated Secure Containerized CI/CD Pipeline

A production-ready DevSecOps pipeline built with **GitHub Actions**, **Trivy Security Scanner**, and **Docker** to implement Shift-Left security standards for a Node.js application.

## 📊 Pipeline Architecture Diagram

```mermaid
graph TD
    A[Developer Code Push / PR] -->|Triggers Workflow| B(GitHub Actions Runner)
    B --> C[Step 1: Checkout Source Code]
    C --> D[Step 2: Run Trivy Security Scan]
    D -->|If CRITICAL/HIGH Vulnerability Found| E[FAIL & Block PR Merge]
    D -->|If SAFE / No Vulnerability| F[Step 3: Secure Login to Docker Hub]
    F --> G[Step 4: Build Hardened Docker Image]
    G -->|Alpine Base + Non-Root User| H[Step 5: Push Image to Docker Hub Registry]
```

## 🏗️ Architecture & Workflow
1. **Developer Push / PR:** Code change triggers the GitHub Actions workflow on the `main` branch.
2. **SCA Security Scan:** **Trivy** executes a File System (`fs`) scan on `package.json` to catch critical/high vulnerabilities and hardcoded secrets before containerization.
3. **Docker Login:** Authenticates securely with Docker Hub using encapsulated **GitHub Repository Secrets**.
4. **Image Hardening & Push:** Builds a secure Docker image using an optimized **Alpine base image** and configures a **Non-Root User (`USER node`)** to mitigate privilege escalation risks, then pushes it to Docker Hub.

## 🛠️ Tech Stack & Tools
- **Automation:** GitHub Actions (CI/CD)
- **Security Scanner:** Aqua Security Trivy
- **Containerization:** Docker (Multi-stage & User Hardening)
- **Environment:** Linux (WSL / Ubuntu-latest Runner)
- **Backend Framework:** Node.js / Express
