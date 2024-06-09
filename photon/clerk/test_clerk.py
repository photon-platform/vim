import json
from clerk import make_request, get_chat, get_fim

prompt = "def fibonacci(n: int):"
suffix = "n = int(input('Enter a number: '))\nprint(fibonacci(n))"

response = get_fim(prompt, suffix)
print(response)
