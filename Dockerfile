# First stage: Build the binary
FROM golang:1.22.2-alpine3.19 as builder

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

# Second stage: Create the final image from distroless
FROM gcr.io/distroless/static-debian12

# Copy the binary from the first stage
COPY --from=builder /go-app/build/fizzbuzz /fizzbuzz

# Copy the templates folder from the first stage
COPY --from=builder /go-app/templates /templates

# Command to run the executable
CMD ["/fizzbuzz", "serve"]
