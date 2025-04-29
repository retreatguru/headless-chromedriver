FROM selenium/standalone-chrome:latest

USER root

# Install dumb-init
RUN apt-get update && apt-get install -y dumb-init

# Move original Chrome binary aside
RUN mv /opt/google/chrome/google-chrome /opt/google/chrome/google-chrome-bin

# Copy your custom Chrome launcher
COPY chrome /opt/google/chrome/google-chrome
RUN chmod +x /opt/google/chrome/google-chrome

# Expose port 4444 for chromedriver
EXPOSE 4444

# Replace entrypoint to use dumb-init and launch chromedriver manually
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["chromedriver", "--port=4444", "--whitelisted-ips="]
