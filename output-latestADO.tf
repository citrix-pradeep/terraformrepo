#output.tf

output "Project_ID" {
  value = azuredevops_project.terraform_ado_project.id
}

output "Boards_Status" {
  value = azuredevops_project.terraform_ado_project.features["boards"]
}

output "Repositories_Status" {
  value = azuredevops_project.terraform_ado_project.features["repositories"]
}

output "TestPlans_Status" {
  value = azuredevops_project.terraform_ado_project.features["testplans"]
}


output "project" {
  value = data.azuredevops_project.terraform_ado_project
}

output "project_setup_instructions" {
  value = "To finish project setup, follow the instructions at https://github.com/quilter-plc/devops/wiki/ADO-Project-Setup"
}

output "disable_pipelines_instructions" {
  value = "To disable 'Disable creation of classic build pipelines' and 'Disable creation of classic release pipelines' go to project url and enable the options. Project url is $OrganizationName/$projectName/_settings/settings" 
}