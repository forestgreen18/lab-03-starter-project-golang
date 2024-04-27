# Use Alpine-based Golang image for a small footprint
FROM golang:1.22.2-alpine3.19

# Set the working directory in the container
WORKDIR /go-app

# Copy and download dependency files
COPY go.mod .
COPY go.sum .
RUN go mod download

# Copy the source code
COPY . .

# Build the application
RUN go build -o build/fizzbuzz

# Command to run the executable with "serve" argument
CMD ["./build/fizzbuzz", "serve"]
