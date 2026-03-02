# Introduction to Terraform

This small project is a beginner-friendly introduction to **Terraform** using the Google Cloud provider. The goal is to walk you through the basic workflow and show simple resources so you can start building infrastructure-as-code immediately.

---

## 🚀 Before You Begin

1. **Install Terraform**
   - Download the appropriate ZIP from https://www.terraform.io/downloads.html
   - Unzip and rename the binary to `terraform`
   - Move it into a folder such as `C:\Program Files\terraform`
   - Add that folder to your `PATH` environment variable.
   - Verify by running:
     ```bash
     terraform --version
     ```

2. **Set up a Cloud Service Account**
   - In your cloud provider console (e.g. GCP, AWS, Azure) create a service account with enough permissions for the resources you’ll manage.
   - Download the credentials JSON file and place it under `keys/` in this project (e.g. `keys/my-creds.json`).

3. **Optional tooling**
   - Open the project in Visual Studio Code: from the command line run `code .` inside the `Introduction to Terraform` folder.
   - Enable the [HashiCorp Terraform extension](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform) for syntax highlighting and linting.

---

## 📁 Project Structure

```
Introduction to Terraform/
  ├─ main.tf          # Terraform configuration
  ├─ variables.tf     # (you can create this to store variables)
  ├─ keys/
  │    └─ my-creds.json  # your service account credentials (ignored by Git)
  └─ README.md        # this file
```

> The `.gitignore` already ignores `*.json` files so credentials stay out of source control.

---

## 🔑 Credentials & Authentication

Terraform needs to know where your cloud credentials are stored.

### Option 1: Specify in the provider block
```hcl
provider "google" {
  credentials = file("./keys/my-creds.json")
  project     = "ai-projects-280725"
  region      = "us-central1"
}
```

### Option 2: Use environment variables
- **Windows CMD**
  ```bat
  set GOOGLE_CREDENTIALS="C:/Users/Dell/My Drive/GCP Learning 2026/Introduction to Terraform/keys/my-creds.json"
  echo %GOOGLE_CREDENTIALS%
  ```
- **Linux/macOS**
  ```bash
  export GOOGLE_CREDENTIALS='C:/Users/Dell/My Drive/GCP Learning 2026/Introduction to Terraform/keys/my-creds.json'
  ```

> If you have the Google Cloud SDK installed, you can also run `gcloud auth login` and Terraform will pick up the credentials automatically.

---

## 📦 Basic Terraform Commands

These are the essential commands you’ll use repeatedly:

1. `terraform init`  – download required providers and initialize the working directory
2. `terraform plan`  – see a preview of what Terraform will do
3. `terraform apply` – apply the configuration to create or modify resources
4. `terraform destroy` – remove all resources defined in your configuration
5. `terraform fmt`   – automatically format your `.tf` files

Run them from the `Introduction to Terraform` folder where your `.tf` files live.

---

## 🧪 Sample Command Workflows

Here are a few common command sequences with explanations so you know exactly what will happen:

```bash
# 1. Initialize the project (run once per directory)
terraform init
```
Downloads provider plugins and creates the `.terraform` directory. Nothing is created in your cloud account yet.

```bash
# 2. Preview changes before making them
terraform plan -out=tfplan
```
Shows a human-readable diff of actions Terraform will take. The `-out` option writes a binary plan file you can later apply safely.

```bash
# 3. Apply the plan produced above
terraform apply "tfplan"
```
Applies exactly the actions in `tfplan` (i.e. create bucket, dataset, etc.). You’ll be prompted to confirm unless you pass `-auto-approve`.

```bash
# 4. Skip planning and apply in one step
terraform apply -auto-approve
```
Directly evaluates and performs changes based on current configuration. Good for quick experiments but avoid in production.

```bash
# 5. Clean up everything you created
terraform destroy -auto-approve
```
Removes all managed resources, leaving your cloud account in the state it was before you ran Terraform. Useful for tearing down a test environment.
```

Each command works with the configuration files in the current directory. Always run `plan` before `apply` when you’re unsure what will change — it’s your safety check!

---

## 🛠 Sample Resources

This project already has examples showing how to create two common Google Cloud resources. You can copy, modify, or extend them.

### Google Cloud Storage Bucket
```hcl
resource "google_storage_bucket" "demo_bucket" {
  name          = var.gcs_bucket_name
  location      = var.Location
  storage_class = var.gcs_storage_class
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}
```

### BigQuery Dataset
```hcl
resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id                  = var.bq_dataset_name
  location                    = var.Location
  default_table_expiration_ms = 3600000
  delete_contents_on_destroy  = true
}
```

> These use variables such as `var.Location` or `var.gcs_bucket_name`. Define them in a `variables.tf` file or pass them via `-var` when running Terraform.

---

## 🎓 Tips for Beginners

- Think of Terraform files (`*.tf`) as a description of your desired infrastructure state.
- Always run `terraform plan` before `apply` so you know what changes will occur.
- Keep sensitive data (API keys, passwords) out of your configuration and use variables or environment variables.
- Experiment in a disposable project or a sandbox account to learn without risking production resources.

Enjoy building with Terraform, and don’t hesitate to explore the [official docs](https://www.terraform.io/docs) for deeper learning!
