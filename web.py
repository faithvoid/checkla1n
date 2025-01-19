from flask import Flask, request, jsonify
import subprocess
import os
import time

app = Flask(__name__)

# Shared secret password
SHARED_SECRET = "S4KUR4R41N"

# Function to check authorization
def check_authorization(request):
    auth_header = request.headers.get("Authorization")
    if auth_header == SHARED_SECRET:
        return True
    return False

# Actual code starts here

def jailbreak_function():
    try:
        subprocess.call(['sudo', 'checkra1n'])
        return {"message": "Running checkra1n - please be patient!"}
    except Exception as e:
        return {"error": str(e)}

@app.route('/jailbreak', methods=['GET'])
def jailbreak():
    if not check_authorization(request):
        return jsonify({"error": "Unauthorized"}), 401
    return jsonify(jailbreak_function())

def bypass_function1():
    try:
        subprocess.call(['sudo', './bypass-1.sh'])
        return {"message": "Running bypass - please be patient!"}
    except Exception as e:
        return {"error": str(e)}

@app.route('/bypass1', methods=['GET'])
def bypass1():
    if not check_authorization(request):
        return jsonify({"error": "Unauthorized"}), 401
    return jsonify(bypass_function1())

def bypass_function2():
    try:
        subprocess.call(['sudo', './bypass-2.sh'])
        return {"message": "Running bypass - please be patient!"}
    except Exception as e:
        return {"error": str(e)}

@app.route('/bypass2', methods=['GET'])
def bypass2():
    if not check_authorization(request):
        return jsonify({"error": "Unauthorized"}), 401
    return jsonify(bypass_function1())

def sandcastle_linux():
    try:
        subprocess.call(['sudo', './bypass-2.sh'])
        return {"message": "Running Project Sandcastle (Linux) - please be patient!"}
    except Exception as e:
        return {"error": str(e)}

@app.route('/linux', methods=['GET'])
def linux():
    if not check_authorization(request):
        return jsonify({"error": "Unauthorized"}), 401
    return jsonify(sandcastle_linux())

def sandcastle_android():
    try:
        subprocess.call(['sudo', './bypass-2.sh'])
        return {"message": "Running Project Sandcastle (Android) - please be patient!"}
    except Exception as e:
        return {"error": str(e)}

@app.route('/android', methods=['GET'])
def android():
    if not check_authorization(request):
        return jsonify({"error": "Unauthorized"}), 401
    return jsonify(sandcastle_android())



# Home

@app.route('/', methods=['GET'])
def home():
    return """
    sakurara1n:
    1. /jailbreak - Jailbreak your device.
    2. /bypass1 - Bypass your un-jailbroken device!
    3. /bypass2 - Bypass your jailbroken device!
    4. /android - Run Project Sandcastle (Android)
    5. /linux - Run Project Sandcastle (Linux)
    """

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
