# ==========================================
# Phase 1: Smart & Secure Base Image Selection
# ==========================================
FROM node:20-alpine

# ==========================================
# Phase 2: Set Safe Workspace Directory
# ==========================================
WORKDIR /app

# ==========================================
# Phase 3: Smart Caching Layer (Fast Builds)
# ==========================================
COPY package*.json ./

# Install only production tools (No testing junk allowed - Security Best Practice!)
RUN npm install --only=production

# ==========================================
# Phase 4: Copy Source Code & Secure Ports
# ==========================================
COPY . .

# Expose the exact port used by the developer in server.js
EXPOSE 3000

# ==========================================
# Phase 5: Non-Root User Execution (Pro DevSecOps)
# ==========================================
USER node

# Start the application engine
CMD ["npm", "start"]
