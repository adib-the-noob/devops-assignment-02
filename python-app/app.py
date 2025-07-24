import uvicorn
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def read_root():
    return {
        "status": "success",
        "message": "Hello, from Python App running in Port 5000!"
    }

if __name__ == "__main__":
    uvicorn.run(app, host="localhost", port=5000)