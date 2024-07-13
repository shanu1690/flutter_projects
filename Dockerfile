# Use an official Dart runtime as a parent image
FROM dart:stable

# Install dependencies for Flutter
RUN apt-get update && apt-get install -y \
  git \
  curl \
  unzip \
  xz-utils \
  zip \
  libglu1-mesa


# Set Flutter version
ENV FLUTTER_VERSION=3.22.2

# Download and install Flutter SDK
RUN git clone -b stable https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Verify Flutter installation
RUN flutter doctor

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any dependencies
RUN flutter pub get

# Build the Flutter web app
RUN flutter build web --release

# Expose port 8080 for the web server
EXPOSE 8080

# Run the app
CMD ["flutter", "run", "-d", "web-server", "--web-port", "8080"]
