# Pipeline Workflow

## default tag
- used to specifically use the GitLab Runner configured locally with the tags `maven` and `shell` (shell executor).

## `myapp-build`
-  checks if maven is installed (`mvn --version`) and then, it executes `mvn compile` which compiles the raw `.java` source code into an executable `.class` bytecode.

## `myapp-test`
- invokes `mvn test` which automatically locates the test frameworks and compiles the test file and executes them.

## `myapp-package`
- runs `mvn package` which automatically build, test and packages everythin into an executable jar file.
- `artifacts: paths: -target/` instructs gitlab to store the generated `.jar` file as artifacts in GitLab server.

## `myapp-run`
- runs the `.jar` file generated after the package process from `~/.m2/repository`
