#!/bin/bash

# Change to the python-app directory and activate virtual environment
cd python-app

if [ -d "./.venv" ]; then
    source ./.venv/bin/activate
    echo "Python virtual environment activated."
else
    echo "Python virtual environment not found. Please set it up first."
    exit 1
fi

# Run the Python app
if [ -f "app.py" ]; then
    python app.py &
    PYTHON_PID=$!
    echo "Python app is running (PID: $PYTHON_PID)."
else
    echo "Python app (app.py) not found."
    deactivate
    exit 1
fi

# Deactivate virtual environment and go back to root
deactivate
cd ..

# Change to the node-app directory and run the Node.js app
cd node-app

if [ -f "server.js" ]; then
    node server.js &
    NODE_PID=$!
    echo "Node.js app is running (PID: $NODE_PID)."
else
    echo "Node.js app (server.js) not found."
    exit 1
fi

# Go back to root directory
cd ..

echo "Both applications are running. Press Ctrl+C to stop all processes."

# Function to clean up processes on script exit
cleanup() {
    echo "Stopping applications..."
    if [ ! -z "$PYTHON_PID" ]; then
        kill $PYTHON_PID 2>/dev/null
        echo "Python app stopped."
    fi
    if [ ! -z "$NODE_PID" ]; then
        kill $NODE_PID 2>/dev/null
        echo "Node.js app stopped."
    fi
    exit 0
}

# Set up signal handlers
trap cleanup SIGINT SIGTERM

# Wait for background processes to finish
wait