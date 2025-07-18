#!/bin/bash

# Update package lists
sudo apt-get update -y

# Install Docker
sudo apt-get install -y docker.io

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Create a simple index.html file
# This creates the static content that will be served.
cat <<EOF > /tmp/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to the DevOps Challenge!</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin-top: 100px; }
        h1 { color: #333; }
    </style>
</head>
<body>
    <h1>Success! Your static page is being served from a container.</h1>
</body>
</html>
EOF

# Run an Nginx container
# This command pulls the official Nginx image and runs it as a container.
# -d: runs the container in detached mode (in the background).
# -p 80:80: maps port 80 on the host (the VM) to port 80 in the container.
# -v /tmp/index.html:/usr/share/nginx/html/index.html:ro : mounts our custom index.html file into the container.
sudo docker run --name nginx-web -d -p 80:80 -v /tmp/index.html:/usr/share/nginx/html/index.html:ro nginx:latest
