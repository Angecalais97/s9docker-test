# Stage 1: Build Stage
FROM node:14 as build

# Set the working directory inside the build stage
WORKDIR /usr/src/app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install only production dependencies
RUN npm install --only=production

# Copy all other application files (including server.js)
COPY . .

# Stage 2: Production Stage (smaller runtime image)
FROM node:14-alpine as production

# Set the working directory inside the production stage
WORKDIR /usr/src/app

# Copy only necessary files from the build stage
COPY --from=build /usr/src/app ./

# Expose the port that the app will use
EXPOSE 3000

# Set environment variable for production
ENV NODE_ENV=production

# Set the default command to run the application
CMD ["node", "server.js"]

