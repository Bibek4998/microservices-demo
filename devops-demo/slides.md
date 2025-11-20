# Capstone DevOps Project — Demo Slides (Markdown)

## Slide 1 — Overview
- Project: Microservices Demo
- Goal: Show CI/CD, Docker, Kubernetes (EKS/kind), Terraform (AWS), Monitoring

## Slide 2 — Architecture
- Each microservice packaged as a container image
- Images built by GitHub Actions matrix pipeline
- Deployed to Kubernetes (Helm charts per service)
- Infra provisioned via Terraform (VPC, EKS, RDS, ALB)

## Slide 3 — CI/CD
- GitHub Actions workflow `/.github/workflows/ci-matrix.yaml`
- Builds images per service and pushes to DockerHub
- Secrets required: DOCKERHUB_USERNAME, DOCKERHUB_TOKEN

## Slide 4 — Local demo steps
1. Run `./devops-demo/demo_script.sh`
2. Ensure Docker, kind, helm installed
3. Inspect `charts/` for per-service values

## Slide 5 — AWS deployment notes
- Configure AWS credentials and terraform backend
- Adjust `terraform/variables.tf` as needed
- Use `terraform init` -> `terraform apply`

## Slide 6 — Next improvements
- Add liveness/readiness probes
- Add Prometheus/Grafana via Helm
- Add CI tests and security scanning

