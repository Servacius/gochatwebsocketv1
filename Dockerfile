FROM golang:latest

# Set the Current Working Directory inside the container
WORKDIR /app

RUN GO111MODULE=on

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

COPY . .

# Build the application
RUN go build -o main .

# Expose port 5000 to the outside world
EXPOSE 5000

# Command to run the executable
CMD ["./main"]