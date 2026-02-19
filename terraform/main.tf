terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

resource "docker_image" "app" {
  name = "fastapi-app"
  build {
    context = "../app"
  }
}

resource "docker_container" "app" {
  name  = "fastapi-container"
  image = docker_image.app.image_id

  ports {
    internal = 8000
    external = 8000
  }
}
