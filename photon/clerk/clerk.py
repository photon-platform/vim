import os
import requests
import json

API_KEY = os.environ["CODESTRAL_API_KEY"]
BASE_URL = "https://codestral.mistral.ai/v1"


def make_request(url, data):
    """
    Make a request to the CodeStral API.

    Args:
        url (str): The URL to make the request to.
        data (dict): The data to send with the request.

    Returns:
        dict: The response from the API.
    """

    headers = {"Authorization": f"Bearer {API_KEY}", "Content-Type": "application/json"}
    response = requests.post(url, headers=headers, json=data)
    if response.status_code == 200:
        response_data = response.json()
        return {"status": "success", "data": response_data}
    else:
        return {
            "status": "error",
            "code": response.status_code,
            "message": response.text,
        }


def get_chat(prompt, model="codestral-latest"):
    """
    Generate a chat completion for a prompt.

    Args:
        prompt (str): The prompt to generate a completion for.
        model (str, optional): The model to use for generation. Defaults to "codestral-latest".

    Returns:
        str: The generated completion.
    """


    url = f"{BASE_URL}/chat/completions"
    data = {
        "model": model,
        "messages": [
            {
                "role": "user",
                "content": prompt,
            }
        ],
    }
    response = make_request(url, data)
    if response["status"] == "success":
        return response["data"]["choices"][0]["message"]["content"]
    else:
        return f"Error {response['code']}: {response['message']}"


def get_fim(prompt, suffix, model="codestral-latest"):
    """
    Generate a completion for a prompt with a suffix.

    Args:
        prompt (str): The prompt to generate a completion for.
        suffix (str): The suffix to append to the completion.
        model (str, optional): The model to use for generation. Defaults to "codestral-latest".

    Returns:
        str: The generated completion.
    """

    url = f"{BASE_URL}/fim/completions"
    data = {
        "model": model,
        "prompt": prompt,
        "suffix": suffix,
    }
    response = make_request(url, data)
    if response["status"] == "success":
        return response["data"]["choices"][0]["message"]["content"]
    else:
        return f"Error {response['code']}: {response['message']}"


if __name__ == "__main__":
    import sys

    command = sys.argv[1]
    if command == "chat":
        prompt = sys.argv[2]
        print(get_chat(prompt))
    elif command == "fim":
        prompt = sys.argv[2]
        suffix = sys.argv[3]
        print(get_fim(prompt, suffix))
