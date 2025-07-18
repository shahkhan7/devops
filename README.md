# devops
 Devops Exercise files are included 

  1 terraform Main 
  2 terraform VAr
  3-Terraform Network
  4-terraform VM
  5-Sh script 

  CI/CD BAsic pipeline using Workflows included
This project includes a **GitHub Actions pipeline** — a set of automated steps that run every time we make changes to our code (like pushing updates). Its job is to help us **safely deploy infrastructure** (like virtual machines, databases, networks) to **Microsoft Azure** using a tool called **Terraform**.

Think of it as a smart robot that does the following:

1. Grabs the latest code.
2. Logs in to Azure for us.
3. Prepares the system to use Terraform.
4. Checks what changes would happen if we deployed.
5. (Optionally) Deploys those changes — or just shows what it *would* do.
6. Lets us know if everything went well or not.

---

## 🧱 What Is Terraform?

Terraform is a tool that lets us describe **infrastructure using code**. Instead of clicking through the Azure portal, we write down exactly what we want (e.g., "I want a virtual machine with 2 CPUs and 4GB RAM") in a file, and Terraform makes it happen automatically.

---

## 🛠️ How the Pipeline Works (in Simple Terms)

Every time we push code to the `main` branch:

### ✅ Step 1: Checkout the Code
GitHub grabs the latest version of our project code, including our Terraform configuration files.

### 🔐 Step 2: Log In to Azure
It uses a secure login (Service Principal) to access our Azure account and prepare for deployment.

### 🌍 Step 3: Set Up Terraform
It installs the Terraform tool so it can understand and work with our infrastructure code.

### 🧪 Step 4: Run Terraform Init
This prepares Terraform by setting up any backend configurations and downloading required modules.

### 🔍 Step 5: Run Terraform Plan
This shows us what *would* change in Azure — a preview, like:
> “Hey! I’m going to create a new virtual machine and delete this old one!”

No changes are made yet — it's just for review.

### 🚫 Step 6: Terraform Apply (Disabled Placeholder)
We’ve added a step that *pretends* to deploy the infrastructure, but doesn’t actually do it. In a real setup, this is where the actual changes would be made.

> ✅ This is safely commented out for now, so nothing will be created or changed in Azure unless we explicitly enable it.

### ✅ Step 7: Simulated Result
Just a placeholder step saying:
> “Everything worked!” (or could be updated to report failures).

---

## 🔐 Security & Safety

We use **secrets** in GitHub (secure variables) to store sensitive info like Azure credentials. These are **never visible** to anyone looking at the code.

---

## 🤓 Why Is This Useful?

- ✅ **Automatic**: No more manual deployment — the robot does it.
- ✅ **Repeatable**: Same result every time — no human errors.
- ✅ **Visible**: Everyone can see what will happen before anything is applied.
- ✅ **Safe**: We test the plan before doing anything live.

---

## 🧪 Want to Actually Deploy?

To make this actually create infrastructure in Azure:
1. Uncomment the `terraform apply` command in the pipeline file.
2. Ensure secrets like `AZURE_CREDENTIALS` are set up correctly in GitHub.
3. Push to the `main` branch or create a Pull Request!

---

## 📁 File Overview
# 🚀 CI/CD Pipeline for Azure Infrastructure using Terraform

This repository contains a GitHub Actions pipeline that automates infrastructure deployment to Microsoft Azure using Terraform.

## 🔧 What the Pipeline Does

On every push or pull request to the `main` branch, the pipeline:

1. **Checks out** the code from the repository.
2. **Authenticates** with Azure using a secure Service Principal.
3. **Sets up** Terraform CLI.
4. **Initializes** Terraform (`terraform init`).
5. **Generates a plan** of what infrastructure changes will happen (`terraform plan`).
6. **Placeholder for deployment** (`terraform apply`) – currently disabled for safety.
7. **Outputs a result** message indicating success/failure (simulated).

## 🔐 Secrets Used

- `AZURE_CREDENTIALS`: Azure Service Principal credentials in JSON format.

## 🛠️ To Enable Real Deployment

Uncomment the `terraform apply` line in `.github/workflows/terraform-deploy.yml`:
```bash
# terraform apply -auto-approve
