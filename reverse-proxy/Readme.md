# HTTP Reverse Proxy

Build Docker image with: `docker build -t reverse-proxy .`

Start container with: `docker run --rm --name reverse-proxy -p 8080:8080 -v ~/logs:/var/log/nginx reverse-proxy`

