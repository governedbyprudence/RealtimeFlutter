from fastapi import FastAPI, WebSocket
import time
import bson
import random
app = FastAPI()

@app.websocket("/ws")
async def data(websocket: WebSocket):
    await websocket.accept()
    while True:
        a = str(random.randint(0,110))
        data = bson.dumps({"number":a})
        await websocket.send_bytes(data)
        time.sleep(0.2)

