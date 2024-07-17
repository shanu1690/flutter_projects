# Use a Debian-based image as the base image
FROM debian:bullseye-slim as build

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    git \
    xz-utils \
    libglu1-mesa \
    && apt-get clean

# Set environment variables
ENV FLUTTER_VERSION=3.22.2
ENV FLUTTER_HOME=/usr/local/flutter
ENV PATH="${FLUTTER_HOME}/bin:${PATH}"

# Download and install Flutter
RUN curl -Lo flutter.tar.xz "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz" \
    && mkdir -p ${FLUTTER_HOME} \
    && tar -xf flutter.tar.xz -C ${FLUTTER_HOME} --strip-components=1 \
    && rm flutter.tar.xz

# Enable Flutter web
RUN flutter config --enable-web

# Create a non-root user
RUN useradd -m flutteruser

# Change ownership of the Flutter directory
RUN chown -R flutteruser:flutteruser ${FLUTTER_HOME}

# Switch to the non-root user
USER flutteruser

# Set working directory
WORKDIR /app

# Copy pubspec files and get dependencies
COPY --chown=flutteruser:flutteruser pubspec.* ./
RUN flutter pub get

# Copy the entire project and build the web app
COPY --chown=flutteruser:flutteruser . .

# Ensure Flutter dependencies are up-to-date
RUN flutter pub get

# Build the Flutter web app
RUN flutter build web --release

# Use Nginx to serve the web app
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
