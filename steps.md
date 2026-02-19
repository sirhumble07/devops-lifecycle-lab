# Professional DevOps Project Setup & Deployment Guide

## 1. Prerequisites

- Docker installed and running on your machine
- Python 3.11+
- GitHub account and repository access
- (Optional) Self-hosted GitHub Actions runner configured

## 2. Project Structure

```text
repo-root/
├── app/                # FastAPI application code
│   ├── __init__.py
│   └── main.py
├── infra/              # Infrastructure as code (Terraform, monitoring, etc.)
│   ├── terraform/
│   └── monitoring/
├── .github/
│   └── workflows/
│       └── ci.yml      # CI/CD workflow
├── Dockerfile
├── requirements.txt
├── README.md
└── steps.md            # This guide
```

## 3. Local Development

1. Clone the repository:

   ```sh
   git clone <your-repo-url>
   cd <your-repo>
   ```

2. (Optional) Create a virtual environment and install dependencies:

   ```sh
   python -m venv venv
   source venv/bin/activate
   pip install -r requirements.txt
   ```

3. Run the FastAPI app locally:

   ```sh
   uvicorn app.main:app --reload
   ```

## 4. Docker Build & Run

1. Build the Docker image:

   ```sh
   docker build -t fastapi-app .
   ```

2. Run the container:

   ```sh
   docker run -d -p 8000:8000 fastapi-app
   ```

3. Access the app at [http://localhost:8000](http://localhost:8000)

## 5. CI/CD with GitHub Actions

- The workflow in `.github/workflows/ci.yml` will automatically build and (optionally) test your app on push.
- For self-hosted runners, ensure Docker is installed and the runner has access to the Docker daemon.

## 6. Infrastructure as Code

- Place Terraform and monitoring scripts in the `infra/` directory.
- Use best practices for IaC: version control, state management, and modularization.

## 7. Troubleshooting

- **Dockerfile not found:** Ensure `Dockerfile` (capital D) is at the repo root.
- **Docker permission errors:** Add your user to the `docker` group or run Docker as admin.
- **Port conflicts:** Stop any process using port 8000 before running the container.
- **Workflow errors:** Check runner logs and ensure all dependencies are installed.

---
For more details, see the README.md or contact the DevOps team.
