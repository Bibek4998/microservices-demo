Capstone Demo Checklist
- [ ] Populate GitHub secrets: DOCKERHUB_USERNAME, DOCKERHUB_TOKEN
- [ ] Review Dockerfiles for each service (entrypoints, ports)
- [ ] Update Helm values for image.repo and tag
- [ ] Configure Terraform AWS credentials and backend
- [ ] Run demo_script.sh locally to smoke-test
- [ ] Run terraform apply to provision EKS (careful: costs)
