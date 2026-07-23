# Pipeline Workflow

## default tag
- Used to target the GitLab Runner configured locally with the required tags (`devops`, `maven`, `shell` or `docker`) to execute respective stages.

## `myapp-build-test`
- Operates using the **Shell executor** directly on the host machine.
- Verifies the local Maven installation (`mvn --version`) and executes `mvn clean package` to clean, compile, test, and bundle the source code into an executable JAR file.
- Saves the generated `.jar` file under `target/` as an **artifact** with a 1-week expiration so it can be passed securely to the next stage.

## `docker-build-push`
- Operates using the **Docker executor** with Docker-in-Docker (DinD) enabled.
- Takes the compiled `.jar` artifact and runs `docker build` (passing build arguments) to containerize the application using the local `Dockerfile`.
- Securely logs into **Docker Hub** using encrypted CI/CD variables, tags the image, pushes it to the public/private repository, and logs out.
- Securely logs into the **GitLab Container Registry** using built-in authentication tokens (`$CI_REGISTRY_USER`, `$CI_REGISTRY_PASSWORD`), tags the image, pushes it, and logs out.