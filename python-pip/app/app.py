from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/', methods=['GET'])
def root():
    return jsonify({"message": "Hello World"}), 200


def main():
    app.run(host='0.0.0.0')

if __name__ == '__main__':
    main()
