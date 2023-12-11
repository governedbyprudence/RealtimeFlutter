from fastapi import FastAPI, WebSocket
import time
import random
app = FastAPI()

@app.websocket("/ws")
async def data(websocket: WebSocket):
    await websocket.accept()
    while True:
        await websocket.send_text(str(random.randint(0,110)))
        time.sleep(1)

