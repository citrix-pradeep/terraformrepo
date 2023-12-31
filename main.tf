resource "github_repository" "git_repo" {
  name        = "terraformrepo"
  description = "My awesome codebase"

  visibility         = "public"
  has_issues         = true
  has_wiki           = true
  auto_init          = true
  license_template   = "mit"
  gitignore_template = "VisualStudio"
}


#Set default branch 'master'
resource "github_branch_default" "main" {
  repository = github_repository.git_repo.name
  branch     = "main"
}



#Create branch protection rule to protect the default branch. (Use "github_branch_protection_v3" resource for Organisation rules)
resource "github_branch_protection" "default" {
  repository_id                   = github_repository.git_repo.id
  pattern                         = github_branch_default.main.branch
  require_conversation_resolution = true
  enforce_admins                  = true

  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}