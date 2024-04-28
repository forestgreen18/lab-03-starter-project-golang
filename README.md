# Golang-App Project

This project contains a Go application with a web server that serves content from the `templates` directory.

## Building the Docker Image

To build the Docker image for this project, run the following command in the terminal:

```bash
docker build -t golang-app .
```

This command will use the `Dockerfile` in the current directory to build the Docker image and tag it as `golang-app`.

## Running the Docker Container

Once the image is built, you can run the container using the following command:

```bash
docker run -d -p 8080:8080 golang-app
```

Replace `8080:8080` with the appropriate port mapping if your application listens on a different port. The `-d` flag runs the container in detached mode, allowing the terminal to be used for other commands.

## Accessing the Application

After the container starts, you can access the application by navigating to `http://localhost:8080` in your web browser. Ensure that the port number matches the one you specified in the `docker run` command.
