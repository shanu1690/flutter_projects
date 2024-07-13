# Use an official Dart runtime as a parent image
FROM dart:stable

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any dependencies
RUN dart pub get

# Build the Flutter web app
RUN flutter build web --release

# Expose port 8080 for the web server
EXPOSE 8080

# Run the app
CMD ["dart", "run", "build/web"]
