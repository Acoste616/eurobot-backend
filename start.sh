#!/bin/bash

echo "🚀 Strapi Backend - Local Setup"
echo "================================"
echo ""

# Check if .env exists
if [ ! -f .env ]; then
    echo "⚠️  .env file not found!"
    echo "📋 Copying .env.example to .env..."
    cp .env.example .env
    echo "✅ Done! Please edit .env with your database credentials."
    echo ""
fi

# Check if node_modules exists
if [ ! -d node_modules ]; then
    echo "📦 Installing dependencies..."
    npm install
    echo ""
fi

echo "🔧 Starting development server..."
echo "Admin panel will be available at: http://localhost:1337/admin"
echo ""

npm run develop
