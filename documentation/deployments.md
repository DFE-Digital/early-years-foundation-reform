### Deployment

Github workflow is used to deploy to environments on Gov.uk PaaS.

Upon merging a PR to `main` a deployment to the development environment will be triggered. This will:

1. Checkout the branch
1. Login to Docker Hub
1. Build docker image
1. Upload docker image to Docker Hub
1. Initialise Terraform
1. Run the Terraform plan
1. Apply the Terraform changes
