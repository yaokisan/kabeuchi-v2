from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from mangum import Mangum
import os

app = FastAPI(title="Kabeuchi v2 API", version="2.0.0")

# CORS設定
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Vercelでは動的なオリジンを許可
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/api")
async def root():
    return {"message": "Kabeuchi v2 API is running on Vercel"}

@app.get("/api/health")
async def health():
    return {"status": "healthy", "environment": "vercel"}

# Vercel用のハンドラー
handler = Mangum(app)