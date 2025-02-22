terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0.1"
    }
  }
}

variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

provider "github" {
  token = var.github_token
  owner = "SebastianOG509"
}

# Crear un repositorio en GitHub
resource "github_repository" "repository_auto_init" {
  name        = "ArquiTICS_Terraform_Lab_IaC"
  description = "Laboratorio de IaC con Terraform"
  auto_init   = true
  visibility  = "public"

  template {
	  owner = "toidicode"
	  repository = "template"
    
  }
}

# Crear ramas adicionales
resource "github_branch" "development" {
  repository = github_repository.repository_auto_init.name
  branch     = "development"
  source_branch = "master" 
}

resource "github_branch" "staging" {
  repository = github_repository.repository_auto_init.name
  branch     = "staging"
  source_branch = "master" 
}

resource "github_branch" "production" {
  repository = github_repository.repository_auto_init.name
  branch     = "production"
  source_branch = "master" 
}
