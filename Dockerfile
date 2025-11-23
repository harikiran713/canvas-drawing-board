# Simple static web server with nginx
FROM nginx:alpine

# Remove default nginx index
RUN rm -rf /usr/share/nginx/html/*

# Copy our static files
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 (Railway will map this)
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
