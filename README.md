# 🚀 CI/CD Pipeline for Python Application using Jenkins, SonarQube, Docker & Kubernetes

[![Build Status](https://img.shields.io/badge/Jenkins-Build%20Passing-brightgreen?logo=jenkins)]()
[![Docker Ready](https://img.shields.io/badge/Docker-Image%20Available-blue?logo=docker)]()
[![SonarQube Quality](https://img.shields.io/badge/Code%20Quality-A%20Grade-brightgreen?logo=sonarqube)]()
[![Kubernetes Deployed](https://img.shields.io/badge/Kubernetes-Running%20on%20Cluster-blue?logo=kubernetes)]()
[![License](https://img.shields.io/badge/License-MIT-yellow)]()

---

## 🧠 Overview

This project demonstrates a **complete CI/CD pipeline** built for a **Python Flask application**.  
It uses **Jenkins** for automation, **SonarQube** for code quality analysis, **Docker** for containerization, and **Kubernetes** for deployment.  

The pipeline covers:
- 🧩 Continuous Integration (Code build + analysis)
- ☁️ Continuous Deployment (Automated deploy on K8s)
- 🐳 Containerization (Docker)
- 🧠 Code Quality Check (SonarQube)

---

## 🧰 Tech Stack

| Component | Technology | Purpose |
|------------|-------------|----------|
| 🐍 Backend | **Python (Flask)** | Application logic |
| ☸️ Orchestration | **Kubernetes** | Deployment management |
| 🧩 CI/CD | **Jenkins** | Pipeline automation |
| 🧠 Code Quality | **SonarQube** | Static code analysis |
| 🐳 Containerization | **Docker** | Build and run containers |
| 💾 Repository | **GitHub** | Source code management |

---

## 🧱 Pipeline Architecture

```mermaid
flowchart TD
A[Developer pushes code to GitHub] --> B[Jenkins triggers build]
B --> C[SonarQube - Static Code Analysis]
C --> D[Docker - Build Image]
D --> E[DockerHub - Push Image]
E --> F[Kubernetes - Deploy to Cluster]
F --> G[Application Running Successfully 🚀]


