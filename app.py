from flask import Flask, request, jsonify
import speech_recognition as sr

app = Flask(__name__)

@app.route('/', methods=['POST'])
def speech_to_text():
    # Get WAV file from request
    file = request.files['file']
    # Convert to WAV file to text
    r = sr.Recognizer()
    with sr.AudioFile(file) as source:
        audio = r.record(source)
    text = r.recognize_google(audio)
    # Return text
    return jsonify({'text': text})

if __name__ == '__main__':
    app.run(debug=True, threaded=True)
    